/*
 * JOOS is Copyright (C) 1997 Laurie Hendren & Michael I. Schwartzbach
 *
 * Reproduction of all or part of this software is permitted for
 * educational or research use on condition that this copyright notice is
 * included in any copy. This software comes with no warranty of any
 * kind. In no event will the authors be liable for any damages resulting from
 * use of this software.
 *
 * email: hendren@cs.mcgill.ca, mis@brics.dk
 */

#include <stdlib.h>
#include <stdio.h>

/* Arbitrarily define max num of labels*/
int MAX_LABELS = 400;
int *labels_mapping_;

int initialized_flag_patterns = 0;

/* IDEAS
 * 1. Keep a map of CODE* to ints as a "to remove later" queue? But what if it changes?
 * 2.Instead of calling getfield, can we just put it in a register and a/iload it? Can we tell if we need to aload it or 
 * iload it?
 * 3. Check bench04/Board.j.inRange() It seems tohave a check which is exactly like what we look for in "improve_branching"
 * just with a dup. That's probably because in the end all of the things are anded so we need to keep the intermediate computations
 * Maybe there's a way to implement short circuiting?
 * 4. We should extend field_instantiate_object to allow for 1 or 2 arguments to the object. These are pretty common. 
 *   Also extend it so that we can instantiate as null? Does that happen often enough? Remember that these arguments can be coming
 *   from iloads, aloads,  ldc_string, or ldc_int which means there are a total 
 *   of 4 + 4*4 permutations. That's a lot of typing, is it worth it? NOTE: I did the one arg case, idk if we need the two arg case
 *   Is it totally sound to remove the dups? We need to see what happens if we want to use the same arg twice in a constructor.
 *   NOTE: I tested it, it performs two iloads not a dup, so we're fine
 * 5. The same possible short circuiting improvement (as in 3) exists in bench07/CoinRoomAction.performAction
 */


int initialize(CODE **c)
{
	int i;
	if(initialized_flag_patterns)
	{
		return 0;
	}
	labels_mapping_ = (int *) malloc(MAX_LABELS*sizeof(int)) ;
	initialized_flag_patterns = 1;
	for(i=0;i<MAX_LABELS;i++){
		labels_mapping_[i]=-1;
	}
	return 0;
}

/* iload x        iload x        iload x
 * ldc 0          ldc 1          ldc 2
 * imul           imul           imul
 * ------>        ------>        ------>
 * ldc 0          iload x        iload x
 *                               dup
 *                               iadd
 */

int simplify_multiplication_right(CODE **c)
{ int x,k;
	if (is_iload(*c,&x) && 
			is_ldc_int(next(*c),&k) && 
			is_imul(next(next(*c)))) {
		 if (k==0) return replace(c,3,makeCODEldc_int(0,NULL));
		 else if (k==1) return replace(c,3,makeCODEiload(x,NULL));
		 else if (k==2) return replace(c,3,makeCODEiload(x,
																			 makeCODEdup(
																			 makeCODEiadd(NULL))));
		 return 0;
	}
	return 0;
}

/* dup
 * astore x
 * pop
 * -------->
 * astore x
 */
int simplify_astore(CODE **c)
{ int x;
	if (is_dup(*c) &&
			is_astore(next(*c),&x) &&
			is_pop(next(next(*c)))) {
		 return replace(c,3,makeCODEastore(x,NULL));
	}
	return 0;
}

/* iload x
 * ldc k   (0<=k<=127)
 * iadd
 * istore x
 * --------->
 * iinc x k
 */ 
int positive_increment(CODE **c)
{ int x,y,k;
	if (is_iload(*c,&x) &&
			is_ldc_int(next(*c),&k) &&
			is_iadd(next(next(*c))) &&
			is_istore(next(next(next(*c))),&y) &&
			x==y && 0<=k && k<=127) {
		 return replace(c,4,makeCODEiinc(x,k,NULL));
	}
	return 0;
}

int positive_increment_no_store(CODE **c)
{ int x,k;
	if (is_iload(*c,&x) &&
			is_ldc_int(next(*c),&k) &&
			is_iadd(next(next(*c)))
			&& 0<=k && k<=127) {
		 return replace(c,3,makeCODEiinc(x,k,makeCODEiload(x, NULL)));
	}
	return 0;
}

