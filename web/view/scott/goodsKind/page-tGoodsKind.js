$package('jeecg.tGoodsKind');
jeecg.tGoodsKind = function(){
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
  				title:'型号管理',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
					{field:'gooddskindname',title:'型号名称',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.gooddskindname;
							}
						},
					{field:'price',title:'价格(元)',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.price;
							}
						},
					{field:'isfixedweight',title:'是否固定重量 0(不定),1(定重)',align:'center',sortable:true,
							formatter:function(value,row,index){
                                if(row.isfixedweight == 0){
                                    return '不定重' ;
                                }
                                if(row.isfixedweight == 1){
                                    return '定重' ;
                                }
							}
						},
					{field:'remark',title:'备注',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.remark;
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
	jeecg.tGoodsKind.init();
});