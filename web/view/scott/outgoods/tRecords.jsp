<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%@include file="/view/resource.jsp" %>
  </head>
  <style>
	  .blockdiv{
		  width: 60px;padding-top: 5px; margin-left: 5px; margin-right: 5px;float:left;text-align: center ;
	  }
	  .blockdiv-input{
		  width: 100%;border: 1px solid black;padding-top: 3px;margin: 1px;
	  }
	  .redborder{
		  border: 1px solid red;
	  }


  </style>
  <body class="easyui-layout">
 	 <!-- Search panel start -->
 	 <div class="ui-search-panel" region="north" style="height: 80px;" title="过滤条件" data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false" >  
 	 <form id="searchForm">
        <p class="ui-fields">
			<label class="ui-label">仓库:</label>
			<select  class="easyui-combobox"   name="warehouseid" id="warehouseid"  style="width:100px;">
			</select>
			<label class="ui-label">型号:</label>
			<select  class="easyui-combobox"  name="goodskindid" id="goodskindid" style="width:100px;" >
			</select>
			<label class="ui-label">买家:</label>
			<select  class="easyui-combobox"   name="peopleid" id="peopleid" style="width:100px;" >
			</select>
			<label class="ui-label">时间阶段:</label>
			<input name="begintime" id="begintime" type="text" maxlength="" class="easyui-datetimebox" >
			-
			<input name="endtime" id="endtime" type="text" maxlength="" class="easyui-datetimebox" >


	    </p>
	    <a href="#" id="btn-search" class="easyui-linkbutton" iconCls="icon-search">查询</a>
      </form>  
     </div> 
     <!--  Search panel end -->

     <!-- Data List -->
     <div region="center" border="false" >
     <table id="data-list"></table>
	 </div>
	 
     <!-- Edit Win&Form -->
     <div id="edit-win" class="easyui-dialog" title="出库码单" data-options="closed:true,iconCls:'icon-save',modal:true,maximizable:true" style=" margin-top: 5px; width:470px; height: 600px;">
     	<form id="editForm" class="ui-form" method="post">  
     		 <input class="hidden" name="id" >
     		 <div class="ui-edit">
		     	   <div class="ftitle"></div>
					<div>
						<label>仓库:</label>
						<select class="easyui-combobox" name="warehouseid" id="formwarehouseid" style="width: 80px"></select>
						<label>时间:</label>
						<input name="createtime" type="text" maxlength="" class="easyui-datetimebox" missingMessage="请填写创建时间">
						<br/>
						<label>买家:</label>
						<select class="easyui-combobox" name="peopleid" id="formpeopleid" style="width: 80px">
						</select>
						<label>型号:</label>
						<select class="easyui-combobox" name="goodskindid" id="formgoodskindid" style="width: 80px"></select>
						<label>价格:</label>
						<input name="price" id="price"  type="text" class="easyui-textbox"  data-options="required:true" missingMessage="请填价格" style="width: 55px">
						<label>件数:</label>
						<input name="nums" id="nums" type="text" maxlength="" class="easyui-numberbox"  data-options="required:true" missingMessage="请填写件数" style="width: 55px">

					<%--<label>状态</label>--%>
						<input name="status" type="hidden" value="0" >
					</div>

					<div style="margin-top: 10px; padding-top: 5px;  border-top:1px solid #ccc; ">
						<label>重量格式:</label>
							<select id="weightformat" name="weightformat" style="width: 80px" disabled="true" >
								<option value="0">四位数</option>
								<option value="1">五位数</option>
							</select>
						<br/><br/>
						<input name="details" id="details" type="hidden" >
						<div id="divlistblock" style=" width: 88%; text-align: center; margin: 0 auto; "></div>
						<div style="clear: both;margin-top: 5px">
							<%--<label>备注:</label>--%>
							<input name="remark" id="remark" type="hidden" >
							<%--<textarea id="remarktextarea" style="width: 100%;height: 50px " ></textarea>--%>
								&nbsp;&nbsp;
							<label>总重:</label>
							<label id="totalweight" >******</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label>总价:</label>
							<label id="totalprice">******</label>
						</div>
					</div>
  			</div>
     	</form>
  	 </div>
  	 <script type="text/javascript" src="<%=basePath%>/view/scott/outgoods/page-tRecords.js"></script>
  </body>
</html>
