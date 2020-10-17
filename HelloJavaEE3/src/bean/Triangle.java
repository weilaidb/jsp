package bean;

public class Triangle {
    public double getSideA() {
        return sideA;
    }

    public void setSideA(double sideA) {
        this.sideA = sideA;
    }

    public double getSideB() {
        return sideB;
    }

    public void setSideB(double sideB) {
        this.sideB = sideB;
    }

    public double getSideC() {
        return sideC;
    }

    public void setSideC(double sideC) {
        this.sideC = sideC;
    }


    public void setArea(double area) {
        this.area = area;
    }

    public boolean isTriangle() {
        if (sideA < sideB + sideC && sideB < sideA + sideC && sideC < sideA + sideB) {
            isTriangle = true;
        } else {
            return isTriangle = false;
        }
        return isTriangle;
    }

    public void setTriangle(boolean triangle) {
        isTriangle = triangle;
    }

    double sideA, sideB, sideC;
    double area;
    boolean isTriangle;


    public double getArea()
    {
        double p = (sideA + sideB + sideC)/2.0;
        area = Math.sqrt(p * (p - sideA) * (p - sideB) * (p - sideC));
        return area;
    }







}
