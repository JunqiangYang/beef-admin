package scott.service.ingoods;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;

import scott.dao.ingoods.InGoodsDao;

/**
 * 
 * <br>
 * <b>功能：</b>OutGoodsService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("InGoodsService")
public class InGoodsService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(InGoodsService.class);
	

	

	@Autowired
    private InGoodsDao<T> dao;

		
	public InGoodsDao<T> getDao() {
		return dao;
	}

}
