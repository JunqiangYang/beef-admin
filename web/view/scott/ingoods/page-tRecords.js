$package('jeecg.inRecords');
jeecg.inRecords = function(){
    var _box = null;

    // 缓存用户,型号,仓库 信息
    var goodskindlist = null ;
    var warehouselist = null ;

    var _this = {
        config:{
            event:{
                add:function(){
                    _box.handler.add();
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

                },
                edit:function(){
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
                    });
                },
                save:function () {
                    _box.handler.save();
                }
            },
            dataGrid:{
                title:'进库_记录管理',
                url:'dataList.do',
                columns:[[
                    {field:'id',checkbox:true},
                    {field:'createtime',title:'创建时间',align:'center',sortable:true,
                        formatter:function(value,row,index){
                            return row.createtime;
                        }
                    },
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
                    {field:'nums',title:'件数',align:'center',sortable:true,
                        formatter:function(value,row,index){
                            return row.nums;
                        }
                    }
                ]]
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
    jeecg.inRecords.init();
});