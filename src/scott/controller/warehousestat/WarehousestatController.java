package scott.controller.warehousestat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.base.util.HtmlUtil;
import com.base.web.BaseAction;

import scott.controller.t_records.TRecordsController;
import scott.entity.t_records.TRecords;
import scott.page.t_records.TRecordsPage;
import scott.service.t_records.TRecordsService;

/**
 * @author Junqiang.Yang
 * @create 2017-11-21 11:23
 **/
@Controller
@RequestMapping("/warehousestat")
public class WarehousestatController  extends BaseAction {
    private final static Logger log= Logger.getLogger(TRecordsController.class);

    // Servrice start
    @Autowired(required=false) //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
    private TRecordsService<TRecords> tRecordsService;


    @RequestMapping("/list")
    public ModelAndView list(TRecordsPage page, HttpServletRequest request) throws Exception{
        Map<String,Object>  context = getRootMap();
        return forword("scott/warehousestat/tRecords",context);
    }


    @RequestMapping("/dataList")
    public void  datalist(TRecordsPage page,HttpServletResponse response) throws Exception{
        List<TRecords> dataList = tRecordsService.queryByListStat(page);

        //设置页面数据
        //这里循环查询出来的数据统计按类型计算剩余件数.
        // 仓库,型号,剩余件数
        //

        Map<String,Object> jsonMap = new HashMap<String,Object>();
        jsonMap.put("total",page.getPager().getRowCount());
        jsonMap.put("rows", dataList);
        HtmlUtil.writerJson(response, jsonMap);
    }


    @RequestMapping("/getId")
    public void getId(String goodskindid,HttpServletResponse response) throws Exception{
        Map<String,Object>  context = new HashMap();
        TRecords entity  = tRecordsService.queryByListStatByGoodType(goodskindid);
        if(entity  == null){
            sendFailureMessage(response, "没有找到对应的记录!");
            return;
        }
        context.put(SUCCESS, true);
        context.put("data", entity);
        HtmlUtil.writerJson(response, context);
    }

}
