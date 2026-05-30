// 4. Leap Year Checker

import java.util.*;
public class Exercise4 {
    public static void main(String[] a) {
        int y = new Scanner(System.in).nextInt();
        boolean leap = (y % 400 == 0) || (y % 4 == 0 && y % 100 != 0);
        System.out.println(leap);
    }
}