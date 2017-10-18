package com.jeecg.dao;

import java.util.List;

import com.base.dao.BaseDao;

/**
 * SysMenuBtn Mapper
 * @author Administrator
 *
 */
public interface SysMenuBtnDao<T> extends BaseDao<T> {
	
	public List<T> queryByMenuid(Integer menuid);
	
	public List<T> queryByMenuUrl(String url); 
	
	public void deleteByMenuid(Integer menuid);
	
	public List<T> getMenuBtnByUser(Integer userid); 
	
	
	
	public List<T> queryByAll();
}
