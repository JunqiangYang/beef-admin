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
			<label class="ui-label">类型:</label>
			<select name="opertype" id="opertype" style="width: 100px" >
				<option value="-99" selected="selected">--请选择--</option>
				<option value="0">入库</option>
				<option value="1">出库</option>
			</select>
			<label class="ui-label">仓库:</label>
			<select  class="easyui-combobox"   name="warehouseid" id="warehouseid"  style="width:100px;">
			</select>
			<label class="ui-label">时间阶段:</label>
			<input name="begintime" id="begintime" type="text" maxlength="" class="easyui-datetimebox" >
			-
			<input name="endtime" id="endtime" type="text" maxlength="" class="easyui-datetimebox" >

			<label class="ui-label">型号:</label>
			<select  class="easyui-combobox"  name="goodskindid" id="goodskindid" style="width:100px;" >
			</select>
	    </p>
	    <a href="#" id="btn-search" class="easyui-linkbutton" iconCls="icon-search">查询</a>
      </form>  
     </div> 
     <!--  Search panel end -->

     <!-- Data List -->
     <div region="center" border="false" >
     <table id="data-list"></table>
	 </div>
  	 <script type="text/javascript" src="<%=basePath%>/view/scott/t_records/page-tRecords.js"></script>
  </body>
</html>
