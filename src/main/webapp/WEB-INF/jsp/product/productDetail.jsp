<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css"  type="text/css">
<!-- Custom CSS -->
<link rel="stylesheet" href="<%=basePath %>css/style.css">
<!-- Custom Fonts -->
<link rel="stylesheet" href="<%=basePath %>css/font-awesome.min.css"  type="text/css">
<link rel="stylesheet" href="<%=basePath %>fonts/font-slider.css" type="text/css">
<!-- jQuery and Modernizr-->
<script src="<%=basePath %>js/jquery-2.1.1.js"></script>
	
<!-- Core JavaScript Files -->  	 
<script src="<%=basePath %>js/bootstrap.min.js"></script>
<script src="<%=basePath %>js/photo-gallery.js"></script>
<script src="<%=basePath %>js/productJs/Product.js"></script>

<style type="text/css">
.loading{  
    width:160px;  
    height:56px;  
    position: absolute;  
    top:50%;  
    left:45%;  
    line-height:56px;  
    color:#fff;  
    padding-left:40px;  
    font-size:15px;  
    background: #000 url(<%=basePath%>images/img/loading.gif) no-repeat 65px 50%;  
    opacity: 0.7;  
    z-index:9999;  
    -moz-border-radius:2px;  
    -webkit-border-radius:2px;  
}  

</style>

<title>产品详情</title>
</head>
<body style="background-color: #F5F5F5">

<center><div id="myModal" class="modal fade" data-keyboard="false" data-backdrop="static" data-role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <div id="loading" class="">
            <span id="loadfont"></span>
         </div>
</div>
</center>


<div class="navbar-header">
<nav class="navbar  navbar-fixed-top">
	<ul class="breadcrumb">
		<li><a href="<%=basePath%>user/toHome">产品信息</a></li>
		<li><a href="">产品详细信息</a></li>
	</ul>
</nav>
</div><br>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Product Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div id="main-content" class="col-md-12">
					<div class="product">
						<div class="col-md-4">
							<div class="image">
								<img id="MAIN_PICTURE"  />
								<div class="image-more">
									 <ul class="row" id="PRODUCT_PICTURE">
									 
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-2"></div>
						
						<div class="col-md-6">
							<div class="caption">
								<div class="name"><b>产品型号：<span id="PRODUCT_NAME"></span></b></div><br>
								<div class="info">
									<ul>
										手机价格：<font size="5px;"><span style="color:red;">￥</span><span id="PRICE" style="color:red;"></span></font>
										<div class="price"><span><small>￥5000</small></span></div>
									</ul>
									<ul id="product_attr">
									</ul>
								</div>
								<br>
								<div class="name"><button type="button" style="border:1px;" class="btn-danger btn-primary btn-lg"><a id="PRODUCT_DETAIL">查看更多配置信息</a></button></div><br><br><br>
								
								<div class="name"><button type="button" style="border:0px;width:300px;height:50px" class="btn-danger btn-primary btn-lg" onclick="buy();">立即购买</button></div><br>								
						</div>
						<div class="clear"></div>
					</div>	
				</div>
			</div>
		</div>
		
		<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h6>用户评价</h6></div>
				</div>
				<div class="col-md-6" style="margin-bottom: 30px;">
					<form name="form1" id="ff" method="post" action="contact.php">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Your Name *" name="name" id="name" required data-validation-required-message="Please enter your name.">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" placeholder="Your Email *" name="email" id="email" required data-validation-required-message="Please enter your email address.">
						</div>
						<div class="form-group">
							<input type="tel" class="form-control" placeholder="Your Phone *" name="phone" id="phone" required data-validation-required-message="Please enter your phone number.">
						</div>
						<div class="form-group">
							<textarea class="form-control" placeholder="Your Message *" name="message" id="message" required data-validation-required-message="Please enter a message."></textarea>
						</div>
						<button type="submit" class="btn btn-1">Send Message</button>
					</form>
				</div>
				<div class="col-md-6">
					<p><span class="glyphicon glyphicon-home"></span> California, United States 3000009</p>
					<p><span class="glyphicon glyphicon-earphone"></span> +6221 888 888 90 , +6221 888 88891</p>
					<p><span class="glyphicon glyphicon-envelope"></span> info@yourdomain.com</p>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.289259162295!2d-120.7989351!3d37.5246781!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8091042b3386acd7%3A0x3b4a4cedc60363dd!2sMain+St%2C+Denair%2C+CA+95316%2C+Hoa+K%E1%BB%B3!5e0!3m2!1svi!2s!4v1434016649434" width="95%" height="230" frameborder="0" style="border:0"></iframe>
				</div>
			</div>
		
		
		
		
	</div>	
	
	<!-- IMG-thumb -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">         
          <div class="modal-body">                
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
	
	<!-- 隐藏域：用于隐藏所需值 -->
	<input type="text" id="PID_VAL" value="">
	
	
<script>

var pid;

$(function(){  
	
    pid = ${requestScope.pid};
    
    $("#myModal").modal("show");
    
    if(pid!=''){
    	
    	$("#PID_VAL").val(pid);
    	
	  	//查询产品详细信息
	  	qryProductDetail(pid);
      	//查询产品图片地址信息
	  	qryProductPicture(pid);
	  	//查询产品属性信息
	  	qryProductAttr(pid);
   	 }
    
  //关闭加载弹框
	close();
	  
});

	//图片浏览方法
	$(document).ready(function(){
		$(".nav-tabs a").click(function(){
			$(this).tab('show');
		});
		$('.nav-tabs a').on('shown.bs.tab', function(event){
			var x = $(event.target).text();         // active tab
			var y = $(event.relatedTarget).text();  // previous tab
			$(".act span").text(x);
			$(".prev span").text(y);
		});
	});
	
	/*关闭加载框*/
	function close(){
		$("#myModal").modal("hide");
	}

	
</script>
</body>
</html>