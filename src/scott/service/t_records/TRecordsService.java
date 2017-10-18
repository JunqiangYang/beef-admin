package scott.service.t_records;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.base.service.BaseService;
import scott.dao.t_records.TRecordsDao;

/**
 * 
 * <br>
 * <b>功能：</b>TRecordsService<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
@Service("tRecordsService")
public class TRecordsService<T> extends BaseService<T> {
	private final static Logger log= Logger.getLogger(TRecordsService.class);
	

	

	@Autowired
    private TRecordsDao<T> dao;

		
	public TRecordsDao<T> getDao() {
		return dao;
	}

}
