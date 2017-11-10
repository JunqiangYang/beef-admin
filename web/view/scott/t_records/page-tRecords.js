$package('jeecg.tRecords');
jeecg.tRecords = function(){
	var _box = null;
    var _this = {
		config:{
  			dataGrid:{
  				title:'进出库记录管理',
	   			url:'dataList.do',
	   			columns:[[
					{field:'opertype',title:'进出库',align:'center',sortable:true,
							formatter:function(value,row,index){
  								if(row.opertype == 0){
  									return '入库' ;
								}
                                if(row.opertype == 1){
                                    return '出库' ;
                                }
							}
						},
					{field:'warehouseName',title:'仓库',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.warehouseName;
							}
						},
					{field:'createtime',title:'创建时间',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.createtime;
							}
						},
					{field:'gooddsKindName',title:'型号',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.gooddsKindName;
							}
						},
					{field:'nums',title:'件数',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.nums;
							}
						}

					// {field:'status',title:'状态',align:'center',sortable:true,
					// 		formatter:function(value,row,index){
					// 			return row.status;
					// 		}
					// 	}
					// {field:'details',title:'详情',align:'center',sortable:true,
					// 		formatter:function(value,row,index){
					// 			return row.details;
					// 		}
					// 	},
					// {field:'remark',title:'备注',align:'center',sortable:true,
					// 		formatter:function(value,row,index){
					// 			return row.remark;
					// 		}
					// 	},
					]],
                    toolbar:[
						false
                    ]
			}
		},
		init:function(){
			_box = new YDataGrid(_this.config); 
			_box.init();
            jeecg.progress();
            jeecg.ajaxJson(urls['msUrl']+'/tGoodsKind/dataList.do',{},function(data){
                if(data.total != null && data.total > 0 ){
                    goodskindlist =  [{id:-99,gooddskindname:"--请选择--","selected":true}].concat(data.rows)
                    $('#goodskindid').combobox({
                        data:goodskindlist,
                        valueField:'id',
                        textField:'gooddskindname'
                    });
                }else{
                    jeecg.alert('提示',data.msg,'error');
                }
                jeecg.closeProgress();
            });

            jeecg.progress();
            jeecg.ajaxJson(urls['msUrl']+'/tWarehouse/dataList.do',{},function(data){
                if(data.total != null && data.total > 0 ){
                    warehouselist = [{id:-99,warehousename:"--请选择--","selected":true}].concat(data.rows)
                    $('#warehouseid').combobox({
                        data:warehouselist,
                        valueField:'id',
                        textField:'warehousename'
                    });
                }else{
                    jeecg.alert('提示',data.msg,'error');
                }
                jeecg.closeProgress();
            });
		}
	}
	return _this;
}();

$(function(){
	jeecg.tRecords.init();
});