package com.jeecg.entity;

import com.base.entity.BaseEntity;


public class SysMenuBtn extends BaseEntity {
	
		private Integer id;//   主键	private Integer menuid;//    菜单id关联 sys_menu.id	private String btnName;//   按钮名称	private String btnType;//   按钮类型，用于列表页显示的按钮	private String actionUrls;//   url注册，用"," 分隔 。用于权限控制URL
	
	private String deleteFlag; //删除标记，与数据库字段无关 1=删除,其他不删除
	public String getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public Integer getId() {	    return this.id;	}	public void setId(Integer id) {	    this.id=id;	}	public Integer getMenuid() {	    return this.menuid;	}	public void setMenuid(Integer menuid) {	    this.menuid=menuid;	}	public String getBtnName() {	    return this.btnName;	}	public void setBtnName(String btnName) {	    this.btnName=btnName;	}	public String getBtnType() {	    return this.btnType;	}	public void setBtnType(String btnType) {	    this.btnType=btnType;	}	public String getActionUrls() {	    return this.actionUrls;	}	public void setActionUrls(String actionUrls) {	    this.actionUrls=actionUrls;	}
}
