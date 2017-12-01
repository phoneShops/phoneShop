<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="../user/head.jsp"%>
<head>
<title>产品筛选</title>

<script src="<%=basePath %>js/zepto.min.js"></script>

<style>
table {
	width: 100%;
	padding: 0 15px;
	background: #fff;
	border-collapse: collapse;
}

table td {
	padding: 6px 0;
	width: 33%;
	border-bottom: 1px solid #e1e1e1;
}

tr td:nth-child(2) {
	text-align: center;
}

tr td img {
	width: 24px;
	vertical-align: middle;
}

tr td:last-child {
	text-align: right;
}

td>div:first-child {
	/*margin-bottom: -6px;*/
	
}

td>div:last-child {
	color: #9C9C9C;
}

.loading {
    width: 160px;
    height: 56px;
    position: absolute;
    top: 50%;
    left: 35%;
    line-height: 56px;
    color: #fff;
    padding-left: 60px;
    font-size: 15px;
    background: #000 url(../loading/image/loading.gif) no-repeat 10px 50%;
    opacity: 0.7;
    z-index: 9999;
    -moz-border-radius: 20px;
    -webkit-border-radius: 20px;
    border-radius: 20px;
    filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70);
}
</style>
</head>
<body>
	<input type="hidden" name="pageNo" id="pageNo" value="1" />
	<div class="white">
		<table id="wrapper">
			
		</table>
	</div>
	
	<div class="row">
			<div class="col-lg-12">
				<div class="heading"><h2>最新产品</h2></div>
				<div class="products" id = "products">
							
				</div>
			</div>
	</div>	
			
	<!-- 加载中的框 -->		
	<div class="container">
        <div id="myModal" class="modal fade" data-keyboard="false"
            data-backdrop="static" data-role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div id="loading" class="loading"><span id="loadfont">加载中。。。</span></div>
        </div>
    </div>	
</body>
<script type="text/javascript">  
$(function(){  
    //query('01');//第一次加载  
	loading = true;
});  


function close(){
	
	$("#myModal").modal("hide");

	
}
function query(type)  
{  
    
	$("#myModal").modal("show");
	
	setTimeout('close()',1000);
	
	var content = "";

	
    for (var i = 0; i < 1; i++) {

		content = content + '<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">' 
		        + '<div class="product">'
		        +'<div class="image" <a href="product.html">>'
		        +'<img src="<%=basePath %>images/Z1.png" />'
		        +'</a></div>'
		        +'<div class="buttons">'
		        +'<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>'
		        +'<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>'
		        +'<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>'
		        +'</div><div class="caption">'
		        +'<div class="name"><h3><a href="product.html">Aliquam erat volutpat</a></h3></div>'
		        +'<div class="price">$122<span>$98</span></div>'
		        +'<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span>'
		        +'</span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span></div>'
		        +'</div></div></div></div></div></div>'
		        
		        
	}
	$("#products").append(content);
    
	
    
    $.ajax({  
        url : "<%=path%>/query",
			data : {
  			pageNo : $("#pageNo").val()
			},
			cache : false,
			success : function(data) {
				loading = true;
				if (data == null) {

					$("#pageNo").val(parseInt($("#pageNo").val()) - 1);
				} else {
					var content = "";
					if (type == "00") {
						if (data.length == 0) {
							$("#pageNo").val(parseInt($("#pageNo").val()) - 1);
							return "";
						}
						for (var i = 0; i < 8; i++) {

							content = content + '<tr>' + '<td><div>'
									+ data[i].id + '</div><div>' + 10
									+ '</div></td>' + '<td>¥' + 6
									+ '</td>' + '</tr>';
						}
						$("#wrapper").append(content);
					} else {

						for (var i = 0; i < 5; i++) {

							content = content + '<tr>' + '<td><div>'
									+ data[i].id + '</div><div>' + 12
									+ '</div></td>' + '<td>¥' + 5
									+ '</td>' + '</tr>';
						}
						$("#wrapper").html(content);
					}
				}
			},
			error : function() {
				loading = true;
				$("#pageNo").val(parseInt($("#pageNo").val()) - 1);
				_alert("查询数据出错啦，请刷新再试");
			}
		});
	}
	var loading = false;
	Zepto(function($) {
		$(window).scroll(
				function() {
					if (($(window).scrollTop() + $(window).height() > $(
							document).height() - 10)
							&& loading) {
						loading = false;
						$("#pageNo").val(parseInt($("#pageNo").val()) + 1);
						query("00");
					}
				});
	})

	var ua = navigator.userAgent.toLowerCase();
	if (/android/.test(ua)) {
		$('.date>div>img:last').css({
			"margin-left" : "-25px"
		});
	}
</script>
</html>
