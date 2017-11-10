<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>录入系统</title>
	<%@include file="/view/resource.jsp" %>
	<link rel="stylesheet" href="/css/enter/font-awesome.min.css">
	<link rel="stylesheet" href="/css/enter/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/css/enter/htmleaf-demo.css">
	<style type="text/css">
		.form-bg{
		    background: #00b4ef;
		}
		.form-horizontal{
		    background: #fff;
		    padding-bottom: 40px;
		    border-radius: 15px;
		    text-align: center;
		}
		.form-horizontal .heading{
		    display: block;
		    font-size: 35px;
		    font-weight: 700;
		    padding: 35px 0;
		    border-bottom: 1px solid #f0f0f0;
		    margin-bottom: 30px;
		}
		.form-horizontal .form-group{
		    padding: 0 40px;
		    margin: 0 0 25px 0;
		    position: relative;
		}
		.form-horizontal .form-control{
		    background: #f0f0f0;
		    border: none;
		    border-radius: 20px;
		    box-shadow: none;
		    padding: 0 20px 0 45px;
		    height: 40px;
		    transition: all 0.3s ease 0s;
		}
		.form-horizontal .form-control:focus{
		    background: #e0e0e0;
		    box-shadow: none;
		    outline: 0 none;
		}
		.form-horizontal .form-group i{
		    position: absolute;
		    top: 12px;
		    left: 60px;
		    font-size: 17px;
		    color: #c8c8c8;
		    transition : all 0.5s ease 0s;
		}
		.form-horizontal .form-control:focus + i{
		    color: #00b4ef;
		}
		.form-horizontal .fa-question-circle{
		    display: inline-block;
		    position: absolute;
		    top: 12px;
		    right: 60px;
		    font-size: 20px;
		    color: #808080;
		    transition: all 0.5s ease 0s;
		}
		.form-horizontal .fa-question-circle:hover{
		    color: #000;
		}
		.form-horizontal .main-checkbox{
		    float: left;
		    width: 20px;
		    height: 20px;
		    background: #11a3fc;
		    border-radius: 50%;
		    position: relative;
		    margin: 5px 0 0 5px;
		    border: 1px solid #11a3fc;
		}
		.form-horizontal .main-checkbox label{
		    width: 20px;
		    height: 20px;
		    position: absolute;
		    top: 0;
		    left: 0;
		    cursor: pointer;
		}
		.form-horizontal .main-checkbox label:after{
		    content: "";
		    width: 10px;
		    height: 5px;
		    position: absolute;
		    top: 5px;
		    left: 4px;
		    border: 3px solid #fff;
		    border-top: none;
		    border-right: none;
		    background: transparent;
		    opacity: 0;
		    -webkit-transform: rotate(-45deg);
		    transform: rotate(-45deg);
		}
		.form-horizontal .main-checkbox input[type=checkbox]{
		    visibility: hidden;
		}
		.form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
		    opacity: 1;
		}
		.form-horizontal .text{
		    float: left;
		    margin-left: 7px;
		    line-height: 20px;
		    padding-top: 5px;
		    text-transform: capitalize;
		}
		.form-horizontal .btn{
		    float: right;
		    font-size: 14px;
		    color: #fff;
		    background: #00b4ef;
		    border-radius: 30px;
		    padding: 10px 25px;
		    border: none;
		    text-transform: capitalize;
		    transition: all 0.5s ease 0s;
		}
		@media only screen and (max-width: 479px){
		    .form-horizontal .form-group{
		        padding: 0 25px;
		    }
		    .form-horizontal .form-group i{
		        left: 45px;
		    }
		    .form-horizontal .btn{
		        padding: 10px 20px;
		    }
		}
		.text_success {
			font-size:14px;
			text-align:center;
			margin:0px 0 35px 0;
			line-height:25px;
			position: absolute;
			left: 50%;
			width: 200px;
			top: 50%;
			z-index: 50;
			margin-left: -100px;
			text-transform: uppercase;
			padding: 20px 0px;
			margin-top: -100px;
			display: none;
		}
		.text_success img {
		}
		.text_success span {
			display: block;
			padding: 10px;
			color: #CCC;
		}

	</style>
	<script src="/js/enter/html5shiv.min.js"></script>
	<script type="text/javascript" src="/plug-in/jquery/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/plug-in/jquery/jquery.cookie.js"></script>
	<script type="text/javascript" src="/plug-in/login/js/jquery-jrumble.js"></script>
	<script type="text/javascript" src="/plug-in/login/js/jquery.tipsy.js"></script>
	<script type="text/javascript" src="/plug-in/login/js/iphone.check.js"></script>
	<script type="text/javascript" src="/plug-in/login/js/login2.js"></script>
</head>
<body>
	<div id="alertMessage"></div>
	<div id="successLogin"></div>
	<div class="text_success">
		<img src="/plug-in/login/images/loader_green.gif" alt="Please wait" />
		<span>登陆成功!请稍后....</span>
	</div>
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<h1>录入系统 <span>enter </span></h1>
			<div class="htmleaf-links">
				<a class="htmleaf-icon icon-htmleaf-home-outline" href="http://admin.njwdydk.com/" title="主站" target="_blank"><span> 主站</span></a>
				<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="#" title="返回" target="_blank"><span> 返回</span></a>
			</div>
		</header>
		<div class="demo form-bg" style="padding: 20px 0;">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-offset-3 col-md-6">
		                    <form class="form-horizontal" action="/checkuser.do" check="/checkuser.do" method="post">
		                        <span class="heading">用户登录</span>
		                        <div class="form-group tip">
		                            <input type="email" name="email"  class="form-control" id="email" placeholder="用户名或电子邮件" iscookie="true"  nullmsg="请输入用户名!">
		                            <i class="fa fa-user"></i>
		                        </div>
		                        <div class="form-group help">
		                            <input type="password" class="form-control" name="pwd" id="pwd" placeholder="密　码">
		                            <i class="fa fa-lock"></i>
		                            <a href="#" class="fa fa-question-circle"></a>
		                        </div>
		                        <div class="form-group">
		                            <div class="main-checkbox">
		                                <input type="checkbox" value="1" id="on_off" name="on_off"/>
		                                <label for="on_off"></label>
		                            </div>
		                            <span class="text">Remember me</span>
		                            <button class="btn btn-default" id="but_login" >登录</button>
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		<div class="related">
			  <h3>版权所有: damon</h3>
		</div>
	</div>
	
</body>
</html>