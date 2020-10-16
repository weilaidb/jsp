package bean;

public class Circle2 {
    double radius = 1;
    double circleArea = 0;
    double circleLenth = 0;

    public Circle2() {
        radius = 1;
    }

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public double getCircleArea() {
        circleArea =  Math.PI * radius * radius;
        return circleArea;
    }

    public double getCircleLength() {
        circleLenth =  2.0 * Math.PI * radius;
        return circleLenth;
    }
}
