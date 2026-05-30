import java.util.*;

public class Exercise14 {
    public static void main(String[] a) {
        Scanner s = new Scanner(System.in);
        int n = s.nextInt();
        int[] arr = new int[n];
        int sum = 0;
        for (int i = 0; i < n; i++) {
            arr[i] = s.nextInt();
            sum += arr[i];
        }
        System.out.println("Sum=" + sum);
        System.out.println("Avg=" + (double) sum / n);
    }
}