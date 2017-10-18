<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%@include file="/view/resource.jsp" %>
  </head>
	<body  class="easyui-layout">
	<!-- Search panel start -->
 	<div class="ui-search-panel" region="north" style="height: 80px;" title="过滤条件" data-options="striped: true,collapsible:false,iconCls:'icon-search',border:false" >  
 	 <form id="searchForm">
 	 	<p class="ui-fields">
            <label class="ui-label">角色名:</label> 
            <input name="roleName" class="easyui-box ui-text" style="width:100px;">
        </p>  
        <a href="#" id="btn-search" class="easyui-linkbutton" iconCls="icon-search">查询</a>
      </form>  
     </div> 
     <!--  Search panel end -->
     
     <!-- DataList  -->
     <div region="center" border="false" >
    	 <table id="data-list"></table>
	 </div>
     <!-- Edit Form -->
     <div id="edit-win" class="easyui-dialog" title="Edit" data-options="closed:true,iconCls:'icon-save',modal:true" style="width:400px;height:410px;">  
     	<form id="editForm" class="ui-form" method="post">  
     		 <input class="hidden" type="text" name="id">
     		 <div class="ui-edit">
	     	   <div class="ftitle">角色信息</div>    
	           <div class="fitem">  
	               <label>角色名:</label>  
	               <input class="easyui-validatebox" type="text" name="roleName" data-options="required:true,validType:'length[1,10]'">
	           </div>  
	           <div class="fitem">  
	               <label>状态:</label>  
	               <select class="easyui-combobox" name="state" data-options="required:true">
                    	<option value="0" selected="selected">可用</option>
                    	<option value="1">禁用</option>
                   	</select>
	           </div>  
	           <!-- 
	           <div class="fitem">  
	               <label>Description:</label>  
	               <textarea class="easyui-validatebox" data-options="length:[0,100]" name="descr"></textarea>
	           </div>
	            -->
	            <div class="fitem" style="">  
	               <label>功能权限:</label>
	               <div style="border: 1px solid #A4BED4; width:230px;height:200px;margin-left: 105px ;overflow: auto; ">  
	               	<ul id="menu-tree"  >
	               	</ul>
	               </div>
	               <!-- 
	               <select id="menu-tree" name="menuIds" class="easyui-combotree" data-options="url:'<%=basePath%>/sysMenu/getMenuTree.do'" multiple style="width:180px;"></select>
	                -->
	           </div>
	         </div>
     	</form>
  	 </div> 
<script type="text/javascript" src="<%=basePath%>/js/ux/sys/sysRole.js"></script>
  </body>
</html>
