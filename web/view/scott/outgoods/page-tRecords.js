$package('jeecg.outRecords');
jeecg.outRecords = function(){
	var _box = null;

	// 缓存用户,型号,仓库 信息
	var personlist = null ;
	var goodskindlist = null ;
	var warehouselist = null ;

	var appendstr = function (str , append) {
        if(str.trim().length == 0){
            return append+"," ;
        }
        if(str.endsWith(",")){
            return str+append+"," ;
        }
        if(!str.endsWith(",")){
            return str+","+append+"," ;
        }
    }

    // 页面 加总数
    var sum = function (str) {
        var total = 0 ;str+="";
        var arr =   str.split(",");
        for (var i=0; i<arr.length  ; i++){
            var obj = arr[i] ;
            if(obj.trim().length != 0 ){
                total += parseInt(obj);
            }
        }
        var formatgoogskindId  = parseInt($('#formgoodskindid').combobox('getValue'));
        for (var i=0; i<goodskindlist.length  ; i++){
            var goodkind = goodskindlist[i] ;
            if (formatgoogskindId == goodkind.id && goodkind.isFixedweight ==1 ){
                var nums  = parseInt($('#nums').val()) ;
                for(var j = 1 ; j < num ; j++){
                    total+=total ;
                }
                break ;
            }
        }
        return total;
    }

    // TODO 这里没准得加总价
    // 列显示哪里加总数
    var sumWeight = function (str,nums,formatgoogskindId) {
        var total = 0 ;
        str+="";
        var goodkind = null ;
        for (var i=0; i<goodskindlist.length  ; i++){
            goodkind = goodskindlist[i] ;
            if (formatgoogskindId == goodkind.id ){
                break ;
            }
        }
        if (goodkind !== null || goodkind !== undefined || goodkind !== '') {
            var arr =   str.split(",");
            if(goodkind.isFixedweight ==1 ){
                console.info("nums="+nums) ;
                for(var j = 1 ; j < num ; j++){
                    total+=arr[0] ;
                }
            }else{
                //for (let obj of arr) {
                for (var i=0; i<arr.length  ; i++){
                    var obj = arr[i] ;
                    if(obj.trim().length != 0 ){
                        total += parseInt(obj);
                    }
                }
            }
        }else{
            console.info("sumWeight error!!")
        }
        return total;
    };
    var formatPricesss =function (value,weightformat){
        //weightformat 是否固定重量 0(不定),1(定重)
        if(value=="" || value==undefined){
            return ""
        }
        var totalprice = 0 ;
        if(parseInt(weightformat) == 0){
            console.info(parseFloat(value)*parseFloat(0.01)) ;
            totalprice = parseFloat(value)*parseFloat(0.01);
        }
        if(parseInt(weightformat) == 1){
            console.info(parseFloat(value)*parseFloat(0.001)) ;
            totalprice =  parseFloat(value)*parseFloat(0.001) ;
        }
        totalprice = Math.round(totalprice * 100) / 100
        return totalprice ;
    };


    var formatWeight =function (value,weightformat){
        if(value=="" || value==undefined){
            return ""
        }
        value+="";
        var len = value.length ;
        if(parseInt(weightformat) == 0){
            return value.toString().substring(0,len-2)+"."+value.toString().substring(len-2);
        }
        if(parseInt(weightformat) == 1){
            return value.toString().substring(0,len-3)+"."+value.toString().substring(len-3);
        }
    }

    var refreshtotal = function(){
        $('#nums').val(0);
        $("#totalweight").html('') ;
        $("#totalprice").html('') ;
        var weightformat = '';
        var deatils = '' ;
        var boxnum = 0 ;
        var inputs = $("input[name^='numinput']") ;
        $(inputs).each(function (i,n) {
            var str = $(this).val() ;
            weightformat = parseInt($("#weightformat").val()) ;
            var regex = /^\d{4}$/ ;
            if(weightformat == 1){
                regex =/^\d{5}$/;
            }
            if(str.trim().length==0){
                return  ;
            }
            if(regex.test(str)){
                deatils = appendstr(deatils,str) ;
                boxnum++ ;
            }
        });
        $('#nums').val(boxnum);
        $("#totalweight").html(sum(deatils)) ;
        var price = $('#price').val().trim().length==0 ? 0 : $('#price').val();
        console.info(parseFloat(sum(deatils))+","+parseFloat(price)) ;
        $("#totalprice").html( formatPricesss(parseFloat(sum(deatils))*parseFloat(price)*2,weightformat))  ;
    }

    // 创建
	var new_4_5_div = function (str) {
	    //var str = $('#details').val();
        $("#details").val('');
	    var arr = new Array(100);
        for(var j = 0,len=arr.length; j<len; j++) { arr[j] = ''; }
	    if(str != null && str.trim().length != 0 ){
            var a = str.split(",");
            for(var j = 0,len=a.length; j<len; j++) { arr[j] = a[j]; }
        }
       // console.info(arr);
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
                var regex = /^\d{4}$/ ;
                if(parseInt(weightformat) == 1){
                    regex =/^\d{5}$/;
                }
                if(regex.test(str) || str.trim().length ==0){
                    $(this).removeClass("redborder");
                    if(i<len-1){
                       $(inputs[i+1]).focus();
                    }
                    refreshtotal();
                }else{
                    $(this).addClass("redborder");
                }
            });
        });
    };



    var new_1_1_div = function (str) {
        $("#details").val('');
        var arr = str.split(",");
        var html = '' ;
        html += '<div class="blockdiv">' ;
        html += '<input name="numinput" type="text" value="'+(arr[0])+'" >';
        html += '</div>';
        $('#divlistblock').html(html);
        $("div[name=divnuminputblock]").addClass("blockdiv");
        $("input[name='numinput']").addClass("blockdiv-input");
        var inputs = $("input[name^='numinput']") ;
        var len = inputs.length ;
        $(inputs).each(function (i,n) {
            $(this).keyup(function(e) {
                var str = $(this).val() ;
                var weightformat = $("#weightformat").val() ;
                var regex = /^\d{4}$/ ;
                if(parseInt(weightformat) == 1){
                    regex =/^\d{5}$/;
                }
                if(regex.test(str) || str.trim().length ==0){
                    $(this).removeClass("redborder");
                    if(i<len-1){
                        $(inputs[i+1]).focus();
                    }
                    refreshtotal();
                }else{
                    $(this).addClass("redborder");
                }
            });
        });
        if(str.length>4){
            refreshtotal();
        }

    };

    var _this = {
		config:{
            action:{
                save:'/outgoods/save.do',
                getId:'/outgoods/getId.do',
                remove:'/outgoods/delete.do'
            },
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
                    refreshtotal();
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
                        if(result.data.isfixedweight != undefined && result.data.isfixedweight ==0 ){
                            new_1_1_div(result.data.details);
                        }else{
                            // 创建4行5列 矩阵框
                            new_4_5_div(result.data.details);
                        }
                        $("#totalweight").html(sumWeight(result.data.details,result.data.nums ,result.data.goodsKindId)) ;
                        var price = (result.data.price+"").trim().length==0 ? 0 : result.data.price;
                        console.info(sumWeight(result.data.details,result.data.nums ,result.data.goodsKindId)+","+parseFloat(price)+","+formatPricesss(parseFloat(sumWeight(result.data.details,result.data.nums ,result.data.goodsKindId))*parseFloat(price)*2, result.data.isfixedweight)) ;
                        $("#totalprice").html( formatPricesss(parseFloat(sumWeight(result.data.details,result.data.nums ,result.data.goodsKindId))*parseFloat(price)*2, result.data.isfixedweight)) ;
                    });
				},
                save:function () {
                    var check = true ;
				    var deatils = '' ;
                    $("input[name='numinput']").each(function () {
                        var str = $(this).val() ;
                        var weightformat = $("#weightformat").val() ;
                        var regex = /^\d{4}$/ ;
                        if(parseInt(weightformat) == 1){
                            regex =/^\d{5}$/;
                        }
                        if(regex.test(str) || str.trim().length ==0){
                            $(this).removeClass("redborder");
                            if(str.trim().length>0) {deatils += (str+",") ; }
                        }else{
                            $(this).addClass("redborder");
                            check = false ;
                        }
                    });
                    if(!check) return;
                    var total =  sum(deatils) ;
                    var showtotal = parseInt($("#totalweight").html()) ;
                    if(showtotal != total){
                        jeecg.alert('提示',' 表单总数计算与显示异常','error');
                        return ;
                    }
                    if(deatils.length>0) deatils=deatils.substring(0,deatils.length-1);
                    $("#details").val(deatils);
                    $("#remark").val($("#remarktextarea").val());
                    _box.handler.save();
                }
			},
  			dataGrid:{
  				title:'待打印_出库_记录管理',
	   			url:'/outgoods/dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
                    {field:'createtime',title:'创建时间',align:'center',sortable:true,
                        formatter:function(value,row,index){
                            return row.createtime;
                        }
                    },
                    {field:'name',title:'买家',align:'center',sortable:true,
                        formatter:function(value,row,index){
                            return row.name;
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
                    {field:'price',title:'价格',align:'center',sortable:true,
                        formatter:function(value,row,index){
                            return row.price;
                        }
                    },
                    {field:'weightotal',title:'总重',align:'center',sortable:true,width:150,
                        formatter:function(value,row,index){
                            return formatWeight(sumWeight(row.details,row.nums,row.goodsKindId),row.weightformat) ;
                        }
                    },
					{field:'warehouseName',title:'仓库',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.warehouseName;
							}
						},
					{field:'status',title:'操作',align:'center',sortable:true,
							formatter:function(value,row,index){
								return "<a href=''></a>";
							}
						}
					]],
                toolbar:[
                    {id:'btnadd',text:'添加',btnType:'add'},
                    {id:'btnedit',text:'查看',btnType:'edit'},
                    {id:'btndelete',text:'删除',btnType:'remove'},
                    {
                        id:'btnprint',
                        text:'打印',
                        iconCls:'icon-print',
                        handler:function(){
                            console.info("print");
                            console.info("获取需要打印数据, 打印赋值, 打印div");
                        }
                    }
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
            $("#formgoodskindid").combobox({
                onChange: function (n,o) {
                  //  console.info(n);
                   // for (let obj of goodskindlist) {
                    for(var i=0; i<goodskindlist.length  ; i++){
                            var obj = goodskindlist[i] ;
                            if(obj.isfixedweight != undefined && parseInt(obj.id) == parseInt(n) ){
                                $("#weightformat").val(obj.weightformat) ;
                                if( obj.isfixedweight ==0 ){
                                    new_4_5_div('');
                                }else{
                                    new_1_1_div(''+obj.weight+'');
                                }
                                refreshtotal();
                                return ;
                            }
                    }
                }
            });

            $("#price").on('input',function(e){
                console.info("onchange");
                refreshtotal();
            });

        }
	}
	return _this;
}();

$(function(){
	jeecg.outRecords.init();
});