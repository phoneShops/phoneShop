<%@page import="com.phone.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%@ include file="../user/head.jsp"%>
<body>

		<!-- content -->
	<div class="new_arrivals" style="background-color: #F5F5F5">
			<center>
				<font size="5px;">火爆抢购</font>
			</center>
		<div class="container">
					<br><br>
					<div class="resp-tabs-container">
					
					<!-- 开始循环 -->
					<c:forEach items="${hotList}" var="item">  
							<div class="col-md-3 product-men">
								<div class="men-pro-item simpleCart_shelfItem">
									<div class="men-thumb-item">
										<img src="../images${item.picture.prAddress}" alt="" class="pro-image-front"> <img src="../images${item.picture.prAddress}" alt="" class="pro-image-back">
										<div class="men-cart-pro">
											<div class="inner-men-cart-pro">
												<a  onclick="toDetail(${item.product.pid})" class="link-product-add-cart">查看详情</a>
											</div>
										</div>
										<span class="product-new-top">HOT</span>

									</div>
									<div class="item-info-product ">
										<h4>
											<a href="single.html">${item.product.pname}</a>
										</h4>
										<div class="info-product-price">
											<span class="item_price">$ ${item.product.price}</span>
											<del>$5000</del>
										</div>
										<a onclick="toDetail(${item.product.pid});" class="item_add single-item hvr-outline-out button2">查看详情</a>
									</div>
								</div>
							</div>
						</c:forEach> 	
					</div>
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
	
	

	<!-- product-nav -->
	<div class="product-easy" style="background-color: #F5F5F5">
		<div class="container">
			<div class="sap_tabs">
				<div id="horizontalTab"
					style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"
							onclick="choice('1');"><span>三星</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"
							onclick="choice('2');"><span>苹果</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"
							onclick="choice('11');"><span>华为</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-3" role="tab"
							onclick="choice('12');"><span>小米</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-4" role="tab"
							onclick="choice('13');"><span>VIVO</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-5" role="tab"
							onclick="choice('14');"><span>一加</span></li>
						<li class="resp-tab-item" aria-controls="tab_item-5" role="tab"
							onclick="choice('0');"><span>其他</span></li>
					</ul>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0" id="ProductList">
						</div>
					</div>
					
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1" id="ProductList1">
						</div>
					</div>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2" id="ProductList2">
						</div>
					</div>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3" id="ProductList3">
						</div>
					</div>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-4" id="ProductList4">
						</div>
					</div>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-5" id="ProductList5">
						</div>
					</div>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-6" id="ProductList6">
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- //product-nav -->
	
		<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>

<!-- js -->
<!-- cart -->
<script src="../js/newJs/simpleCart.min.js"></script>

<script src="../js/newJs/bootstrap-3.1.1.min.js"></script>
<script src="../js/newJs/jquery.easing.min.js"></script>
<script type="text/javascript" src="../js/newJs/pignose.layerslider.js"></script>
<script src="../js/newJs/easyResponsiveTabs.js" type="text/javascript"></script>
<script src="../js/productJs/Product.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function() {
		$('#horizontalTab').easyResponsiveTabs({
			type : 'default', //Types: default, vertical, accordion           
			width : 'auto', //auto or any width like 600px
			fit : true
		// 100% fit in a container
		});
		
		
		choice(1);
		
	});



</script>
</html>