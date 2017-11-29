<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="head.jsp"%>


<title>Mobile Shop</title>
	
</head>

<body>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////HomePage///////////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="home-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<!-- Carousel -->
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="<%=basePath %>images/main-banner1-1903x600.jpg" alt="First slide">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
							<div class="item">
								<img src="<%=basePath %>images/main-banner2-1903x600.jpg" alt="Second slide">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
							<div class="item">
								<img src="<%=basePath %>images/main-banner3-1903x600.jpg" alt="Third slide">
								<!-- Static Header -->
								<div class="header-text hidden-xs">
									<div class="col-md-12 text-center">
									</div>
								</div><!-- /header-text -->
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div><!-- /carousel -->
				</div>
			</div>
			<div class="row">
				<div class="banner">
					<div class="col-sm-4">
						<img src="<%=basePath %>images/sub-banner1.png" />
					</div>
					<div class="col-sm-4">
						<img src="<%=basePath %>images/sub-banner2.png" />
					</div>
					<div class="col-sm-4">
						<img src="<%=basePath %>images/sub-banner3.png" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h2>SPECIAL PRODUCTS</h2></div>
					<div class="products">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="<%=basePath %>images/sanxingS8.jpg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">SamSung GALAXY S8</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="<%=basePath %>images/sanxingS8+.jpg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">SamSung GALAXY S8+</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="<%=basePath %>images/sanxingNote8.jpeg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">SamSung GALAXY NOTE8</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="<%=basePath %>images/Z1.png" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="banner">
					<div class="col-sm-6">
						<img src="<%=basePath %>images/sub-banner4.jpg" />
					</div>
					<div class="col-sm-6">
						<img src="<%=basePath %>images/sub-banner5.png" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h2>FEATURED PRODUCTS</h2></div>
					<div class="products">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="<%=basePath %>images/iphone.png" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="<%=basePath %>images/galaxy-s4.jpg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="<%=basePath %>images/galaxy-note.jpg" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="product">
								<div class="image"><a href="product.html"><img src="<%=basePath %>images/Z1.png" /></a></div>
								<div class="buttons">
									<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
									<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
									<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
								</div>
								<div class="caption">
									<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>
									<div class="price">$122<span>$98</span></div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
	</footer>
</body>
</html>
