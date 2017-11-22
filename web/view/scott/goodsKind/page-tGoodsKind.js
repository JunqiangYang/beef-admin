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
					{field:'isFixedweight',title:'是否固定重量',align:'center',sortable:true,
							formatter:function(value,row,index){
                                if(row.isFixedweight == 0){
                                    return '不定重' ;
                                }
                                if(row.isFixedweight == 1){
                                    return '定重' ;
                                }
							}
						},
                    {field:'weightformat',title:'重量格式',align:'center',sortable:true,
                        formatter:function(value,row,index){
                            if(row.weightformat == 0){
                                return '##.##' ;
                            }
                            if(row.weightformat == 1){
                                return '##.###' ;
                            }
                        }
                    },
                    {field:'weight',title:'重量',align:'center',sortable:true,
                        formatter:function(value,row,index){
                            return row.weight;
                        }
                    },
					{field:'remark',title:'备注',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.remark;
							}
					}

					]],
                pagination:false,
			}
		},
		init:function(){
			_box = new YDataGrid(_this.config); 
			_box.init();

            $('#isFixedweight').change(function(){
                var value=$(this).children('option:selected').val();//这就是selected的值
				if(parseInt(value) == 0){
					//不定重
                    $("#weight").attr("disabled","disabled");
                    $("#weight").val("");
                    $("#weightformat").removeAttr("disabled");
				}else{
                    //定重
                    $("#weightformat").attr("disabled","disabled") ;
                    $("#weightformat").find("option[value='0']").attr("selected",true);
                    $("#weight").removeAttr("disabled");
				}
            }) ;

            $("#weight").keyup(function(){
                var weightformat = $("#weightformat").val() ;
                var regex = /^\d{4}$/ ;
                if(parseInt(weightformat) == 1){
                    regex =/^\d{5}$/;
                }
                if(regex.test(str) || str.trim().length ==0){
                    $(this).removeClass("redborder");
                }else{
                    $(this).addClass("redborder");
                }
            });

		}
	}
	return _this;
}();

$(function(){
	jeecg.tGoodsKind.init();
});