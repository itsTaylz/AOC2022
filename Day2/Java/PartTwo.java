import java.io.File;
import java.io.FileNotFoundException;
import java.util.Arrays;
import java.util.Scanner;

public class PartTwo {
    
    public static void main(String[] args) throws FileNotFoundException {
        int score = 0;
        try (Scanner reader = new Scanner(new File("input.txt"))) {
            while (reader.hasNextLine()) {
                String line = reader.nextLine();
                char opponentLetter = line.charAt(0);
                PlayAction opponentPlay = PlayAction.fromLetter(opponentLetter);
                char resultLetter = line.charAt(2);
                GameResult result = GameResult.fromLetter(resultLetter);
                PlayAction yourAction = Arrays.stream(PlayAction.values())
                                                .filter(p -> GameResult.calculate(opponentPlay, p) == result)
                                                .findFirst()
                                                .get();
                score += yourAction.getScore() + result.getPoints();
            }
        }
        System.out.println(score);    
    }
    
}
