package com.glut.dangjian.utils;

import java.util.Random;
import java.util.UUID;

public class StringTools {

    /**
     * 生成UUID
     */
    public static String getUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    
    /**
     * 生成随机的六位字符
     */
    public static String getStringRandom(int length) {
        String val = "";
        Random random = new Random();
        for(int i=0; i < length; i++) {
            int temp = random.nextInt(2)%2 == 0? 65 : 97;
            val +=(char) (random.nextInt(26)+temp);
        }
        return val;
    }
    
}
