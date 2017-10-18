$package('jeecg.tContactPerson');
jeecg.tContactPerson = function(){
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
  				title:'联系人记录管理',
	   			url:'dataList.do',
	   			columns:[[
					{field:'id',checkbox:true},
					{field:'name',title:'姓名',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.name;
							}
						},
					{field:'phone',title:'电话',align:'center',sortable:true,
							formatter:function(value,row,index){
								return row.phone;
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
	jeecg.tContactPerson.init();
});