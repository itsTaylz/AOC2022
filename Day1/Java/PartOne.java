import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class PartOne {
    public static void main(String[] args) throws FileNotFoundException {
        try (Scanner reader = new Scanner(new File("input.txt"))) {
            int maxCalories = 0;
            int caloriesCounter = 0;
            while (reader.hasNextLine()) {
                String line = reader.nextLine();
                if (line.isEmpty()) {
                    maxCalories = Math.max(maxCalories, caloriesCounter);
                    caloriesCounter = 0;
                } else
                    caloriesCounter += Integer.parseInt(line);
            }
            System.out.println(maxCalories);
        }
    }
}