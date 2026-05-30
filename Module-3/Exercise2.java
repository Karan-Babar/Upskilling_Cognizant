// 2. Simple Calculator

import java.util.*;
public class Exercise2 {
    public static void main(String[] a) {
        Scanner s = new Scanner(System.in);
        double x = s.nextDouble(), y = s.nextDouble();
        char op = s.next().charAt(0);
        switch (op) {
            case '+':
                System.out.println(x + y);
                break;
            case '-':
                System.out.println(x - y);
                break;
            case '*':
                System.out.println(x * y);
                break;
            case '/':
                System.out.println(y != 0 ? x / y : "Cannot divide by zero");
        }
    }
}