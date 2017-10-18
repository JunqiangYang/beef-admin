<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%@include file="/view/resource.jsp" %>
  </head>
  <body class="easyui-layout">
  	 <!-- Search panel start -->
 	 <div class="ui-search-panel" region="north" style="height: 80px;" title="过滤条件" data-options="striped: false,collapsible:false,iconCls:'icon-search',border:false" >   
 	 <form id="searchForm">
 	 	<input class="hidden" id='search_parentId' name="parentId">
 	 	<p class="ui-fields">
            <label class="ui-label">菜单名:</label> 
            <input name="name" class="easyui-box ui-text" style="width:100px;">
        </p>
        <a id="btn-search" class="easyui-linkbutton" iconCls="icon-search">查询</a>
      </form>  
     </div> 
     <!--  Search panel end -->
     <!-- DataList  -->
	 <div region="center" border="false" >
     	<table id="data-list" ></table>
     </div>
    
     <!-- Edit Win&From -->
     <div id="edit-win" class="easyui-dialog" title="Edit Menu" data-options="closed:true,iconCls:'icon-save',modal:true"  style="width:500px;height:450px;">  
     	<form id="editForm" class="ui-form" method="post"> 
     	 <!-- 隐藏文本框 -->
     	 <input class="hidden" name="id">
     	 <input class="hidden" name="deleted">
    	 <input class="hidden" name="parentId" id='edit_parentId'>
    	 <div class="easyui-panel" border='false' style="width:450px;height: 350px;">  
	        <div class="easyui-layout" data-options="fit:true">
	            <div data-options="region:'north',split:true" style="height:185px;padding:10px">  
	               <div class="ftitle">详细</div>    
		           <div class="fitem">  
		               <label>名称:</label>  
		               <input class="easyui-validatebox" type="text" name="name" data-options="required:true">
		           </div>  
		           <div class="fitem">  
		               <label>URL:</label>  
		               <input type="text" name="url"></input>
		           </div>  
		           <div class="fitem">  
		               <label>Rank:</label>  
		               <input class="easyui-numberbox" type="text" value="0" name="rank" data-options="required:true,min:0,max:999">
		           </div> 
		           <div class="fitem">  
		               <label>Actions:</label>  
		               <input class="easyui-validatebox" type="text" name="actions" >
		               <span>注册的Action.按"|"分隔</span>
		           </div> 
	            </div>
	            <div data-options="region:'center'">  
	              	<div id="toolbar">  
				        <a href="javascript:void(0)" id='addLine_btn' class="easyui-linkbutton" iconCls="icon-add" plain="true" >Add</a>  
				        <a href="javascript:void(0)" id='addDefLine_btn'class="easyui-linkbutton" iconCls="icon-add" plain="true" >AddDefault</a>
				        <a href="javascript:void(0)" id='delAllLine_btn'class="easyui-linkbutton" iconCls="icon-remove" plain="true" >Delete All</a>  
				    </div>  
				    <table id="btn-tb" style="width:100%">
				    	<thead>
				    	<tr>
				    		<th width="5%"></th>
				    		<th width="25%">按钮名称:</th>
				    		<th width="25%">按钮类型</th>
				    		<th width="35%">注册Action(用"|"分格)</th>
				    		<th width="10%">操作</th>
				    	</tr>
				    	</thead>
				    	<tbody>
				    	</tbody>
				    </table>
	            </div>
	         </div>
	       </div>
     	</form>
  	 </div>
  <script type="text/javascript" src="<%=basePath%>/js/ux/sys/sysMenu.js"></script>
  </body>
</html>
