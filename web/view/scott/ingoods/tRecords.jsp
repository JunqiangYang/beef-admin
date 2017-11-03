<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%@include file="/view/resource.jsp" %>
  </head>
  <body class="easyui-layout">

     <!-- Data List -->
     <div region="center" border="false" >
			 <form id="editForm" class="ui-form" method="post">
				 <input class="hidden" name="id">
				 <div class="ui-edit">
					 <div class="ftitle">出库</div>
					 <div class="fitem">
						 <label>类型 0(入库),1(出库)</label>
						 <input name="opertype" type="text" maxlength="" class="easyui-numberbox" data-options="required:true" missingMessage="请填写类型 0(入库),1(出库)">
					 </div>
					 <div class="fitem">
						 <label>仓库编号</label>
						 <input name="warehouseid" type="text" maxlength="" class="easyui-numberbox" data-options="required:true" missingMessage="请填写仓库编号">
					 </div>
					 <div class="fitem">
						 <label>创建时间</label>
						 <input name="createtime" type="text" maxlength="" class="easyui-datetimebox" data-options="required:true" missingMessage="请填写创建时间">
					 </div>
					 <div class="fitem">
						 <label>型号</label>
						 <input name="goodskindid" type="text" maxlength="" class="easyui-numberbox" data-options="required:true" missingMessage="请填写型号">
					 </div>
					 <div class="fitem">
						 <label>件数</label>
						 <input name="nums" type="text" maxlength="" class="easyui-numberbox" data-options="required:true" missingMessage="请填写件数">
					 </div>
					 <div class="fitem">
						 <label>买家</label>
						 <input name="peopleid" type="text" maxlength="" class="easyui-numberbox" data-options="required:true" missingMessage="请填写买家">
					 </div>
					 <div class="fitem">
						 <label>状态</label>
						 <input name="status" type="text" maxlength="" class="easyui-numberbox" data-options="" missingMessage="请填写状态">
					 </div>
					 <div class="fitem">
						 <label>详情</label>
						 <input name="details" type="text" maxlength="800" class="easyui-validatebox" data-options="" missingMessage="请填写详情">
					 </div>
					 <div class="fitem">
						 <label>备注</label>
						 <input name="remark" type="text" maxlength="500" class="easyui-validatebox" data-options="" missingMessage="请填写备注">
					 </div>
					 <div class="fitem">
						 <label>价格</label>
						 <input name="price" type="text" maxlength="" class="easyui-numberbox" data-options="required:true,precision:2,groupSeparator:','" missingMessage="请填写价格">
					 </div>
				 </div>
			 </form>
	 </div>

  	 <script type="text/javascript" src="<%=basePath%>/view/scott/ingoods/page-tRecords.js"></script>
  </body>
</html>
