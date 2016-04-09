public class Test
{
	protected Test aTest;
	public Test(int x, int y)
	{
		super();
		x = y;
		aTest= null;
	}

	public Test()
	{
		super();
		int x;
		int y;
		
		x = 5;
		y = x;
		x ++;
		aTest = new Test(x, x);
	}
}