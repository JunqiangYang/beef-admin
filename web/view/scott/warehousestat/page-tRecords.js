$package('jeecg.tRecords');
jeecg.tRecords = function(){
	var _box = null;
    var _this = {
		config:{
  			dataGrid:{
  				title:'剩余统计',
	   			url:'dataList.do',
	   			columns:[[
					{field:'warehouseName',title:'仓库',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.warehouseName;
							}
						},
					{field:'gooddsKindName',title:'型号',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.gooddsKindName;
							}
						},
					{field:'nums',title:'剩余件数',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.nums;
							}
						}
					]],
                    toolbar:[
						false
                    ]
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