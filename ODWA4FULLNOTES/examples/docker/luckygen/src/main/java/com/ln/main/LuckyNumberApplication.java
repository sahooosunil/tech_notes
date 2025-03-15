package com.ln.main;

import java.security.SecureRandom;

public class LuckyNumberApplication {
    public static void main(String[] args) {
        SecureRandom random = new SecureRandom();
        int n = random.nextInt(9);
        System.out.println(n);
    }
}
