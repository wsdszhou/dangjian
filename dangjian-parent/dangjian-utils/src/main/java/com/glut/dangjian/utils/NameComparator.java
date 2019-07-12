package com.glut.dangjian.utils;

import java.util.Comparator;
import java.util.Hashtable;

/**
 * 按名称排序
 * @author XuLanKong
 *
 */
public class NameComparator implements Comparator {
    
    public int compare(Object a, Object b) {
        Hashtable hashA = (Hashtable) a;
        Hashtable hashB = (Hashtable) b;
        if (((Boolean) hashA.get("is_dir")) && !((Boolean) hashB.get("is_dir"))) {
            return -1;
        } else if (!((Boolean) hashA.get("is_dir")) && ((Boolean) hashB.get("is_dir"))) {
            return 1;
        } else {
            return ((String) hashA.get("filename")).compareTo((String) hashB.get("filename"));
        }
    }
}