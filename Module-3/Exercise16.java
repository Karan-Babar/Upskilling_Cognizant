import java.util.*;

public class Exercise16 {
    public static void main(String[] a) {
        String s = new Scanner(System.in).nextLine().replaceAll("[^A-Za-z0-9]", "").toLowerCase();
        String r = new StringBuilder(s).reverse().toString();
        System.out.println(s.equals(r));
    }
}