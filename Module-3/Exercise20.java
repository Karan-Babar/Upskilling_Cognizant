import java.util.*;

public class Exercise20 {
    public static void main(String[] a) {
        Scanner s = new Scanner(System.in);
        try {
            int x = s.nextInt(), y = s.nextInt();
            System.out.println(x / y);
        } catch (ArithmeticException e) {
            System.out.println("Division by zero not allowed");
        }
    }
}