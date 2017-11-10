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
<div id="edit-win" class="easyui-dialog" title="入库码单" data-options="closed:true,iconCls:'icon-save',modal:true" style=" margin-top: 5px; width:470px; height: 600px;">
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
				<label>型号:</label>
				<select class="easyui-combobox" name="goodskindid" id="formgoodskindid" style="width: 80px"></select>
				<label>件数:</label>
				<input name="nums" type="text" maxlength="" class="easyui-numberbox"  data-options="required:true" missingMessage="请填写件数" style="width: 55px">
				<%--<label>状态</label>--%>
				<input name="status" type="hidden" value="0" >
			</div>

			<div style="margin-top: 10px; padding-top: 5px;  border-top:1px solid #ccc; ">
				<input name="details" id="details" value="" type="hidden" >
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="<%=basePath%>/view/scott/ingoods/page-tRecords.js"></script>
</body>
</html>
