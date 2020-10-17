package bean;

public class GuessNumber {
    public int getAnawer() {
        return anawer;
    }

    public void setAnawer(int n) {
        this.anawer = n;
        guessCount = 0;
    }

    public int getGuessNumber() {
        return guessNumber;
    }

    public void setGuessNumber(int n) {
        this.guessNumber = n;
        guessCount++;
        if (guessNumber == anawer) {
            result = "恭喜，猜对了";
            right = true;
        } else if (guessNumber > anawer) {
            result = "猜大了";
            right = false;
        } else if (guessNumber < anawer) {
            result = "猜小了";
            right = false;
        }
    }

    public int getGuessCount() {
        return guessCount;
    }

    public void setGuessCount(int guessCount) {
        this.guessCount = guessCount;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public boolean isRight() {
        return right;
    }

    public void setRight(boolean right) {
        this.right = right;
    }

    int anawer = 0,
    guessNumber = 0,
    guessCount = 0;
    String result = null;
    boolean right = false;


}
