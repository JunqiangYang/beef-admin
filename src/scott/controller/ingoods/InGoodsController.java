package scott.controller.ingoods;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.base.util.HtmlUtil;
import com.base.web.BaseAction;

import scott.entity.ingoods.InGoods;
import scott.page.ingoods.InGoodsPage;
import scott.service.ingoods.InGoodsService;

/**
 * 
 * <br>
 * <b>功能：</b>TRecordsController<br>
 * <b>作者：</b>www.jeecg.org<br>
 * <b>日期：</b> Feb 2, 2013 <br>
 * <b>版权所有：<b>版权所有(C) 2013，www.jeecg.org<br>
 */ 
@Controller
@RequestMapping("/ingooods")
public class InGoodsController extends BaseAction{
	
	private final static Logger log= Logger.getLogger(InGoodsController.class);
	
	// Servrice start
	@Autowired(required=false) //自动注入，不需要生成set方法了，required=false表示没有实现类，也不会报错。
	private InGoodsService<InGoods> tRecordsService;
	
	
	
	
	
	/**
	 * 
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/list") 
	public ModelAndView  list(InGoodsPage page, HttpServletRequest request) throws Exception{
		Map<String,Object>  context = getRootMap();
		return forword("scott/ingoods/tRecords",context); 
	}
	
	
	/**
	 * ilook 首页
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/dataList") 
	public void  datalist(InGoodsPage page, HttpServletResponse response) throws Exception{
		List<InGoods> dataList = tRecordsService.queryByList(page);
		//设置页面数据
		Map<String,Object> jsonMap = new HashMap<String,Object>();
		jsonMap.put("total",page.getPager().getRowCount());
		jsonMap.put("rows", dataList);
		HtmlUtil.writerJson(response, jsonMap);
	}
	
	/**
	 * 添加或修改数据
	 * @param url
	 * @param classifyId
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/save")
	public void save(InGoods entity, Integer[] typeIds, HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap<String,Object>();
		entity.setOpertype(0);
		if(entity.getId()==null||StringUtils.isBlank(entity.getId().toString())){
			tRecordsService.add(entity);
		}else{
			tRecordsService.update(entity);
		}
		sendSuccessMessage(response, "保存成功~");
	}
	
	
	@RequestMapping("/getId")
	public void getId(String id,HttpServletResponse response) throws Exception{
		Map<String,Object>  context = new HashMap();
		InGoods entity  = tRecordsService.queryById(id);
		if(entity  == null){
			sendFailureMessage(response, "没有找到对应的记录!");
			return;
		}
		context.put(SUCCESS, true);
		context.put("data", entity);
		HtmlUtil.writerJson(response, context);
	}
	
	
	
	@RequestMapping("/delete")
	public void delete(String[] id,HttpServletResponse response) throws Exception{
		tRecordsService.delete(id);
		sendSuccessMessage(response, "删除成功");
	}

}
