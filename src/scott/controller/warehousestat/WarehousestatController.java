package scott.controller.warehousestat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.base.util.HtmlUtil;
import com.base.util.json.JSONUtil;
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
        List<TRecords> dataList = converts(tRecordsService.queryByListStat(page));
        Map<String,Object> jsonMap = new HashMap<String,Object>();
        jsonMap.put("total",dataList.size());
        jsonMap.put("rows", dataList);
        HtmlUtil.writerJson(response, jsonMap);
    }


    @RequestMapping("/getId")
    public void getId(String goodskindid,HttpServletResponse response) throws Exception{
        Map<String,Object>  context = new HashMap();
        List<TRecords> dataList = converts(tRecordsService.queryByListStatByGoodType(goodskindid));
        Map<String,Object> jsonMap = new HashMap<String,Object>();
        jsonMap.put("total",dataList.size());
        jsonMap.put("rows", dataList);
        HtmlUtil.writerJson(response, jsonMap);
    }


    public static ArrayList<TRecords> converts(List<TRecords> dataList){
        //设置页面数据
        //这里循环查询出来的数据统计按类型计算剩余件数.
        // 仓库,型号,剩余件数
        Map<Integer,TRecords> pair = new HashMap<Integer,TRecords>();
        for (TRecords tRecords : dataList) {
            if(pair.containsKey(tRecords.getGoodskindid())){
                TRecords saverecord = pair.get(tRecords.getGoodskindid()) ;
                if(tRecords.getOpertype()==1){ // 出库 -
                    saverecord.setNums(saverecord.getNums()-tRecords.getNums());
                }else{// 入库 +
                    saverecord.setNums(saverecord.getNums()+tRecords.getNums());
                }
                pair.put(tRecords.getGoodskindid(),saverecord);
            }else{
                if(tRecords.getOpertype() == 1){
                    tRecords.setNums(-tRecords.getNums());
                }
                pair.put(tRecords.getGoodskindid(),tRecords) ;
            }
        }
        ArrayList<TRecords> list = new  ArrayList<TRecords>() ;
        list.addAll(pair.values()) ;
        try {
            log.info(JSONUtil.toJSONString(list));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return list;
    }

}
