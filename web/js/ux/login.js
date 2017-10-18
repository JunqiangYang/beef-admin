$package('jeecg.login');
jeecg.login = function(){
	return {
		toLogin:function(){
			try{
				var form = $("#loginForm");
				if(form.form('validate')){
					jeecg.progress('Please waiting','Loading...');
					jeecg.submitForm(form,function(data){
						jeecg.closeProgress();
						if(data.success){
					 		window.location= "main.shtml";
				        }else{
				       	   jeecg.alert('提示',data.msg,'error');  
				        }
				        jeecg.login.loadVrifyCode();//刷新验证码
					});
				}
			}catch(e){
				
			}
			return false;
		},
		loadVrifyCode:function(){//刷新验证码
			var _url = "ImageServlet?time="+new Date().getTime();
			$(".vc-pic").attr('src',_url);
		},
		init:function(){
			if(window.top != window.self){
				window.top.location =  window.self.location;
			}
			//验证码图片绑定点击事件
			$(".vc-pic").click(jeecg.login.loadVrifyCode);
			
			var form = $("#loginForm");
			form.submit(jeecg.login.toLogin);
		}
	}
}();

$(function(){
	jeecg.login.init();
});		