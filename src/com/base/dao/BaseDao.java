package com.base.dao;

import java.util.List;

import com.base.page.BasePage;

public interface BaseDao<T> {

	
	public void add(T t);
	
	
	public void update(T t);
	
	
	public void updateBySelective(T t); 	
	
	public void delete(Object id);
	

	public int queryByCount(BasePage page);
	
	public List<T> queryByList(BasePage page);
	
	
	public T queryById(Object id);
}
