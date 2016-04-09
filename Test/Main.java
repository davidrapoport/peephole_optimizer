import java.io.*;
import java.util.*;

class Benchmark {
    private int number;
    private HashMap<String, LinkedList<Integer>> filesToLengths;
    private LinkedList<String> fileNames;

    public Benchmark(int number) {
        filesToLengths = new HashMap<>();
        fileNames = new LinkedList<>();
        this.number = number;
    }

    private void addEntry(String file, int length) {
        if(!filesToLengths.containsKey(file)) {
            filesToLengths.put(file, new LinkedList<Integer>());
            fileNames.addLast(file);
        }
        filesToLengths.get(file).addLast(length);
    }

    boolean parseLine(String line) {
        line = line.replace(".optdump:;         code_length", "");
        String[] tokens = line.split(" ");
        if(tokens.length != 2)
            return false;
        addEntry(tokens[0], Integer.parseInt(tokens[1]));
        return true;
    }
    private int getFileCodeLength(String file) {
        int total = 0;
        if(!filesToLengths.containsKey(file))
            System.out.println("Shouldn't happen");
        for(Integer i : filesToLengths.get(file)) {
            total += i;
        }
        return total;
    }

    int getBenchmarkTotal() {
        int total = 0;
        for(String file : fileNames) {
            total += getFileCodeLength(file);
        }
        return total;
    }

    ArrayList<FileComparison> compareBenchmarks(Benchmark toCompare) {
        if(toCompare.getFileNames().size() != this.fileNames.size()) {
            System.out.println("Comparing incompatible benchmarks" + number + ":" +toCompare.number);
            return null;
        }
        ArrayList<FileComparison> toReturn = new ArrayList<>();

        for(String file : this.fileNames) {
            toReturn.add(new FileComparison(toCompare.getFilesToLengths().get(file),
                    this.getFilesToLengths().get(file), number, file));
        }
        return toReturn;
    }

    public int getNumber() {
        return number;
    }

    public HashMap<String, LinkedList<Integer>> getFilesToLengths() {
        return filesToLengths;
    }

    public LinkedList<String> getFileNames() {
        return fileNames;
    }
}

class FileComparison implements Comparable<FileComparison> {
    private LinkedList<Integer> aPlus;
    private LinkedList<Integer> ours;
    private int aPlusTotal;
    private int oursTotal;
    private int benchmark;
    private String filename;
    ArrayList<MethodComparison> methods;

    FileComparison(LinkedList<Integer> aPlus, LinkedList<Integer> ours, int benchmark, String filename) {
        this.aPlus = aPlus;
        this.ours = ours;
        this.benchmark = benchmark;
        this.filename = filename;
        aPlusTotal = 0;
        for(Integer i : aPlus) {
            aPlusTotal += i;
        }
        oursTotal = 0;
        for(Integer i : ours) {
            oursTotal += i;
        }
        methods = compareMethods();
    }

    @Override
    public String toString() {
        String tostring = "##### Benchmark " + benchmark + " " + filename + " methods sorted by difference from APlus. Total: " +  difference() + "\n";
        for(MethodComparison method : methods) {
            tostring += method.toString() + "\n";
        }
        return tostring;
    }

    @Override
    public int compareTo(FileComparison o) {
        if(o.difference() > this.difference())
            return 1;
        else if(o.difference() < this.difference())
            return -1;
        return 0;
    }

    private ArrayList<MethodComparison> compareMethods() {
        ArrayList<MethodComparison> toReturn = new ArrayList<>();
        if(aPlus.size() != ours.size()) System.out.println("Method count not the same within benchmarks");
        for (int i = 0; i < aPlus.size(); i++) {
            toReturn.add(new MethodComparison(filename, i + 1, benchmark, aPlus.get(i), ours.get(i)));
        }
        Collections.sort(toReturn);
        return toReturn;
    }
    public int difference() {
        return aPlusTotal - oursTotal;
    }
}

class MethodComparison implements Comparable<MethodComparison> {
    String fileName;
    int methodNumber;
    int benchmark;
    int aPlus;
    int ours;

    public MethodComparison(String fileName, int methodNumber, int benchmark, int aPlus, int ours) {
        this.fileName = fileName;
        this.methodNumber = methodNumber;
        this.benchmark = benchmark;
        this.aPlus = aPlus;
        this.ours = ours;
    }

