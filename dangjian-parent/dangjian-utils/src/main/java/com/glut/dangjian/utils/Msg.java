package com.glut.dangjian.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lishidongol
 * Date: 2018/7/31
 * Time: 下午4:34
 */
public class Msg {

	public static final int  OK = 200;
	public static final int  ERROR = 400;

	public static Map<String,Object> msg(int code, String msg){
		Map<String,Object> map = new HashMap<>();
		map.put("code",code);
		map.put("msg",msg);
		return map;
	}

	public static Map<String,Object> ok(){
		Map<String,Object> map = new HashMap<>();
		map.put("code",0);
		map.put("msg","操作成功");
		return map;
	}

	public static Map<String,Object> error(){
		Map<String,Object> map = new HashMap<>();
		map.put("code",400);
		map.put("msg","操作失败");
		return map;
	}


}
