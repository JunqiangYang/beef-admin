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
 	 	   <label class="ui-label">账号:</label> 
 	 	   <input name="email" class="easyui-box ui-text" style="width:100px;">
           <label class="ui-label"> 昵称:</label> 
           <input name="nickName" class="easyui-box ui-text" style="width:100px;">
        </p>
        <a href="#" id="btn-search" class="easyui-linkbutton" iconCls="icon-search">查询</a>
      </form>  
     </div> 
     <!--  Search panel end -->
     
     <!-- DataList  -->
     <div region="center" border="false" >
     <table id="data-list"></table>
     </div>

     <!-- Edit Win&Form -->
     <div id="edit-win" class="easyui-dialog" title="Edit" data-options="closed:true,iconCls:'icon-save',modal:true" style="width:400px;height:300px;">  
     	<form id="editForm" class="ui-form" method="post">  
     		 <input class="hidden" type="text" name="id">
     		  <div class="ui-edit">
		     	   <div class="ftitle">授权设置</div>    
		           <div class="fitem">  
		               <label>账号:</label>  
		               <input class="easyui-validatebox" type="text" readonly="readonly" name="email" data-options="required:true,validType:'email'"></input>
		           </div>  
		            <div class="fitem">  
		               <label>角色选择:</label>  
		               <select class="easyui-combobox" id="roleIds" name="roleIds"  
                    			data-options="width:135"></select>
		           </div> 
	         </div>
     	</form>
  	 </div> 
<script type="text/javascript" src="<%=basePath%>/js/ux/sys/sysUserRole.js"></script>
  </body>
</html>
