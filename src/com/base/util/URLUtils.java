package com.base.util;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.commons.lang.StringUtils;

public class URLUtils {
	
	//private static ResourceBundle res = ResourceBundle.getBundle("urls");
	private static 	Map<String,String> urlsMap = null;
	
//	/**
//	 * 获取urlMap
//	 * @return
//	 */
//	public static Map<String,String> getUrlMap(){
//		if(urlsMap != null && !urlsMap.isEmpty()){
//			return urlsMap;
//		}
//		urlsMap= new HashMap<String, String>();
//		Enumeration e = res.getKeys();
//		while(e.hasMoreElements()){
//			String key = e.nextElement().toString();
//			String value = get(key);
//			urlsMap.put(key, value);
//			System.out.println(key+"---"+value);
//		}
//		return urlsMap;
//	}
//	
//	
//	public static String get(String key){
//		return res.getString(key);
//	}
	
	
	public static String getReqUri(String reqUrl){
		try {
			URL url  = new URL(reqUrl);
//			System.out.println("getAuthority = "+url.getAuthority());
//			System.out.println("getDefaultPort = "+url.getDefaultPort());
//			System.out.println("getFile = "+url.getFile());
//			System.out.println("getHost"+ " = "+url.getHost());
//			System.out.println("getPath"+ " = "+url.getPath());
//			System.out.println("getPort"+ " = "+url.getPort());
//			System.out.println("getProtocol"+ " = "+url.getProtocol());
//			System.out.println("getQuery"+ " = "+url.getQuery());
//			System.out.println("getRef"+ " = "+url.getRef());
//			System.out.println("getUserInfo"+ " = "+url.getUserInfo());
			return url.getPath();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
	/**
	 * 组装按钮下URL
	 * @param menuUrl
	 * @param actionUrls
	 * @return
	 */
	public static void getBtnAccessUrls(String menuUrl,String actionUrls,List<String> accessUrls){
		if(menuUrl == null || actionUrls == null || accessUrls == null ){
			return;
		}
		String url = "save.do| action.do |/user/manger/abcd.do";
		String[] actions =StringUtils.split(actionUrls , "|");
		String menuUri = StringUtils.substringBeforeLast(menuUrl, "/");
		for(String action : actions){
			action = StringUtils.trim(action);
			if(StringUtils.startsWith(action, "/"))
				accessUrls.add(action);
			else
				accessUrls.add(menuUri+"/"+action);
		}
	}
	
	public static void main(String[] args) {
//		String requrl = "http://127.0.0.1:8080/ms/sysMenu/menu.shtml";
//		requrl = "https://127.0.0.1:8080/ms/sysMenu/menu.shtml?A=1&B=2#111";
//		String uri = getReqUri(requrl);
//		System.out.println(uri);
//		System.out.println(StringUtils.remove(uri, "/ms/"));
//		System.err.println(getReqUri(requrl));\
		String menu = "/sysMneu/dataList.do";
		String url = "save.do| action.do |/user/manger/abcd.do";
		String[] actions =StringUtils.split(url, "|");
		String menuUri = StringUtils.substringBeforeLast(menu, "/");
		for(String action : actions){
			action = StringUtils.trim(action);
			if(StringUtils.startsWith(action, "/"))
				System.out.println(action);
			else
				System.out.println(menuUri+"/"+action);
		}
	}
	
	
}
