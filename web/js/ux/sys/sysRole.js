$package('jeecg.sysRole');
jeecg.sysRole = function(){
	var _box = null;
	var _this = {
		menu: $('#menu-tree'),
		buildTreeData:function(nodes){
			$.each(nodes,function(i,note){
				var id = note.attributes.id;
				var type = note.attributes.type;
				var $id = $("<input type='hidden' name='menuIds' class='c_menus'>");
				if(type == 0){
					$id.attr('name','menuIds');
				}else if(type == 1){
					$id.attr('name','btnIds');
				}
				$id.val(id);
				_box.form.edit.append($id);
			});
		},
		setTreeValue:function(id){
			var node = _this.menu.tree("find",id);
			if(node && node.target){
				//判断是否选择或者半选状态 
				if($(node.target).find(".tree-checkbox0")[0]){
					_this.menu.tree('check',node.target);
				}
			}
		},
		clearTreeData:function(){
			$(".tree-checkbox1",_this.menu).removeClass("tree-checkbox1").addClass("tree-checkbox0")
			$(".tree-checkbox2",_this.menu).removeClass("tree-checkbox2").addClass("tree-checkbox0");
			$('.c_menus').remove();
		},
		save:function(){
			var checknodes = _this.menu.tree('getChecked');	
			var innodes = _this.menu.tree('getChecked','indeterminate');
			_this.buildTreeData(checknodes);
			_this.buildTreeData(innodes);
			_box.handler.save();
		},
		config:{
			event:{
				add:function(){
					_this.clearTreeData();
					_box.handler.add();
				},
				edit:function(){
					_this.clearTreeData();
					_box.handler.edit(function(result){
						var btnIds  = result.data.btnIds;
						var menuIds  = result.data.menuIds;
						$.each(btnIds,function(i,id){
							_this.setTreeValue("btn_"+id);
						});
						
						$.each(menuIds,function(i,id){
							_this.setTreeValue("menu_"+id);
						});
					});
				},
				save:function(){
					//判断是否被禁用帐号
					var state = $("input[name='state']",_box.form.edit).val();
					if(state != 0){
						jeecg.confirm("提示","禁用角色将会自动解除关联的用户授权,是否确定?",function(r){
							if(r){
								_this.save();
							}
						});
					}else{
						_this.save();
					}
				}
			},
  			dataGrid:{
  				title:'角色列表',
	   			url:'dataList.do',
	   			columns:[[
						{field:'id',checkbox:true},
						{field:'roleName',title:'角色名称',width:80,sortable:true},
						{field:'state',title:'状态',width:80,align:'center',sortable:true,styler:function(value,row,index){
								if(value == 1){
								  return 'color:red;';  
								}
							},
							formatter:function(value,row,index){
								if(value == 0){
									return "可用";
								}
								if(value == 1){
									return "禁用";
								}
							}},
						{field:'createTime',title:'创建时间',width:120,sortable:true},
						{field:'updateTime',title:'修改时间',width:120,sortable:true},
						{field:'descr',title:'描述',width:120,sortable:true}
						
				]]
			}
		},
		init:function(){
			_box = new YDataGrid(_this.config); 
			_box.init();
			
			_this.menu.tree({
				url:'../sysMenu/getMenuTree.do',
				checkbox:true
			});
		}
	}
	return _this;
}();

$(function(){
	jeecg.sysRole.init();
});		