/* goto L1
 * ...
 * L1:
 * goto L2
 * ...
 * L2:
 * --------->
 * goto L2
 * ...
 * L1:    (reference count reduced by 1)
 * goto L2
 * ...
 * L2:    (reference count increased by 1)  
 */
int simplify_goto_goto(CODE **c)
{ int l1,l2;
	if (is_goto(*c,&l1) && is_goto(next(destination(l1)),&l2) && l1>l2) {
		 droplabel(l1);
		 copylabel(l2);
		 return replace(c,1,makeCODEgoto(l2,NULL));
	}
	return 0;
}

/*
 * Changes the following idiom of setting a field to a string to remove the dup, pop, and swap
 * ldc "init"
 * dup
 * aload_0
 * swap
 * putfield Interpretor/state Ljava/lang/String;
 * pop
 */
int simplify_field_instantiate_string(CODE **c)
{
	char *constant ;
	char *fieldName ;
	int zero = -1;
	if (is_ldc_string(*c,&constant) && is_dup(next(*c)) && is_aload(next(next(*c)), &zero) && (zero == 0)
			&& is_swap(next(next(next(*c)))) && is_putfield(next(next(next(next(*c)))), &fieldName)
			&& is_pop(next(next(next(next(next(*c)))))) )
	{
		return replace(c,6, makeCODEaload(0,
												makeCODEldc_string(constant, 
												makeCODEputfield(fieldName, NULL))));
	}
	return 0;
}

/*
 * Changes the following idiom of setting a field to a constant to remove the dup, pop, and swap
*  iconst_0
*   dup
 *   aload_0
 *   swap
 *   putfield Interpretor/ioImported Z
 *   pop
 */
int simplify_field_instantiate_int_or_arg(CODE **c)
{
	int constant ;
	char *fieldName ;
	int zero = -1;
	if ((is_ldc_int(*c,&constant) || is_iload(*c,&constant) || is_aload(*c,&constant)) 
			&& is_dup(next(*c)) && is_aload(next(next(*c)), &zero) && (zero == 0)
			&& is_swap(next(next(next(*c)))) && is_putfield(next(next(next(next(*c)))), &fieldName)
			&& is_pop(next(next(next(next(next(*c)))))) )
	{
		if(is_ldc_int(*c,&constant))
		{
			return replace(c,6, makeCODEaload(0,
													makeCODEldc_int(constant, 
													makeCODEputfield(fieldName, NULL))));
		}
		else if (is_iload(*c,&constant))
		{
			return replace(c,6, makeCODEaload(0,
													makeCODEiload(constant, 
													makeCODEputfield(fieldName, NULL))));
		}
		else if (is_aload(*c,&constant))
		{
			return replace(c,6, makeCODEaload(0,
													makeCODEaload(constant, 
													makeCODEputfield(fieldName, NULL))));
		}
	}
	return 0;
}

/*
 * Changes the following idiom of setting a for an object field to remove the dup, pop, and swap
 *new joos/lib/JoosIO [object_ref]
 *dup [object_ref, object_ref]
	*invokenonvirtual joos/lib/JoosIO/<init>()V [object_ref]
	*dup [object_ref, object_ref]
	*aload_0 [object_ref, object_ref, this]
	*swap [object_ref, this, object_ref]
	*putfield Interpretor/f Ljoos/lib/JoosIO; [object_ref]
	*pop []
	* TODO what if the call to init() for the field takes arguments?
 */
int simplify_field_instantiate_object(CODE **c)
{
	char *newVar;
	char *initCall;
	char *fieldName ;
	int zero = -1;
	if (is_new(*c,&newVar) && is_dup(next(*c)) &&  is_invokenonvirtual(next(next(*c)), &initCall)
			&& is_dup(next(next(next(*c)))) &&
			is_aload(next(next(next(next(*c)))), &zero) && (zero == 0)
			&& is_swap(next(next(next(next(next((*c))))))) && is_putfield(next(next(next(next(next(next(*c)))))), &fieldName)
			&& is_pop(next(next(next(next(next(next(next(*c)))))))) )
	{
		/* TODO ensure that initCall really is init call */
		return replace(c,8, makeCODEaload(0,
												makeCODEnew(newVar, 
												makeCODEdup(
												makeCODEinvokenonvirtual(initCall,
												makeCODEputfield(fieldName, NULL))))));
	}
	return 0;
}

