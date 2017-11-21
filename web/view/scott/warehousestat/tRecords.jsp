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
     <!-- Data List -->
     <div region="center" border="false" >
     <table id="data-list"></table>
	 </div>
  	 <script type="text/javascript" src="<%=basePath%>/view/scott/warehousestat/page-tRecords.js"></script>
  </body>
</html>
