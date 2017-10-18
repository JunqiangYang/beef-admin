package com.jeecg.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import com.jeecg.dao.SysUserDao;
import com.jeecg.entity.SysRoleRel;
import com.jeecg.entity.SysRoleRel.RelType;
import com.jeecg.page.SysUserModel;

/**
 * 
 * <br>
 * <b>功能：</b>SysUserService<br>
 * <b>作者：</b>JEECG<br>
 * <b>日期：</b> Dec 9, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sysUserService")
public class SysUserService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SysUserService.class);
	
	@Autowired
	private SysRoleRelService<SysRoleRel> sysRoleRelService;

	@Override
	public void delete(Object[] ids) throws Exception {
		super.delete(ids);
		for(Object id :  ids){
			sysRoleRelService.deleteByObjId((Integer)id, RelType.USER.key);
		}
	}
	/**
	 * 检查登录
	 * @param email
	 * @param pwd
	 * @return
	 */
	public T queryLogin(String email,String pwd){
		SysUserModel model = new SysUserModel();
		model.setEmail(email);
		model.setPwd(pwd);
		SysUserDao<T> mapper = getDao();
		mapper.queryById("");
		return getDao().queryLogin(model);
	}
	
	/**
	 * 查询邮箱总数，检查是否存在
	 * @param email
	 * @return
	 */
	public int getUserCountByEmail(String email){
		return getDao().getUserCountByEmail(email);
	}
	
	/**
	 * 查询用户权限
	 * @param userId
	 * @return
	 */
	public List<SysRoleRel> getUserRole(Integer userId){
		return sysRoleRelService.queryByObjId(userId,RelType.USER.key);
	}
	
	/**
	 * 添加用户权限
	 * @param userId
	 * @param roleIds
	 * @throws Exception
	 */
	public void addUserRole(Integer userId,Integer[] roleIds) throws Exception{
		if(userId == null ||  roleIds == null || roleIds.length < 1 ){ 
			return;
		}
		//清除关联关系
		sysRoleRelService.deleteByObjId(userId, RelType.USER.key);
		for(Integer roleId :roleIds ){ 
			SysRoleRel rel = new SysRoleRel();
			rel.setRoleId(roleId);
			rel.setObjId(userId);
			rel.setRelType(RelType.USER.key);
			sysRoleRelService.add(rel);
		}
	}
	
	
	@Autowired
    private SysUserDao<T> mapper;

		
	public SysUserDao<T> getDao() {
		return mapper;
	}

}
