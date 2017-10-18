package scott.service.contractPerson;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import scott.dao.contractPerson.TContactPersonDao;

/**
 * 
 * <br>
 * <b>功能：</b>TContactPersonService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("tContactPersonService")
public class TContactPersonService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(TContactPersonService.class);
	

	

	@Autowired
    private TContactPersonDao<T> dao;

		
	public TContactPersonDao<T> getDao() {
		return dao;
	}

}
