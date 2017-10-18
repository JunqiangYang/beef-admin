package com.jeecg.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.dao.BaseDao;
import com.base.service.BaseService;
import com.jeecg.dao.SysMenuBtnDao;

/**
 * 
 * <br>
 * <b>功能：</b>SysMenuBtnService<br>
 * <b>作者：</b>JEECG<br>
 * <b>日期：</b> Dec 9, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sysMenuBtnService")
public class SysMenuBtnService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SysMenuBtnService.class);
	
	public List<T> queryByAll(){
		return getDao().queryByAll();
	}
	
	
	
	public List<T> queryByMenuid(Integer menuid){
		return getDao().queryByMenuid(menuid);
	}
	
	public List<T> queryByMenuUrl(String url){
		return getDao().queryByMenuUrl(url);
	}
	
	public void deleteByMenuid(Integer menuid){
		getDao().deleteByMenuid(menuid);
	}
	
	public List<T> getMenuBtnByUser(Integer userid){
		return getDao().getMenuBtnByUser(userid);
	}

	@Autowired
    private SysMenuBtnDao<T> mapper;

		
	public SysMenuBtnDao<T> getDao() {
		return mapper;
	}

}
