<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>用户登录界面</title>

<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">



	<!--[if IE]>
		<script src="http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body>
<header class="container">
<br>
<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a></li>
						<li><a href="account.html">Login</a></li>
					</ul>
				</div>
			</div>
<br><br><br>
		<div class="row">

				<center><div id="logo"><img src="images/logo.png" /></div></center>
		</div>

	</header><div class="row" style="margin-top:30px;">
<div class="col-md-3" style="border-right:1px solid #ddd;"></div>
<div class="col-md-7" style="border-right:1px solid #ddd;">
	<div class="well col-md-10">
		<center><h4>用户登录</h4></center><br><br>
		<div class="input-group input-group-md">
			<span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
			<input type="text" class="form-control" placeholder="用户名" aria-describedby="sizing-addon1">
		</div>
		<br><br>
		<div class="input-group input-group-md">
			<span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-lock"></i></span>
			<input type="password" class="form-control" placeholder="密码" aria-describedby="sizing-addon1">
		</div>
		<br><br>

			<input style="width: 200px;height: 40px;" type="password" class="form-control" placeholder="验证码" aria-describedby="sizing-addon1">
			<img style="width: 70px;height: 20px;position: absolute;top: 260px;left: 250px" src="<%=basePath %>images/logo.png">
			<a href="" style="position: absolute;top: 260px;left: 350px">看不清，换一张？</a>
		<br><br>
		<div class="well well-sm" style="text-align:right;">
			<a href="" style="position: absolute;top: 350px;left: 25px">没有账号？马上注册</a>
			<a href="" >忘记密码？立即找回</a>
		</div>
		<br><br>
			<button type="submit" class="btn btn-success btn-block">登录</button>
		</div>
	</div>
</div>


<div class="col-md-2" style="border-right:1px solid #ddd;">
</div>