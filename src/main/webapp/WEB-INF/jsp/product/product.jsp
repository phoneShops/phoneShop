<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="../user/head.jsp"%>
<head>
<title>产品筛选</title>

<link rel="stylesheet" href="<%=basePath %>css/dropload.css">

<script src="<%=basePath %>js/zepto.min.js"></script>
<script src="<%=basePath %>js/dropload.min.js"></script>

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
    left: 45%;
    line-height: 65px;
    color: #fff;
    padding-left: 50px;
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
	<input type="hidden" name="pageNo" id="pageNo" value="0" />
	<input type="hidden" name="oldsousuo" id="oldsousuo" value="s" />
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

	
var SouSuo = "";	

//初始的加载条数
var startnum = 0;
	
$(function(){  
	
    SouSuo = ${requestScope.name};
    if(SouSuo!=$("#oldsousuo").val()){
    	//$("#products").clear();
    	$("#oldsousuo").val(SouSuo);
    }
    query();//第一次加载  
});  


function query()  
{  
	
	$("#myModal").modal("show");
	
	
    startnum = $("#pageNo").val();
	
    
    /*加载数据*/
    $.ajax({  
        url : "<%=basePath%>/product/queryProduct",
			data : {
				headnum:startnum,
				endnum:4,
				pname:SouSuo
			},
			cache : false,
			success : function(data) {
				loading = true;
				
				if (data.length>0 && data.length <= 4) {
					var content = "";
					
				    for (var i = 0; i < data.length; i++) {
				    	
				    	 content  = "<div class='col-lg-3 col-md-3 col-sm-6 col-xs-12'>"
								+ "<div class='product'>"
								+ "<div class='image' <a href='product.html'>>"
								+ "<img src=<%=basePath%>images"+data[i].picture
								+">"
								+"</a></div>"
								+"<div class='buttons'>"
								+"<a class='btn cart' href='#'><span class='glyphicon glyphicon-shopping-cart'></span></a>"
								+"<a class='btn wishlist' href='#'><span class='glyphicon glyphicon-heart'></span></a>"
								+"<a class='btn compare' href='#'><span class='glyphicon glyphicon-transfer'></span></a>"
								+"</div><div class='caption'>"
								+"<div class='name'><h3><a href='product.html'>Aliquam erat volutpat</a></h3></div>"
								+"<div class='price'>$122<span>$98</span></div>"
								+"<div class='rating'><span class='glyphicon glyphicon-star'>"
								+"</span><span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span>"
								+"</span><span class='glyphicon glyphicon-star'></span>"
								+"<span class='glyphicon glyphicon-star'></span><span class='glyphicon glyphicon-star'></span></div>"
								+"</div></div></div></div></div></div>"
							$("#products").append(content);
					}
				    
					var a = parseInt($("#pageNo").val());
					
					$("#pageNo").val(parseInt($("#pageNo").val()+4));
				} else{
					$("#pageNo").val(-1);
				}
					//关闭加载弹框
    				close();
			},
			error : function() {
				loading = true;
				$("#pageNo").val(parseInt($("#pageNo").val(-1)));
				_alert("查询数据出错啦，请刷新再试");
			}
		});
	}



	
/*滚动事件*/
Zepto(function($) {
	$(window).scroll(
			function() {
				if (($(window).scrollTop() + $(window).height() > $(document).height())
						&& loading) {
					if(parseInt($("#pageNo").val())==-1){
						
						alert("没有更多数据！");
						return;
					}
						query();
				}
			});
})

var ua = navigator.userAgent.toLowerCase();
if (/android/.test(ua)) {
	$('.date>div>img:last').css({
		"margin-left" : "-25px"
	});
}
	
	
/*关闭加载框*/
function close(){
	
	$("#myModal").modal("hide");

	
}

	
</script>
</html>