int simplify_field_instantiate_object_one_arg(CODE **c)
{
	char *newVar;
	char *initCall;
	char *fieldName ;
	char *string_arg;
	int int_arg;
	int zero = -1;
	if (is_new(*c,&newVar) && is_dup(next(*c)) 
			&& (is_ldc_string(next(next(*c)), &string_arg) || is_ldc_int(next(next(*c)), &int_arg) 
					|| is_iload(next(next(*c)), &int_arg) || is_aload(next(next(*c)), &int_arg))
			&& is_invokenonvirtual(next(next(next(*c))), &initCall)
			&& is_dup(next(next(next(next(*c))))) &&
			is_aload(next(next(next(next(next(*c))))), &zero) && (zero == 0)
			&& is_swap(next(next(next(next(next((next(*c)))))))) && is_putfield(next(next(next(next(next(next(next(*c))))))), &fieldName)
			&& is_pop(next(next(next(next(next(next(next(next(*c))))))))) )
	{
		if(is_ldc_string(next(next(*c)), &string_arg))
		{
			/* TODO ensure that initCall really is init call */
			return replace(c,9, makeCODEaload(0,
													makeCODEnew(newVar, 
													makeCODEdup(
													makeCODEldc_string(string_arg,
													makeCODEinvokenonvirtual(initCall,
													makeCODEputfield(fieldName, NULL)))))));
		}
		else if (is_ldc_int(next(next(*c)), &int_arg) )
		{
			return replace(c,9, makeCODEaload(0,
													makeCODEnew(newVar, 
													makeCODEdup(
													makeCODEldc_int(int_arg,
													makeCODEinvokenonvirtual(initCall,
													makeCODEputfield(fieldName, NULL)))))));
		}
		else if (is_iload(next(next(*c)), &int_arg))
		{
			return replace(c,9, makeCODEaload(0,
													makeCODEnew(newVar, 
													makeCODEdup(
													makeCODEiload(int_arg,
													makeCODEinvokenonvirtual(initCall,
													makeCODEputfield(fieldName, NULL)))))));
		} 
		else if (is_aload(next(next(*c)), &int_arg))
		{
			return replace(c,9, makeCODEaload(0,
													makeCODEnew(newVar, 
													makeCODEdup(
													makeCODEaload(int_arg,
													makeCODEinvokenonvirtual(initCall,
													makeCODEputfield(fieldName, NULL)))))));
		}
	}
	return 0;
}

int remove_dup_store_pop(CODE **c)
{
	int variable;
	if( is_dup(*c) && is_istore(next(*c), &variable)
			&& is_pop(next(next(*c))))
	{
		return replace(c,3,makeCODEistore(variable, NULL));
	}
	else if(is_dup(*c) && is_astore(next(*c), &variable)
			&& is_pop(next(next(*c))))
	{
		return replace(c,3, makeCODEastore(variable, NULL));
	}
	return 0;
}

