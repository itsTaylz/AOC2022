import java.io.File;
import java.io.FileNotFoundException;
import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.Scanner;

public class PartTwo {

    public static void main(String[] args) throws FileNotFoundException {
        try (Scanner reader = new Scanner(new File("input.txt"))) {
            PriorityQueue<Integer> caloriesQueue = new PriorityQueue<>(Comparator.reverseOrder());
            int caloriesCounter = 0;
            while (reader.hasNextLine()) {
                String line = reader.nextLine();
                if (line.isEmpty()) {
                    caloriesQueue.add(caloriesCounter);
                    caloriesCounter = 0;
                } else {
                    caloriesCounter += Integer.parseInt(line);
                }
            }
            int total = 0;
            for (int i = 0; i < 3; i++) {
                total += caloriesQueue.poll();
            }
            System.out.println(total);
        }
    }
    
}
