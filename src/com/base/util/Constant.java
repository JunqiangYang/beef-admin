package com.base.util;

import java.util.ResourceBundle;

import org.apache.commons.lang.math.NumberUtils;

public class Constant {

	
	/**
	 * 超级管理员常量
	 * @author  www.jeecg.org
	 *
	 */
	public static enum SuperAdmin {
		NO(0, "否"), YES(1,"是");
		public int key;
		public String value;
		private SuperAdmin(int key, String value) {
			this.key = key;
			this.value = value;
		}
		public static SuperAdmin get(int key) {
			SuperAdmin[] values = SuperAdmin.values();
			for (SuperAdmin object : values) {
				if (object.key == key) {
					return object;
				}
			}
			return null;
		}
	}

}