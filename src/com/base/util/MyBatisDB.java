package com.base.util;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisDB {
	
	 private static SqlSessionFactory sqlMapper ;
	 static {
	
		String resource = "com/wei/ssi/conf/mybatis/mybatis-config.xml";
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlMapper = new SqlSessionFactoryBuilder().build(reader);
	}
	 
	 
	public static SqlSession getSqlSession(){
		if(sqlMapper == null ){
			return null;
		}
		return sqlMapper.openSession();
	}
	//�ر�l��
	public static void close(){
		 getSqlSession().close();
	}
	
	//�ύ����
	public static void commit(){
		 getSqlSession().commit();
	}
	
	//����ع�
	public static void rollback(){
		 getSqlSession().rollback();
	}
}
