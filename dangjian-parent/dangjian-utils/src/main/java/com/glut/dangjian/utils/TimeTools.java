package com.glut.dangjian.utils;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/7/31
 * Time: 下午3:28
 */


import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 获取当前系统时间的工具
 */
public class TimeTools {
	public static void main(String[] args) {
		System.out.println(getLocalDateTime());
		System.out.println(getLocalTimeTo("yyyy-MM-dd HH"));
	}

	/**
	 * 传入指定时间格式，得到格式化后的时间
	 * @param format 时间格式
	 * @return
	 */
	public static String getLocalTimeTo(String format){
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat (format);
		return ft.format(dNow);
	}

	/**
	 * 得到时间格式为 2018-07-31 15:36:56 的时间
	 * @return
	 */
	public static String getLocalDateTime(){
		Date dNow = new Date( );
		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		return ft.format(dNow);
	}
}
