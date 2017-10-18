package com.jeecg.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import com.jeecg.dao.SysMenuDao;
import com.jeecg.entity.SysMenu;
import com.jeecg.entity.SysMenuBtn;
import com.jeecg.entity.SysRoleRel;
import com.jeecg.entity.SysRoleRel.RelType;

/**
 * 
 * <br>
 * <b>功能：</b>SysMenuService<br>
 * <b>作者：</b>JEECG<br>
 * <b>日期：</b> Dec 9, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("sysMenuService")
public class SysMenuService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(SysMenuService.class);


	@Autowired
	private SysRoleRelService<SysRoleRel> sysRoleRelService;
	
	@Autowired
	private SysMenuBtnService<SysMenuBtn> sysMenuBtnService;
	
	@Autowired
    private SysMenuDao<T> mapper;
	
	/**
	 * 保存菜单btn
	 * @param btns
	 * @throws Exception 
	 */
	public void saveBtns(Integer menuid,List<SysMenuBtn> btns) throws Exception{
		if(btns == null || btns.isEmpty()){
			return;
		}
		for (SysMenuBtn btn : btns) {
			if(btn.getId()!= null && "1".equals(btn.getDeleteFlag())){
				sysMenuBtnService.delete(btn.getId());
				continue;
			}
			btn.setMenuid(menuid);
			if(btn.getId() == null){
				sysMenuBtnService.add(btn);
			}else{
				sysMenuBtnService.update(btn);
			}
		}
		
	}


	public void add(SysMenu menu) throws Exception {
		super.add((T)menu);
		saveBtns(menu.getId(),menu.getBtns());
	}



	public void update(SysMenu menu) throws Exception {
		super.update((T)menu);
		saveBtns(menu.getId(),menu.getBtns());
	}




	/**
	 * 查询所有系统菜单列表
	 * @return
	 */
	public List<T> queryByAll(){
		return mapper.queryByAll();
	}
	
	/**
	 * 获取顶级菜单
	 * @return
	 */
	public List<T> getRootMenu(Integer menuId){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("menuId", menuId);
		return mapper.getRootMenu(map);
	}
	
	/**
	 * 获取子菜单
	 * @return
	 */
	public List<T> getChildMenu(){
		return mapper.getChildMenu();
	}
	
	/**
	 * 根据用户id查询父菜单
	 * @param roleId
	 * @return
	 */
	public List<T> getRootMenuByUser(Integer userId){
		return getDao().getRootMenuByUser(userId);
	}
	
	
	/**
	 * 根据用户id查询子菜单
	 * @param roleId
	 * @return
	 */
	public List<T> getChildMenuByUser(Integer userId){
		return getDao().getChildMenuByUser(userId);
	}
	
	
	/**
	 * 根据权限id查询菜单
	 * @param roleId
	 * @return
	 */
	public List<T> getMenuByRoleId(Integer roleId){
		return getDao().getMenuByRoleId(roleId);
	}
	
	
	
	@Override
	public void delete(Object[] ids) throws Exception {
		super.delete(ids);
		//删除关联关系
		for(Object id : ids){
			sysRoleRelService.deleteByObjId((Integer)id, RelType.MENU.key);
			sysMenuBtnService.deleteByMenuid((Integer)id);
		}
	}

	
	
	
	public SysMenuDao<T> getDao() {
		return mapper;
	}

}
