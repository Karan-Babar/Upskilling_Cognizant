interface Playable {
    void play();
}

class Guitar implements Playable {
    public void play() {
        System.out.println("Guitar");
    }
}

class Piano implements Playable {
    public void play() {
        System.out.println("Piano");
    }
}

public class Exercise19 {
    public static void main(String[] a) {
        new Guitar().play();
        new Piano().play();
    }
}