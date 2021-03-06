#!/usr/bin/env csh
# joosc: compiles JOOS source programs into class files using the A- JOOS
# compiler.
# usage: joosc [-O] f1.java f2.java ... fn.joos
# note: you should name each source file for ordinary classes with
# .java extensions and all external classes with .joos extensions
rm *.class
rm *.optdump
if ( { $PEEPDIR/joos $* } ) then
	foreach f ( $* )
		if ( $f != "-O" && $f:e != "joos" ) then
			java -jar jasmin.jar $f:r.j
			if ( $1 == "-O" ) then
				$PEEPDIR/djas -w $f:t:r.class > $f:t:r.optdump
			else
				$PEEPDIR/djas -w $f:r.class > $f:r.dump
			endif
		endif
	end
endif
