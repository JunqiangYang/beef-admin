$package('jeecg.tRecords');
jeecg.tRecords = function(){
	var _box = null;

	// 缓存用户,型号,仓库 信息
	var personlist = null ;
	var goodskindlist = null ;
	var warehouselist = null ;
	// 创建
	var new_4_5_div = function (str) {
	    //var str = $('#details').val();
	    var arr = new Array(100);
        for(var j = 0,len=arr.length; j<len; j++) { arr[j] = ''; }
	    if(str != null && str.trim().length != 0 ){
            var a = str.split(",");
            for(var j = 0,len=a.length; j<len; j++) { arr[j] = a[j]; }
        }
        console.info(arr);
        var n = 0 ;
        var html = '' ;
        for (var i=0;i<4;i++)
        {
            for (var j=0;j<5;j++)
            {
                html += '<div class="blockdiv">' ;
                html += '<input name="numinput" type="text" value="'+(arr[n++])+'" >';
                html += '<input name="numinput" type="text" value="'+(arr[n++])+'" >';
                html += '<input name="numinput" type="text" value="'+(arr[n++])+'" >';
                html += '<input name="numinput" type="text" value="'+(arr[n++])+'" >';
                html += '<input name="numinput" type="text" value="'+(arr[n++])+'" >';
                html += '</div>';
            }
        }
        $('#divlistblock').html(html);
        $("div[name=divnuminputblock]").addClass("blockdiv");
        $("input[name='numinput']").addClass("blockdiv-input");
        var inputs = $("input[name^='numinput']") ;
        var len = inputs.length ;
        $(inputs).each(function (i,n) {
            $(this).keyup(function(e) {
                var str = $(this).val() ;
                var weightformat = $("#weightformat").val() ;
                var regex = /^\d{5}$/ ;
                if(parseInt(weightformat) == 1){
                    regex =/^\d{4}$/;
                }
                if(regex.test(str) || str.trim().length ==0){
                    $(this).removeClass("redborder");
                    console.info("90");
                    if(i<len-1){
                        $(inputs[i+1]).focus();
                    }
                    // $(this).next().focus();
                }else{
                    $(this).addClass("redborder");
                }
            });
        });
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
                    new_4_5_div('');

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
					_box.handler.edit(function (result) {
                        $("#remarktextarea").val($("#remark").val());
                        // 创建4行5列 矩阵框
                        new_4_5_div(result.data.details);
                    });
				},
                save:function () {
                    var check = true ;
				    var deatils = '' ;
                    $("input[name='numinput']").each(function () {
                        var str = $(this).val() ;
                        var weightformat = $("#weightformat").val() ;
                        var regex = /^\d{5}$/ ;
                        if(parseInt(weightformat) == 1){
                            regex =/^\d{4}$/;
                        }
                        if(regex.test(str) || str.trim().length ==0){
                            $(this).removeClass("redborder");
                            if(str.trim().length>0) deatils += (str+",") ;
                        }else{
                            $(this).addClass("redborder");
                            check = false ;
                        }
                    });
                    if(!check) return;
				    console.info(deatils);
                    if(deatils.length>0) deatils=deatils.substring(0,deatils.length-1);
                    $("#details").val(deatils);
                    $("#remark").val($("#remarktextarea").val());
                    _box.handler.save();
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
					]],
                    toolbar:[
                    ]
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