/*
 *ifnonnull true_2
	*iconst_0
	*goto stop_3
	*true_2:
	*iconst_1
	*stop_3:
	*ifeq stop_1
	* DO STUFF
	* can be changed to just using the ifnonnull to do all of the branching
	* The issue here is whether or not my solution generalizes broadly enough
	* maybe allow for constFalse == 1 and constTrue == 0 and then just flip the first if stmt
	* Another issue is that we can't really delete any of the labels unless their counts are unique
	* TODO remove the ldc and the gotos/jumps
	* Ideally becomes 
	 *ifnonnull stop_3
		*goto stop_1
	 *stop_3:
		* DO STUFF
*/
int improve_branching(CODE **c)
{
	int labelFirstCond, label2, label3, finalLabel, constFalse, constTrue;
	/* Check to see that we start with an if, and after each branch we load a 0 or a 1 and then
		* either goto a label, or the next instruction is a label. In the next set of conditions we 
		* ensure that both branches converge to the same label 
		* Also need to ensure counts of labels are updated properly*/
	if(is_if(c, &labelFirstCond) && is_ldc_int(next(*c), &constFalse) && (constFalse == 0 || constFalse == 1)
		&& is_goto(next(next(*c)), &label3) && 
		is_ldc_int(next(destination(labelFirstCond)), &constTrue)
		&& (constTrue == 0 || constTrue == 1) 
		&& (is_label(next(next(destination(labelFirstCond))), &label2) || is_goto(next(next(destination(labelFirstCond))), &label2) 
		))
	{
		/* If both branches eventually point to the same condition 
			 * And that condition goes straight to an ifeq */
		if((label2 == label3) && is_ifeq(next(destination(label2)), &finalLabel) )
		{
			if(constFalse == 0 && constTrue == 1)
			{
					droplabel(labelFirstCond); /* first condition branched to iconst_1 and then goto-ed or was a label */
				 /*(destination(label2))->next = (destination(label2))->next->next; *//** Removes the ifeq stop, we will just put in a goto stop */
					if(is_ifnonnull(*c,&labelFirstCond))
					{
						return replace(c,3, makeCODEifnonnull(label2,
														makeCODEgoto(finalLabel, NULL))); /** if true, branch to the code that does something, if not goto what 
																																* the ifeq used to point at */
					}
					if(is_ifeq(*c,&labelFirstCond))
					{
						return replace(c,3, makeCODEifeq(label2, NULL));
					}
					if(is_ifnull(*c,&labelFirstCond))
					{
						return replace(c,3, makeCODEifnull(label2, NULL));
					}
						/*
					if(is_ifne(*c,&labelFirstCond))
					{
						return replace(c,1, makeCODEifne(finalLabel,NULL));
					}
						if(is_if_acmpeq(*c,&labelFirstCond))
					{
						return replace(c,1, makeCODEif_acmpeq(finalLabel,NULL));
					}
						if(is_if_acmpne(*c,&labelFirstCond))
					{
						return replace(c,1, makeCODEif_acmpne(finalLabel,NULL));
					}
						if(is_if_icmpeq(*c,&labelFirstCond))
					{
						return replace(c,1, makeCODEif_icmpeq(finalLabel,NULL));
					}
						if(is_if_icmpgt(*c,&labelFirstCond))
					{
						return replace(c,1, makeCODEif_icmpgt(finalLabel,NULL));
					}
						if(is_if_icmplt(*c,&labelFirstCond))
					{
						return replace(c,1, makeCODEif_icmplt(finalLabel,NULL));
					}
						if(is_if_icmple(*c,&labelFirstCond))
					{
						return replace(c,1, makeCODEif_icmple(finalLabel,NULL));
					}
						if(is_if_icmpge(*c,&labelFirstCond))
					{
						return replace(c,1, makeCODEif_icmpge(finalLabel,NULL));
					}
						if(is_if_icmpne(*c,&labelFirstCond))
					{
						return replace(c,1, makeCODEif_icmpne(finalLabel,NULL));
					}
					*/
			}
			/* We have to reverse labelFirstCond */
			else if (constFalse == 1 && constTrue == 0)
			{

			}
		}
	}
	return 0;
}


/**
 * Same idea as improve branching, but expects them all to be in a row 
 * This means it doesn't follow branches, it just goes 6 peepholes down
 * if_icmplt true_2
 * iconst_0
 * goto stop_3
 * true_2:
 * iconst_1
 * stop_3:
 * ifeq stop_1
 */
int improve_branching2(CODE **c)
{
	int labelFirstCond, label2, label3, label4, finalLabel, constFalse, constTrue;
	
	if(is_if(c, &labelFirstCond) && is_ldc_int(next(*c), &constFalse) && (constFalse == 0)
		&& is_goto(next(next(*c)), &label3) && is_label(next(next(next(*c))),&label2) && uniquelabel(label2)
		&& (label2 == labelFirstCond) && is_ldc_int(next(next(next(next(*c)))),&constTrue) && (constTrue == 1)
		&& is_label(next(next(next(next(next(*c))))), &label4) && uniquelabel(label4) && (label3 == label4)
		&& is_ifeq(next(next(next(next(next(next(*c)))))), &finalLabel))
	{
		/* Reverse the first inequality and have it point to finalLabel */
		if(is_ifnonnull(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEifnull(finalLabel, NULL)); 
		}
		if(is_ifeq(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEifne(finalLabel, NULL)); 
		}
		if(is_ifnull(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEifnonnull(finalLabel, NULL)); 
		}
		if(is_if_icmplt(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEif_icmpge(finalLabel,NULL));
		}
		if(is_ifne(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEifeq(finalLabel,NULL));
		}
		if(is_if_acmpeq(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEif_acmpne(finalLabel,NULL));
		}
		if(is_if_acmpne(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEif_acmpeq(finalLabel,NULL));
		}
		if(is_if_icmpeq(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEif_icmpne(finalLabel,NULL));
		}
		if(is_if_icmpgt(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEif_icmple(finalLabel,NULL));
		}
		if(is_if_icmple(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEif_icmpgt(finalLabel,NULL));
		}
		if(is_if_icmpge(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEif_icmplt(finalLabel,NULL));
		}
		if(is_if_icmpne(*c,&labelFirstCond))
		{
			return replace(c,7, makeCODEif_icmpeq(finalLabel,NULL));
		}        
	}
	return 0;
}

