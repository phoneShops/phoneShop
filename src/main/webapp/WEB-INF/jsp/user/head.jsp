<%@page import="com.phone.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-xs-5">
				    <iframe style="position: absolute;top: 0px" id="fancybox-frame" name="fancybox-frame1507257625138" frameborder="0" scrolling="no" hspace="5"  src="http://i.tianqi.com/index.php?c=code&a=getcode&id=40&h=5&w=310"></iframe>
				</div>
				<div class="col-xs-7">
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
						<li><a href="account.html"><span class="glyphicon glyphicon-user"></span>个人中心</a></li>
						<li><a href="contact.html"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a></li>
						<select class="selectpicker">
						<option value="" selected>其他</option>
						<option value="已完成订单">已完成订单</option>
						<option value="购买记录查询">购买记录查询</option>
						<option value="密码修改">密码修改</option>
						<option value="积分查询">积分查询</option>
					</select>
					<%
					}
					%>
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
            			<input style="height: 40px;" placeholder="请输入手机品牌" type="text" class="form-control">
           				 <span  class="input-group-btn"><button style="height: 40px;"  type="button" class="btn btn-info">搜索</button></span>
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