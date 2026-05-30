// 5. Multiplication Table 

import java.util.*;

public class Exercise5 {
    public static void main(String[] a) {
        int n = new Scanner(System.in).nextInt();
        for (int i = 1; i <= 10; i++)
            System.out.println(n + " x " + i + " = " + (n * i));
    }
}