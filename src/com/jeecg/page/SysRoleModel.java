package com.jeecg.page;

import com.base.page.BasePage;

public class SysRoleModel extends BasePage {
	

		private Integer id;//   id主键	private String roleName;//   角色名称	private java.sql.Timestamp createTime;//   创建时间	private Integer createBy;//   创建人	private java.sql.Timestamp updateTime;//   修改时间	private Integer updateBy;//   修改人	private Integer state;//   状态0=可用 1=禁用	private String descr;//   角色描述	public Integer getId() {	    return this.id;	}	public void setId(Integer id) {	    this.id=id;	}		public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public java.sql.Timestamp getCreateTime() {	    return this.createTime;	}	public void setCreateTime(java.sql.Timestamp createTime) {	    this.createTime=createTime;	}	public Integer getCreateBy() {	    return this.createBy;	}	public void setCreateBy(Integer createBy) {	    this.createBy=createBy;	}	public java.sql.Timestamp getUpdateTime() {	    return this.updateTime;	}	public void setUpdateTime(java.sql.Timestamp updateTime) {	    this.updateTime=updateTime;	}	public Integer getUpdateBy() {	    return this.updateBy;	}	public void setUpdateBy(Integer updateBy) {	    this.updateBy=updateBy;	}	public Integer getState() {	    return this.state;	}	public void setState(Integer state) {	    this.state=state;	}	public String getDescr() {	    return this.descr;	}	public void setDescr(String descr) {	    this.descr=descr;	}
	
}
