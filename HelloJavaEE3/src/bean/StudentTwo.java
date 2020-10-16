package bean;

public class StudentTwo {
    String name = null;

    public long getNumber() {
        return number;
    }

    public void setNumber(long number) {
        this.number = number;
    }

    long number;

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    double height, weight;


    public String getName() {
        try{
            byte bb[] = name.getBytes("GBK");
            name = new String(bb);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}
