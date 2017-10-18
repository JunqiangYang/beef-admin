package com.jeecg.dao;

import java.util.List;

import com.base.dao.BaseDao;

/**
 * SysRole Mapper
 * @author Administrator
 *
 */
public interface SysRoleDao<T> extends BaseDao<T> {
	
	/**
	 *查询全部有效的权限
	 * @return
	 */
	public List<T> queryAllList();
	
	
	/**
	 *根据用户Id查询权限
	 * @return
	 */
	public List<T> queryByUserid(Integer userid);
}
