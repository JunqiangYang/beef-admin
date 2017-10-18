package com.base.util;

import java.util.UUID;



public class UUIDGenerator {

	
	public UUIDGenerator(){
			
		}
	/**
	 * get a UUID String 
	 * @return String UUID 
	 */
	
	public static String getUUID(){
		String uuid = UUID.randomUUID().toString() ;
		return uuid ;
		
	}
	
	
	
	public static void main(String[] argc){		
		for(int i = 0 ; i < 10 ; i++){
			//System.out.println(UUIDGenerator.getUUID()+"  "+UUIDGenerator.getUUID().length()) ;
			
		}	
	}
}
