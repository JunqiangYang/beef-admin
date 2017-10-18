package scott.page.goodsKind;

import com.base.page.BasePage;
import java.math.BigDecimal;

/**
 * 
 * <br>
 * <b>功能：</b>TGoodsKindPage<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public class TGoodsKindPage extends BasePage {
	

		private java.lang.Integer id;//   id主键	private java.lang.String gooddskindname;//   型号名称	private java.lang.String price;//   价格(元)	private java.lang.Integer isfixedweight;//   是否固定重量 0(不定),1(定重)	private java.lang.String remark;//   备注	public java.lang.Integer getId() {	    return this.id;	}	public void setId(java.lang.Integer id) {	    this.id=id;	}	public java.lang.String getGooddskindname() {	    return this.gooddskindname;	}	public void setGooddskindname(java.lang.String gooddskindname) {	    this.gooddskindname=gooddskindname;	}	public java.lang.String getPrice() {	    return this.price;	}	public void setPrice(java.lang.String price) {	    this.price=price;	}	public java.lang.Integer getIsfixedweight() {	    return this.isfixedweight;	}	public void setIsfixedweight(java.lang.Integer isfixedweight) {	    this.isfixedweight=isfixedweight;	}	public java.lang.String getRemark() {	    return this.remark;	}	public void setRemark(java.lang.String remark) {	    this.remark=remark;	}
	
}