int remove_nop(CODE **c)
{
	if(is_nop(*c))
	{
		return replace(c,1,NULL);
	}
	return 0;
}

/*
 * aload_3
 * aconst_null
	* if_acmpne true_2
	* change to aload_3, ifnull
	*/
int change_to_null_comparison(CODE **c)
{
	int variable;
	int label;
	if(is_aload(*c, &variable) && is_aconst_null(next(*c)))
	{
		CODE *compare = next(next(*c));
		if(is_if_acmpeq(compare, &label))
		{
			return replace(c, 3, makeCODEaload(variable,
													makeCODEifnull(label, NULL)));
		}
		else if(is_if_acmpne(compare, &label))
		{
			return replace(c, 3, makeCODEaload(variable, makeCODEifnonnull(label, NULL))); 
		}
	}
	return 0;
}

/**
 * Same idea as change_to_null except with zero
 * iconst_0
 * iload_1
 * if_icmple true_3
 * Do we need to consider the case where we iload then iconst?
 * Nevermind, apparently our compiler doesn't support iflt
 */ 
int change_to_zero_comparison(CODE **c)
{
	int zero, variable, branch;
	if(is_ldc_int(*c, &zero) && (zero == 0) && is_iload(next(*c),&variable)
		 && (is_if_icmpeq(next(next(*c)), &branch) || is_if_icmpne(next(next(*c)), &branch)))
	{
		if(is_if_icmpeq(next(next(*c)),&branch))
		{
			return replace(c,3, makeCODEiload(variable, makeCODEifeq(branch,NULL)));
		}
		if(is_if_icmpne(next(next(*c)),&branch))
		{
			return replace(c,3, makeCODEiload(variable, makeCODEifne(branch,NULL)));
		}        
	}
	return 0;
}

/*
* Removes occurences of the following
*   stop_5:
 * stop_3:
 * to just stop_3
 * we also loop through and adjust anything which points to stop_5
 * and change it to stop_3 in the function fix_incorrect_labels
	*
	* NOTE: Apparently this does nothing. Gotta ask about it.
*/
int remove_consecutive_labels(CODE **c)
{
	int label1;
	int label2;
	int i;
	if( is_label(*c, &label1) && is_label(next(*c), &label2))
	{
		while(!deadlabel(label1))
		{
			droplabel(label1);
		}
		copylabel(label2);
		labels_mapping_[label1] = label2;
		for(i=0; i< MAX_LABELS; i++)
		{
			if(labels_mapping_[i] == label1)
			{
				labels_mapping_[i] = label2;
				copylabel(label2);
			}
		}
		return replace(c,2,makeCODElabel(label2, NULL));
	}
	return 0;
}

/*
* Note, doesn't do anything apparently :(
*/
int fix_incorrect_labels(CODE **c)
{
	int label;
	if(is_goto(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEgoto(labels_mapping_[label], NULL));
	}
	if(is_ifeq(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEifeq(labels_mapping_[label], NULL));
	}
	if(is_ifnull(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEifnull(labels_mapping_[label], NULL));
	}
	if(is_ifnonnull(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEifnonnull(labels_mapping_[label], NULL));
	}
	if(is_ifne(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEifne(labels_mapping_[label], NULL));
	}
		if(is_if_acmpeq(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEif_acmpeq(labels_mapping_[label], NULL));
	}
		if(is_if_acmpne(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEif_acmpne(labels_mapping_[label], NULL));
	}
		if(is_if_icmpeq(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEif_icmpeq(labels_mapping_[label], NULL));
	}
		if(is_if_icmpgt(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEif_icmpgt(labels_mapping_[label], NULL));
	}
		if(is_if_icmplt(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEif_icmplt(labels_mapping_[label], NULL));
	}
		if(is_if_icmple(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEif_icmple(labels_mapping_[label], NULL));
	}
		if(is_if_icmpge(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEif_icmpge(labels_mapping_[label], NULL));
	}
		if(is_if_icmpne(*c,&label) && labels_mapping_[label] != -1)
	{
		return replace(c,1, makeCODEif_icmpne(labels_mapping_[label], NULL));
	}
	return 0;
}

