package scott.entity.warehouseManager;

import com.base.entity.BaseEntity;
import java.math.BigDecimal;
/**
 * 
 * <br>
 * <b>功能：</b>TWarehouseEntity<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public class TWarehouse extends BaseEntity {
	
		private java.lang.Integer id;//   id主键	private java.lang.String warehousename;//   仓库名称	private java.lang.String remark;//   备注	public java.lang.Integer getId() {	    return this.id;	}	public void setId(java.lang.Integer id) {	    this.id=id;	}	public java.lang.String getWarehousename() {	    return this.warehousename;	}	public void setWarehousename(java.lang.String warehousename) {	    this.warehousename=warehousename;	}	public java.lang.String getRemark() {	    return this.remark;	}	public void setRemark(java.lang.String remark) {	    this.remark=remark;	}
}

