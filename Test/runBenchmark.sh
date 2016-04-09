cd "$(dirname "$0")"
cd ../JOOSA-src/
make clean
make
cd ..
rm output/*
for i in `seq 1 7`;
do
	rm *.class
	rm *.optdump
	echo "############ Benchmark $i"
	./sizes.sh -O PeepholeBenchmarks/bench0$i/*.java
	grep -a code_length *.optdump > output/$i.txt
done
cd Test
java Main
cd ..
rm *.class
rm *.optdump