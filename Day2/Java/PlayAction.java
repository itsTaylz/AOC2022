public enum PlayAction {
    ROCK(new char[] {'A', 'X'}, 1),
    PAPER(new char[] {'B', 'Y'}, 2),
    SCISSORS(new char[] {'C', 'Z'}, 3);

    private final char[] letters;
    private final int score;

    PlayAction(char[] letters, int score) {
        this.letters = letters;
        this.score = score;
    }

    public boolean beats(PlayAction other) {
        PlayAction[] allValues = values();
        int thisIndex = 0;
        int otherIndex = 0;
        for (int i = 0; i < allValues.length; i++) {
            if (other == allValues[i])
                otherIndex = i;
            if (this == allValues[i])
                thisIndex = i;
        }

        return (otherIndex+1) % allValues.length == thisIndex;
    }

    public int getScore() {
        return this.score;
    }

    public static PlayAction fromLetter(char letter) {
        for (PlayAction action : values()) {
            for (char l : action.letters) {
                if (l == letter)
                    return action;
            }
        }
        return null;
    }
}