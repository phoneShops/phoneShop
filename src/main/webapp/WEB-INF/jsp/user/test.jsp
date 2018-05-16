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



<link rel="stylesheet" href="../css/newCss/bootstrap.css"
	type="text/css">
<!-- <link rel="stylesheet" href="../css/newCss/flexslider.css"  type="text/css">-->
<%-- <link rel="stylesheet" href="<%=basePath %>css/newCss/jquery-ui.css"  type="text/css"> --%>
<%-- <link rel="stylesheet" href="<%=basePath %>css/newCss/flexslider.css"  type="text/css"> --%>
<%-- <link rel="stylesheet" href="<%=basePath %>css/newCss/pignose.layerslider.css"  type="text/css"> --%>
<link rel="stylesheet" href="<%=basePath%>css/newCss/style.css"
	type="text/css">


<title>test</title>
<body>

	<!-- header -->
	<div class="header">
		<div class="container">
			<ul>

				<%
					User u = (User) session.getAttribute("user");
					if (u == null) {
				%>
				<li><a href="<%=basePath%>user/toregister"><span class="glyphicon glyphicon-time" aria-hidden="true"></span>注册</a></li>
				<li><a href="<%=basePath%>user/tologin"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>登录</a></li>
				<li><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span><a href="mailto:info@example.com">info@example.com</a></li>
				<%
					} else {
				%>
				<li><a href="/phone/user/toPerson_Order"><span class="glyphicon glyphicon-user"></span><%=u.getPhone()%></a></li>
				<li><a href="/phone/product/toCart"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
				<li><select class="form-control" style="width: 100px" onchange="choice(this)">
						<option value="" selected>其他</option>
						<option value="1">密码修改</option>
						<option value="2">已完成订单</option>
						<option value="3">购买记录查询</option>
						<option value="4">积分查询</option>
						<option value="5">注销</option>
				</select> <%
 	}
 %></li>



			</ul>
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
							<option value="null">All categories</option>
							<option value="null">Electronics</option>
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
							<li class=" menu__item"><a class="menu__link" href="">主页</a></li>
							<li class=" menu__item"><a class="menu__link" href="">Electronics</a></li>
							<li class=" menu__item"><a class="menu__link" href="">Short
									Codes</a></li>
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

	<div class="new_arrivals">
		<div class="container">
			<h3>
				<span>new </span>arrivals
			</h3>
			<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
				accusantium doloremque laudantium</p>

		</div>
	</div>
	<!-- //content -->


	<!-- banner -->
	<div class="banner-grid">
		<div id="visual">
			<div class="slide-visual">
				<!-- Slide Image Area (1000 x 424) -->
				<ul class="slide-group">
					<li><img class="img-responsive" src="../images/img/home.jpg" /></li>
				</ul>
			</div>
		</div>

	</div>


	<!-- content-bottom -->
	<!-- //content-bottom -->
	<!-- product-nav -->

	<div class="product-easy" style="background-color: #F5F5F5">
		<div class="container">
			<div class="sap_tabs">
				<div id="horizontalTab"
					style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"
							onclick="choice();"><span>三星</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"
							onclick="choice();"><span>苹果</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"
							onclick="choice();"><span>华为</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-3" role="tab"
							onclick="choice();"><span>小米</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-4" role="tab"
							onclick="choice();"><span>VIVO</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-5" role="tab"
							onclick="choice();"><span>一加</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-5" role="tab"
							onclick="choice();"><span>其他</span></li>
					</ul>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../images/sanxingS8.jpg" alt=""
											class="pro-image-front"> <img
											src="../images/sanxingS8.jpg" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">查看详情</a>
											</div>
										</div>
										<span class="product-new-top">New</span>

									</div>
									<div class="item-info-product ">
										<h4>
											<a href="single.html">Air Tshirt Black</a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">$45.99</span>
											<del>$69.71</del>
										</div>
										<a href="#"
											class="item_add single-item hvr-outline-out button2">Add
											to cart</a>
									</div>
								</div>
							</div>
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../images/sanxingS8.jpg" alt=""
											class="pro-image-front"> <img
											src="../images/sanxingS8.jpg" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">查看详情</a>
											</div>
										</div>
										<span class="product-new-top">New</span>

									</div>
									<div class="item-info-product ">
										<h4>
											<a href="single.html">Next Blue Blazer</a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">$99.99</span>
											<del>$109.71</del>
										</div>
										<a href="#"
											class="item_add single-item hvr-outline-out button2">查看详情</a>
									</div>
								</div>
							</div>
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../images/sanxingS8.jpg" alt=""
											class="pro-image-front" width="200px" height="200px"> <img
											src="../images/sanxingS8.jpg" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">查看详情</a>
											</div>
										</div>
										<span class="product-new-top">New</span>

									</div>
									<div class="item-info-product ">
										<h4>
											<a href="single.html">Air Tshirt Black </a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">$119.99</span>
											<del>$120.71</del>
										</div>
										<a href="#"
											class="item_add single-item hvr-outline-out button2">Add
											to cart</a>
									</div>
								</div>
							</div>
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../images/sanxingS8.jpg" alt=""
											class="pro-image-front"> <img
											src="../images/sanxingS8.jpg" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">Quick
													View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>

									</div>
									<div class="item-info-product ">
										<h4>
											<a href="single.html">Air Tshirt Black </a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">$129.99</span>
											<del>$150.71</del>
										</div>
										<a href="#"
											class="item_add single-item hvr-outline-out button2">Add
											to cart</a>
									</div>
								</div>
							</div>
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../images/sanxingS8.jpg" alt=""
											class="pro-image-front"> <img
											src="../images/sanxingS8.jpg" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">Quick
													View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>

									</div>
									<div class="item-info-product ">
										<h4>
											<a href="single.html">Dresses</a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">$129.99</span>
											<del>$150.71</del>
										</div>
										<a href="#"
											class="item_add single-item hvr-outline-out button2">Add
											to cart</a>
									</div>
								</div>
							</div>
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../images/sanxingS8.jpg" alt=""
											class="pro-image-front"> <img
											src="../images/sanxingS8.jpg" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">Quick
													View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>

									</div>
									<div class="item-info-product ">
										<h4>
											<a href="single.html">Wedding Blazers</a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">$129.99</span>
											<del>$150.71</del>
										</div>
										<a href="#"
											class="item_add single-item hvr-outline-out button2">Add
											to cart</a>
									</div>
								</div>
							</div>
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../images/sanxingS8.jpg" alt=""
											class="pro-image-front"> <img
											src="../images/sanxingS8.jpg" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">Quick
													View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>

									</div>
									<div class="item-info-product ">
										<h4>
											<a href="single.html">Dresses</a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">$45.99</span>
											<del>$69.71</del>
										</div>
										<a href="#"
											class="item_add single-item hvr-outline-out button2">Add
											to cart</a>
									</div>
								</div>
							</div>
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../images/sanxingS8.jpg" alt=""
											class="pro-image-front"> <img
											src="../images/sanxingS8.jpg" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a href="single.html" class="link-product-add-cart">Quick
													View</a>
											</div>
										</div>
										<span class="product-new-top">New</span>

									</div>
									<div class="item-info-product ">
										<h4>
											<a href="single.html"> Shirts</a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">$45.99</span>
											<del>$69.71</del>
										</div>
										<a href="#"
											class="item_add single-item hvr-outline-out button2">Add
											to cart</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //product-nav -->
</body>

<!-- js -->
<script type="text/javascript" src="../js/newJs/jquery-2.1.4.min.js"></script>
<!-- cart -->
<script src="../js/newJs/simpleCart.min.js"></script>

<script src="../js/newJs/bootstrap-3.1.1.min.js"></script>
<script src="../js/newJs/jquery.easing.min.js"></script>
<script type="text/javascript" src="../js/newJs/pignose.layerslider.js"></script>
<script src="../js/newJs/easyResponsiveTabs.js" type="text/javascript"></script>
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