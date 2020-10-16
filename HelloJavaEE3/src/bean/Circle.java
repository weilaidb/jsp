package bean;

public class Circle {
    int radius;

    public Circle() {
        radius = 1;
    }

    public int getRadius() {
        return radius;
    }

    public void setRadius(int radius) {
        this.radius = radius;
    }

    public double circleArea() {
        return Math.PI * radius * radius;
    }

    public double circleLength() {
        return 2.0 * Math.PI * radius;
    }
}
