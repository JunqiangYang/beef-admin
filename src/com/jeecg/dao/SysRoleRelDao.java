package com.jeecg.dao;

import java.util.List;

import com.base.dao.BaseDao;
import com.jeecg.entity.SysRoleRel;

/**
 * SysRoleRel Mapper
 * @author Administrator
 *
 */
public interface SysRoleRelDao<T> extends BaseDao<T> {
	
	public void deleteByRoleId(java.util.Map<String, Object> param);
	
	public void deleteByObjId(java.util.Map<String, Object> param);
	
	
	public List<SysRoleRel> queryByRoleId(java.util.Map<String, Object> param);
	
	
	public List<SysRoleRel> queryByObjId(java.util.Map<String, Object> param);
	
	
}
