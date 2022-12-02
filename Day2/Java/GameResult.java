public enum GameResult {
    DEFEAT('X', 0),
    DRAW('Y', 3),
    VICTORY('Z', 6);

    private final char letter;
    private final int points;

    GameResult(char letter, int points) {
        this.letter = letter;
        this.points = points;
    }

    public static GameResult calculate(PlayAction opponentAction, PlayAction yourAction) {
        if (opponentAction == yourAction)
            return GameResult.DRAW;
        if (opponentAction.beats(yourAction))
            return GameResult.DEFEAT;
        return GameResult.VICTORY;
    }

    public static GameResult fromLetter(char letter) {
        for (GameResult result : values()) {
            if (result.letter == letter)
                return result;
        }
        return null;
    }

    public int getPoints() {
        return this.points;
    }
}
