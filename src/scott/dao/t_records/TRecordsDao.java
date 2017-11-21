package scott.dao.t_records;


import java.util.List;

import com.base.dao.BaseDao;
import com.base.page.BasePage;

/**
 * 
 * <br>
 * <b>功能：</b>InGoodsDao<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */
public interface TRecordsDao<T> extends BaseDao<T> {
    public List<T>  queryByListStatByGoodType(Object goodskindid);
    public List<T> queryByListStat(BasePage page);
}
