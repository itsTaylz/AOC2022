
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class PartOne {

    public static void main(String[] args) throws FileNotFoundException {
        int score = 0;
        try (Scanner reader = new Scanner(new File("input.txt"))) {
            while (reader.hasNextLine()) {
                String line = reader.nextLine();
                char opponentLetter = line.charAt(0);
                char yourLetter = line.charAt(2);
                PlayAction opponentPlay = PlayAction.fromLetter(opponentLetter);
                PlayAction yourPlay = PlayAction.fromLetter(yourLetter);
                GameResult result = GameResult.calculate(opponentPlay, yourPlay);
                score += yourPlay.getScore() + result.getPoints();
            }
        }
        System.out.println(score);
    }
}