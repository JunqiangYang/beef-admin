package scott.entity.contractPerson;

import com.base.entity.BaseEntity;
import java.math.BigDecimal;
/**
 * 
 * <br>
 * <b>功能：</b>TContactPersonEntity<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public class TContactPerson extends BaseEntity {
	
		private java.lang.Integer id;//   id主键	private java.lang.String name;//   姓名	private java.lang.String phone;//   电话	public java.lang.Integer getId() {	    return this.id;	}	public void setId(java.lang.Integer id) {	    this.id=id;	}	public java.lang.String getName() {	    return this.name;	}	public void setName(java.lang.String name) {	    this.name=name;	}	public java.lang.String getPhone() {	    return this.phone;	}	public void setPhone(java.lang.String phone) {	    this.phone=phone;	}
}