int improve_areturn(CODE **c) {
	int garbage;
	CODE *second = next(*c);
	if(is_areturn(*c) && second != NULL) {
		if(is_label(second, &garbage) == 0)
			return replace_modified(c, 2, makeCODEareturn(NULL));
	}
	return 0;
}


/*
 * seg faults. Idk why
 */
int dropDeadLabels(CODE **c)
{
	int count, label, got;
	CODE *current;
	if(is_goto(*c, &got) && is_label(next(*c), &label))
	{
		if(deadlabel(label))
		{
			count = 2;
			current = next(*c);
			while(current!= NULL && !is_label(current, &label)){
				count++;
				current = next(current);
			}
		}
		replace(c, count, makeCODEgoto(got, NULL));
	}
	return 0;
}

/* Many occurrences of the following pattern:
 * ldc "I was"
 * dup
 * ifnull nulll_82
 * goto stop_83
 * null_82:
 * pop
 * ldc "null"
 * stop_83:
 * This is obviously very unnecessary and can simply be replaced by the original ldc "I was"
 * Occurs over and over again in ComplementsGenerator
*/

int remove_dead_nullcheck(CODE **c) {
		CODE *current;
		char *loadedString, *garbage;
		int nullLabel, nullLabelBranch, stopLabel, stopLabelBranch;
		/*Get loaded string and ensure dup is next */
		if (is_ldc_string(*c, &loadedString) && is_dup(next(*c))) {
				current = next(next(*c));
				/* Check that ifnull is next and the null label it points to is unique */
				if(is_ifnull(current, &nullLabelBranch) && uniquelabel(nullLabelBranch)) {
						current = next(current);
						/* Check that next is goto and that the stop label it points to is unique */
						if(is_goto(current, &stopLabelBranch) && uniquelabel(stopLabelBranch)) {
								current = next(current);
								/* Check that null label is next, and that it is in fact the one we found earlier */
								if(is_label(current, &nullLabel) && nullLabelBranch==nullLabel) {
										current = next(current);
										/* Check that the pattern still fits within the null label */
										if(is_pop(current) && is_ldc_string(next(current), &garbage)) {
												current = next(next(current));
												/* Check that we're now at the stop label and the wild ride of dead code is over */
												if(is_label(current, &stopLabel) && stopLabelBranch==stopLabel) {
														return replace(c, 8, makeCODEldc_string(loadedString, NULL));
												}
										}
								}
						}
				}
		}
		return 0;
}

/*Straightforward: instead of loadinng iconst_0 and then checking for equality, just use ifeq */
int consolidateEqualToZero(CODE **c) {
	int constant, label;
	if(is_ldc_int(*c, &constant)) {
		if(constant == 0 && is_if_icmpne(next(*c), &label)) {
			return replace(c, 2, makeCODEifne(label, NULL)); 
		}
	}
	return 0;
}

int init_patterns(){
	ADD_PATTERN(initialize);
	ADD_PATTERN(simplify_multiplication_right);
	ADD_PATTERN(simplify_astore);
	ADD_PATTERN(positive_increment);
	ADD_PATTERN(simplify_goto_goto);
	ADD_PATTERN(simplify_field_instantiate_string);
	ADD_PATTERN(simplify_field_instantiate_object);
	ADD_PATTERN(simplify_field_instantiate_int_or_arg);
	ADD_PATTERN(simplify_field_instantiate_object_one_arg);
	ADD_PATTERN(change_to_null_comparison);
	ADD_PATTERN(remove_dup_store_pop);
	ADD_PATTERN(improve_branching2);
	ADD_PATTERN(remove_nop);
	ADD_PATTERN(change_to_zero_comparison);
	ADD_PATTERN(remove_dead_nullcheck); 
	ADD_PATTERN(consolidateEqualToZero);  
	ADD_PATTERN(improve_areturn); 
	/*ADD_PATTERN(positive_increment_no_store); Makes things worse 
  	ADD_PATTERN(improve_branching); 
	ADD_PATTERN(dropDeadLabels);
  	ADD_PATTERN(remove_consecutive_labels);
	ADD_PATTERN(fix_incorrect_labels); */
	return 1;
}
