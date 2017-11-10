<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%@include file="/view/resource.jsp" %>
  </head>
  <body class="easyui-layout">
 	 <!-- Search panel start -->
 	 <div class="ui-search-panel" region="north" style="height: 80px;" title="过滤条件" data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false" >  
 	 <form id="searchForm">
        <p class="ui-fields">
			<label class="ui-label">型号名称:</label><input name="gooddskindname" class="easyui-box ui-text" style="width:100px;">
			<label class="ui-label">价格(元):</label><input name="price" class="easyui-box ui-text" style="width:100px;">
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
     <div id="edit-win" class="easyui-dialog" title="窗口" data-options="closed:true,iconCls:'icon-save',modal:true" style="width:400px;height:380px;">
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
						<select id="isfixedweight" name="isfixedweight" style="width: 80px" >
							<option value="0">不定重</option>
							<option value="1">定重</option>
						</select>
					</div>
				 <div class="fitem">
					 <label>是否固定重量</label>
					 <select id="weightformat" name="weightformat" style="width: 80px" >
						 <option value="0">四位数(##.##)</option>
						 <option value="1">五位数(##.###)</option>
					 </select>
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
