joos PeepholeBenchmarks/bench01/*.java
converts all of the .java files into .j files

in your bashrc or .profile or whatever
export PEEPDIR=/home/david/Documents/W2016/520/PeepholeContest
export JOOSDIR=/home/david/Documents/W2016/520/PeepholeContest/JOOSlib
cd JOOSlib
mkdir -p joos/lib
cp * joos/lib
javac it all

export CLASSPATH=/home/david/bin/classpath/bcel-5.1.jar:/home/david/bin/classpath/tinapoc.jar:$CLASSPATH
For those download tinapoc from sourceforge

cd JOOSA-src
make 
to compile our patterns 

to compile programs 
sizes.sh -O PeepholeBenchmarks/bench07/*.java

to run programs 
java -cp .:$JOOSDIR Game

where Game contains a main method

make sure to copylabel if you point another thing to a label 
or droplabel if you have removed a pointer. 
And check uniquelabel to see if only one thing points to it.
