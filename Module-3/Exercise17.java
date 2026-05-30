class Car {
    String make, model;
    int year;

    Car(String a, String b, int c) {
        make = a;
        model = b;
        year = c;
    }

    void displayDetails() {
        System.out.println(make + " " + model + " " + year);
    }
}

public class Exercise17 {
    public static void main(String[] a) {
        new Car("Toyota", "Camry", 2024).displayDetails();
    }
}