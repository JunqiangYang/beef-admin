$package('jeecg.tRecords');
jeecg.tRecords = function(){
	var _box = null;

	// 缓存用户,型号,仓库 信息
	var personlist = null ;
	var goodskindlist = null ;
	var warehouselist = null ;
	// 创建
	var new_4_5_div = function () {
	    var str = $('#details').val().split(",") ;
        var n = 0 ;
        var html = '' ;
        for (var i=0;i<4;i++)
        {
            for (var j=0;j<5;j++)
            {
                html += '<div class="blockdiv">' ;
                html += '<input name="numinput" type="text" class="blockdiv-input" value="'+(n++)+'" >';
                html += '<input name="numinput" type="text" class="blockdiv-input" value="'+(n++)+'" >';
                html += '<input name="numinput" type="text" class="blockdiv-input" value="'+(n++)+'" >';
                html += '<input name="numinput" type="text" class="blockdiv-input" value="'+(n++)+'" >';
                html += '<input name="numinput" type="text" class="blockdiv-input" value="'+(n++)+'" >';
                html += '</div>';
            }
        }
        $('#divlistblock').html(html);
        $("div[name=divnuminputblock]").addClass("blockdiv");
        $("input[name='numinput']").addClass("blockdiv-input");
        $("input[name='numinput']").each(function () {
            $(this).on('keyup paste',function() {
                new_4_5_div_input_fire($(this).val())
            });
        })
    };
	// 输入时触发
	var  new_4_5_div_input_fire = function (str) {
        var moneyformat = $("#moneyformat").val() ;
        var regex = '' ;
        if(parseInt(moneyformat) == 0){
            regex = /^([1-9][\d]{5}|0)?$/ ;
        }
        if(parseInt(moneyformat) == 1){
            regex =/^([1-9][\d]{4}|0)?$/ ;
        }
        console.log("regex:"+str+","+regex.test(str));
    };

    var _this = {
		config:{
			event:{
				add:function(){
                    _box.handler.add();
                    $('#formpeopleid').combobox({
                        data:personlist,
                        valueField:'id',
                        textField:'name'
                    });
                    $('#formgoodskindid').combobox({
                        data:goodskindlist,
                        valueField:'id',
                        textField:'gooddskindname'
                    });
                    $('#formwarehouseid').combobox({
                        data:warehouselist,
                        valueField:'id',
                        textField:'warehousename'
                    });
                    // 创建4行5列 矩阵框
                    new_4_5_div();

				},
				edit:function(){
                    $('#formpeopleid').combobox({
                        data:personlist,
                        valueField:'id',
                        textField:'name'
                    });
                    $('#formgoodskindid').combobox({
                        data:goodskindlist,
                        valueField:'id',
                        textField:'gooddskindname'
                    });
                    $('#formwarehouseid').combobox({
                        data:warehouselist,
                        valueField:'id',
                        textField:'warehousename'
                    });
					_box.handler.edit(function (result) {});
                    // 创建4行5列 矩阵框
                    new_4_5_div();
				}
			},
  			dataGrid:{
  				title:'进出库记录管理',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
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
						},
					{field:'name',title:'买家',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.name;
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
					]]
			}
		},
		init:function(){
			_box = new YDataGrid(_this.config); 
			_box.init();

			jeecg.progress();
            jeecg.ajaxJson(urls['msUrl']+'/tContactPerson/dataList.do',{},function(data){
                if(data.total != null && data.total > 0 ){
                    personlist = [{id:-99,name:"--请选择--","selected":true}].concat(data.rows) ;
                    $('#peopleid').combobox({
                        data:personlist,
                        valueField:'id',
                        textField:'name'
                    });
                }else{
                    jeecg.alert('提示',data.msg,'error');
                }
                jeecg.closeProgress();
            });
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