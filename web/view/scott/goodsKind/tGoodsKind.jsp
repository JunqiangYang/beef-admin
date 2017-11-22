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
		 <label style="color: red; margin-left: 20px" >平台约定统一重量格式为正数,输入不带小数点,单位公斤.</label>
      </form>
     </div>
     <!--  Search panel end -->

     <!-- Data List -->
     <div region="center" border="false" >
     <table id="data-list"></table>
	 </div>
	 
     <!-- Edit Win&Form -->
     <div id="edit-win" class="easyui-dialog" title="窗口" data-options="closed:true,iconCls:'icon-save',modal:true" style="width:420px;height:380px;">
     	<form id="editForm" class="ui-form" method="post">  
     		 <input class="hidden" name="id">
     		 <div class="ui-edit">
		     	   <div class="ftitle">型号管理</div>
					<div class="fitem">
						<label>型号名称</label>
						<input name="gooddskindname" type="text" maxlength="50" class="easyui-validatebox" data-options="required:true" missingMessage="请填写型号名称">
					</div>
					<div class="fitem">
						<label>价格(元)</label>
						<input name="price" type="text" maxlength="10" class="easyui-validatebox" data-options="" missingMessage="请填写价格(元)">
					</div>
					<div class="fitem">
						<label>是否固定重量</label>
						<select id="isFixedweight" name="isFixedweight" style="width: 130px" >
							<option value="0">不定重</option>
							<option value="1" selected="selected" >定重</option>
						</select>
					</div>
				 <div class="fitem">
					 <label>重量格式</label>
					 <select id="weightformat" name="weightformat" style="width: 130px" disabled="disabled" >
						 <option value="0">四位数(##.##)</option>
						 <option value="1">五位数(##.###)</option>
					 </select>
				 </div>
				 <div class="fitem">
					 <label>定重每箱重量</label>
					 <input name="weight" id="weight" type="text" />(公斤/KG)
				 </div>
				 <div>
					 <label style="color: red; margin-left: 20px" >平台约定统一重量格式为正数,输入不带小数点,定重型为(##.##),不定重型为(##.## 或 ##,###),单位公斤(KG).</label>
					 <br/><br/><br/>
				 </div>
				<div class="fitem">
					<label>备注</label>
					<input name="remark" type="text" maxlength="500" class="easyui-validatebox" data-options="" missingMessage="请填写备注">
				</div>
  			</div>
     	</form>
  	 </div>
  	 <script type="text/javascript" src="<%=basePath%>/view/scott/goodsKind/page-tGoodsKind.js"></script>

  </body>
</html>
