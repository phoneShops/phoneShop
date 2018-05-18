<%@page import="com.phone.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<link rel="stylesheet" href="../css/newCss/bootstrap.css" type="text/css">
<%-- <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css"> --%>
<!-- <link rel="stylesheet" href="../css/newCss/flexslider.css"  type="text/css">-->
<%-- <link rel="stylesheet" href="<%=basePath %>css/newCss/jquery-ui.css"  type="text/css"> --%>
<%-- <link rel="stylesheet" href="<%=basePath %>css/newCss/flexslider.css"  type="text/css"> --%>
<%-- <link rel="stylesheet" href="<%=basePath %>css/newCss/pignose.layerslider.css"  type="text/css"> --%>
<link rel="stylesheet" href="<%=basePath%>css/newCss/style.css" type="text/css">
<link rel="stylesheet" href="<%=basePath %>css/font-awesome.min.css"  type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/sweetalert.css">

<title>手机商城主页</title>
<body>

	<!-- header -->
	<div class="header" style="background-color: #F5F5F5">
		<div class="container">
				<%
					User u = (User) session.getAttribute("user");
					if (u == null) {
				%>
			<ul>
				<li><a href="<%=basePath%>user/toregister"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>注册</a></li>
				<li><a href="<%=basePath%>user/tologin"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>登录</a></li>
				<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@example.com">info@example.com</a></li>
			</ul>	
				<%
					} else {
				%>
			<ul>
				<li><a href="/phone/user/toPerson_Order"><span class="glyphicon glyphicon-user"></span>个人中心：<%=u.getPhone()%></a></li>
				<li><a href="/phone/product/toCart"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a></li>
				<!-- <li><a href="/phone/user/topassword"><span class="glyphicon glyphicon-shopping-cart"></span>密码修改</a></li> -->
				<li><a href="/phone/user/userLog_On">注销账号</a></li>
			</ul>	
				<%
 	}
 %>

		</div>
	</div>
	<!-- //header -->
	<!-- header-bot -->
	<div class="header-bot">
		<div class="container">
			<div class="col-md-3 header-left">
				<h1>
					<a href="index.html"><img src="../images/logo3.jpg"></a>
				</h1>
			</div>
			<div class="col-md-6 header-middle">
				<form>
					<div class="search">
						<input type="search" value="Search" onFocus="this.value = '';"
							onBlur="if (this.value == '') {this.value = 'Search';}"
							required="">
					</div>
					<div class="section_room">
						<select id="country" onChange="change_country(this.value)"
							class="frm-field required">
							<option value="null">三星</option>
							<option value="null">苹果</option>
						</select>
					</div>
					<div class="sear-sub">
						<input type="submit" value="搜索">
					</div>
					<div class="clearfix"></div>
				</form>
			</div>
			<div class="col-md-3 header-right footer-bottom">
				<ul>
					<li><a href="#" class="use1" data-toggle="modal"
						data-target="#myModal4"><span>Login</span></a></li>
					<li><a class="fb" href="#"></a></li>
					<li><a class="twi" href="#"></a></li>
					<li><a class="insta" href="#"></a></li>
					<li><a class="you" href="#"></a></li>
				</ul>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //header-bot -->
	<!-- banner -->
	<div class="ban-top">
		<div class="container">
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse menu--shylock"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav menu__list">
							<li class=" menu__item"><a class="menu__link" href="/phone/user/toHome">主页</a></li>
							<li class=" menu__item"><a class="menu__link" href="">本店须知</a></li>
						</ul>
					</div>
				</div>
				</nav>
			</div>
			<div class="top_nav_right">
				<!-- 导航栏右侧 -->



			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	</div>
	<!-- //banner-top -->
	<!-- banner -->

	<!-- content -->



</body>

<!-- js -->
<script type="text/javascript" src="../js/newJs/jquery-2.1.4.min.js"></script>
<!-- cart -->
<script src="../js/newJs/simpleCart.min.js"></script>

<script src="../js/newJs/bootstrap-3.1.1.min.js"></script>
<script src="../js/newJs/jquery.easing.min.js"></script>
<script type="text/javascript" src="../js/newJs/pignose.layerslider.js"></script>
<script src="../js/newJs/easyResponsiveTabs.js" type="text/javascript"></script>
<script src="<%=basePath%>js/sweetalert.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
	});
</script>
<script type="text/javascript">
	function choice() {

	}
</script>
</html>