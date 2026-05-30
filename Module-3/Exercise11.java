import java.util.*;

public class Exercise11 {
    public static void main(String[] a) {
        int n = new Scanner(System.in).nextInt();
        long f = 1;
        for (int i = 2; i <= n; i++)
            f *= i;
        System.out.println(f);
    }
}