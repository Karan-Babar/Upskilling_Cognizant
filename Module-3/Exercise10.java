// 10. Number Guessing Game

import java.util.*;

public class Exercise10 {
    public static void main(String[] a) {
        Scanner s = new Scanner(System.in);
        int t = new Random().nextInt(100) + 1, g;
        do {
            g = s.nextInt();
            System.out.println(g < t ? "Low" : g > t ? "High" : "Correct");
        } while (g != t);
    }
}