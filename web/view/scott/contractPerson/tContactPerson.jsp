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
			<label class="ui-label">姓名:</label><input name="name" class="easyui-box ui-text" style="width:100px;">
			<label class="ui-label">电话:</label><input name="phone" class="easyui-box ui-text" style="width:100px;">
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
		     	   <div class="ftitle">联系人记录管理</div>
					<div class="fitem">
						<label>姓名</label>
						<input name="name" type="text" maxlength="50" class="easyui-validatebox" data-options="required:true" missingMessage="请填写姓名">
					</div>
					<div class="fitem">
						<label>电话</label>
						<input name="phone" type="text" maxlength="50" class="easyui-validatebox" data-options="" missingMessage="请填写电话">
					</div>
  			</div>
     	</form>
  	 </div>
  	 <script type="text/javascript" src="<%=basePath%>/view/scott/contractPerson/page-tContactPerson.js"></script>
  </body>
</html>
