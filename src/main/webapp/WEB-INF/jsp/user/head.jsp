<%@page import="com.phone.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


 <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css"  type="text/css">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="<%=basePath %>css/style.css">
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="<%=basePath %>css/font-awesome.min.css"  type="text/css">
    <link rel="stylesheet" href="<%=basePath %>css/font-slider.css" type="text/css">
	
	<!-- jQuery and Modernizr-->
	<script src="<%=basePath %>js/jquery-2.1.1.js"></script>
	
	<!-- Core JavaScript Files -->  	 
    <script src="<%=basePath %>js/bootstrap.min.js"></script>
	
</head>

<body>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-xs-3">
					<iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=99" width="150" height="36" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
				</div>
				<div class="col-xs-9">
					<ul class="top-link">
					<%
						User u = (User)session.getAttribute("user");
						if(u==null){
					%>
						<li><a href="<%=basePath%>user/tologin"><span class="glyphicon glyphicon-user"></span>登录|</a></li>
						<li><a href="<%=basePath%>user/toregister"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
					<%
					}else{ 
					%>
						<li><a href="account.html"><span class="glyphicon glyphicon-user"></span></a></li>
						<li><a href="contact.html"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
						<li>
							<select class="form-control" style="width: 100px" onchange="choice(this)">
								<option value="" selected>其他</option>
								<option value="1">密码修改</option>
								<option value="2">已完成订单</option>
								<option value="3">购买记录查询</option>
								<option value="4">积分查询</option>
								<option value="5">注销</option>
						</select>
					<%
					}
					%>
					</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<!--Header-->
	<header class="container">
		<div class="row">
			<div class="col-md-6">
				<div id="logo"><img src="<%=basePath %>images/logo.png" /></div>
			</div>
			<div class="col-md-2">
			</div>
			<div class="col-md-4">
			<br>	 
			
					 <div class="input-group">
            			<input style="height: 40px;" id = "brand" placeholder="请输入手机型号" type="text" class="form-control">
           				 <span  class="input-group-btn"><button style="height: 40px;"  type="button" class="btn btn-info" id = "SouSuo">搜索</button></span>
       				 </div>
			</div>
		</div>
	</header>
	<!--Navigation-->
    <nav id="menu" class="navbar">
		<div class="container">
			<div class="navbar-header"><span id="heading" class="visible-xs">Categories</span>
			  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li><a href="index.html">主页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">平板系列</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.html">Window</a></li>
									<li><a href="category.html">MacBook</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">手机品牌</a>
						<div class="dropdown-menu" style="margin-left: -203.625px;">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.html">Iphone</a></li>
									<li><a href="category.html">Samsung</a></li>
									<li><a href="category.html">Nokia</a></li>
									<li><a href="category.html">Lenovo</a></li>
									<li><a href="category.html">Google</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="category.html">Nexus</a></li>
									<li><a href="category.html">Dell</a></li>
									<li><a href="category.html">Oppo</a></li>
									<li><a href="category.html">Blackberry</a></li>
									<li><a href="category.html">HTC</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="category.html">LG</a></li>
									<li><a href="category.html">Q-Mobiles</a></li>
									<li><a href="category.html">Sony</a></li>
									<li><a href="category.html">Wiko</a></li>
									<li><a href="category.html">T&T</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">本店须知</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

</body>
</html>


<script type="text/javascript">
 function choice(data){
	 
	 if(data.value==1){
		   window.location.href = "<%=basePath%>user/topassword";
		 
		 
	 }
	 
	 
 }

 $("#SouSuo").click(function(){
	 
	 var brand = $("#brand").val();
	 
	 window.location.href="<%=basePath%>product/toProduct?sousuo="+brand; 
	 
	});
 

</script>