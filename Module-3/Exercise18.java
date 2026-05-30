class Animal {
    void makeSound() {
        System.out.println("Animal Sound");
    }
}

class Dog extends Animal {
    void makeSound() {
        System.out.println("Bark");
    }
}

public class Exercise18 {
    public static void main(String[] a) {
        new Animal().makeSound();
        new Dog().makeSound();
    }
}