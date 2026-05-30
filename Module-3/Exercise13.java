import java.util.*;

public class Exercise13 {
    static int fib(int n) {
        return n <= 1 ? n : fib(n - 1) + fib(n - 2);
    }

    public static void main(String[] a) {
        int n = new Scanner(System.in).nextInt();
        System.out.println(fib(n));
    }
}