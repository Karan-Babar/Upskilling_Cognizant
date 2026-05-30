// 9. Grade Calculator

import java.util.*;

public class Exercise9 {
    public static void main(String[] a) {
        int m = new Scanner(System.in).nextInt();
        if (m >= 90)
            System.out.println("A");
        else if (m >= 80)
            System.out.println("B");
        else if (m >= 70)
            System.out.println("C");
        else if (m >= 60)
            System.out.println("D");
        else
            System.out.println("F");
    }
}