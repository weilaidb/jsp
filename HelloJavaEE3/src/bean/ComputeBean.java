package bean;

public class ComputeBean {
    public double getNumberOne() {
        return numberOne;
    }

    public void setNumberOne(double numberOne) {
        this.numberOne = numberOne;
    }

    public double getNumberTwo() {
        return numberTwo;
    }

    public void setNumberTwo(double numberTwo) {
        this.numberTwo = numberTwo;
    }

    public double getResult() {
        if (operator.equals("+")) {
            result = numberOne + numberTwo;
        } else if (operator.equals("-")) {
            result = numberOne - numberTwo;
        } else if (operator.equals("*")) {
            result = numberOne * numberTwo;
        } else if (operator.equals("/")) {
            result = numberOne / numberTwo;
        }
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator.trim();
    }

    double numberOne, numberTwo, result;
    String operator = "+";
}