    public int difference() {
        return aPlus - ours;
    }

    public double bloat() {
        return (double) aPlus / (double) ours;
    }
    @Override
    public int compareTo(MethodComparison o) {
        if(o.bloat() > this.bloat())
            return 1;
        else if(o.bloat() < this.bloat())
            return -1;
        return 0;
    }

    @Override
    public String toString() {
        String tostring = benchmark + ":file- " + fileName + ", Method # " + methodNumber + " is ";
        if(this.difference() >= 0)
            tostring += this.difference() + " lines " + aPlus + " - " + ours + " longer than APlus";
        else
            tostring += (this.difference() * -1) + "lines shorter than APlus";
        return tostring + "with efficiency: " + this.bloat();
    }
}

public class Main {
    static String peepDir = "/Users/mdamore/Dropbox/work/Comp520/peephole_optimizer";

    //We need to be able to:
    // 1. Read from file w/ Laurie's results and build a list of benchmarks
    // 2. Do the same for our results
    // 3. Compute the largest difference between the two on a benchmark, file, and method basis (make a list and sort)
    // 5. Store results and comment on differences from last time?

    public static void main(String[] args) {
        ArrayList<Benchmark> laurieValues = addLaurieValues();
        System.out.println("A+ code length: " + getTotalCodeLength(laurieValues));
        ArrayList<Benchmark> ourValues = runBenchmarksAndClean();
        System.out.println("Our total code length: " + getTotalCodeLength(ourValues));
        ArrayList<FileComparison> compare = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            Benchmark toCompare = laurieValues.get(i);
//            System.out.println(toCompare.getNumber());
            compare.addAll(toCompare.compareBenchmarks(ourValues.get(i)));
        }
        Collections.sort(compare);
        ArrayList<MethodComparison> allMethods = new ArrayList<>();
        for(FileComparison fc : compare) {
//            System.out.println(fc);
            allMethods.addAll(fc.methods);
        }
        Collections.sort(allMethods);
        System.out.println("######################################");
        System.out.println("Methods sorted by code length efficiency");
        for (int i = 0; i < 10; i++) {
            System.out.println(allMethods.get(i));
        }
    }

    private static Benchmark buildBenchmarkFromFile(File file, int number) {
        Benchmark toReturn = new Benchmark(number);
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null)
                toReturn.parseLine(line);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return toReturn;
    }

    private static ArrayList<Benchmark> runBenchmarksAndClean() {
        String path = peepDir + "/output";
        ArrayList<Benchmark> toReturn = new ArrayList<>();
        for (int i = 1; i < 8; i++) {
            if(i == 3) continue;
            File file = new File(path + "/" + i + ".txt");
            try (BufferedReader br = new BufferedReader(new FileReader(file))) {
                String line;
                Benchmark current = new Benchmark(i);

                while ((line = br.readLine()) != null) {
                    current.parseLine(line);
                }
                toReturn.add(current);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return toReturn;
    }

    private static int getTotalCodeLength(ArrayList<Benchmark> list) {
        int total = 0;
        for(Benchmark current : list) {
            total += current.getBenchmarkTotal();
        }
        return total;
    }

    private static ArrayList<Benchmark> addLaurieValues() {
        ArrayList<Benchmark> toReturn = new ArrayList<>();
        File laurieValuesFile = new File(peepDir + "/Test/laurieValues.txt");
        try (BufferedReader br = new BufferedReader(new FileReader(laurieValuesFile))) {
            String line;
            Integer benchmarkNumber = 1;
            Benchmark current = new Benchmark(benchmarkNumber);

            while ((line = br.readLine()) != null) {
                String[] tokens = line.split(" ");
                if(Integer.parseInt(tokens[0]) != benchmarkNumber) {
                    toReturn.add(current);
                    benchmarkNumber++;
                    if(benchmarkNumber == 3) benchmarkNumber++;
                    if(Integer.parseInt(tokens[0]) != benchmarkNumber)
                        System.out.println("houston we have a problem");
                    current = new Benchmark(benchmarkNumber);
                }
                current.parseLine(tokens[1] + " " + tokens[2]);
            }
            toReturn.add(current);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return toReturn;
    }
}
