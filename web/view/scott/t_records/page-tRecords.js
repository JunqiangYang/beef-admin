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

		}
	}
	return _this;
}();

$(function(){
	jeecg.tRecords.init();
});