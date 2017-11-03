$package('jeecg.tRecords');
jeecg.tRecords = function(){
	var _box = null;
	var _this = {
		config:{
			event:{
				add:function(){
					$('#typeIds_combobox').combobox('reload');
					_box.handler.add();
				},
				edit:function(){
					$('#typeIds_combobox').combobox('reload');
					_box.handler.edit();
				}
			},
  			dataGrid:{
  				title:'InGoods',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
					{field:'opertype',title:'类型 0(入库),1(出库)',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.opertype;
							}
						},
					{field:'warehouseid',title:'仓库编号',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.warehouseid;
							}
						},
					{field:'createtime',title:'创建时间',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.createtime;
							}
						},
					{field:'goodskindid',title:'型号',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.goodskindid;
							}
						},
					{field:'nums',title:'件数',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.nums;
							}
						},
					{field:'peopleid',title:'买家',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.peopleid;
							}
						},
					{field:'status',title:'状态',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.status;
							}
						},
					{field:'details',title:'详情',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.details;
							}
						},
					{field:'remark',title:'备注',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.remark;
							}
						},
					{field:'price',title:'价格',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.price;
							}
						},
					]]
			}
		},
		init:function(){
			_box = new YDataGrid(_this.config); 
			_box.init();
		}
	}
	return _this;
}();

$(function(){
	jeecg.tRecords.init();
});