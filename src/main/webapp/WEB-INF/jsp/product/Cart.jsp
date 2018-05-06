<%@page import="com.phone.controller.base.BaseController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="../user/head.jsp"%>

<link href="<%=basePath%>css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css" />  
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/timeCss/time.css">


<title>购物车</title>
</head>
<body>

<div class="container">
	<div class="row" >
		<div class="col-md-4" ></div>
		
		
		<div class="col-md-2" style="border-right: 1px solid #ddd;"></div>
		
		<div class="col-md-6">
			<div class="time_line_box">
            <div class="time_line" style="width:100%;">
                <ol>
                    <li>
                        <a class="order_item selected" style="left:1%;">商品浏览</a>
                    </li>
                    <li>
                        <a class="order_item selected" style="left:20%;">我的购物车</a>
                    </li>
                    <li>
                        <a class="order_item" style="left:45%;">填写核对订单信息</a>
                    </li>
                    <li>
                        <a class="order_item" style="left:75%;">成功提交订单</a>
                    </li>
                </ol>
                <span class="filling_line" style="transform: scaleX(0.28);"></span>
            </div>
        </div>
		</div>
	</div>
</div>
<br><br>
<div class="container"> 
<div class="row">
			<div class="col-lg-12">
				<div class="heading"><h4>我的购物车</h4></div>
			</div>
</div>	
</div>
<div class="container">  
    <table id="cartTable"  class="cart table" >  
        <thead>  
            <tr>  
                <th><label><input  type="checkbox" id="allCheck" > 全选</label></th>  
                <th><label>产品型号</label></th>  
                <th><label>单价</label></th>  
                <th><label>数量</label></th>  
                <th><label>小计</label></th>  
                <th><label>操作</label></th>    
            </tr>  
        </thead>  
        <tbody id="CartTable">  
            
        </tbody>  
    </table>  
    
    <div class="row">  
        <div class="col-md-12 col-lg-12 col-sm-12">  
            <div style="border-top:1px solid gray;padding:4px 10px;">  
    		<br>
                <div style="margin-left:2px;" class="pull-left total">  
                	<!-- <button class="btn btn-danger btn-primary" type="button">清空购物车</button>
 -->                </div>  
                <div style="margin-left:40px;" class="pull-right total">  
                    <label>金额合计:<span class="currency">￥</span><span id="priceTotal" class="large-bold-red">0.00</span></label>  
                    <button class="btn btn-danger" type="button" onclick="toOrder();">下一步</button>
                </div>  
                <div class="pull-right selected" id="selected">  
                    <span id="selectedTotal"></span>  
                </div> 
            </div>  
        </div>  
    </div>  
</div>  
</body>
</html>  
<script type="text/javascript" src="<%=basePath%>js/productJs/CartJs.js"></script>  
<script type="text/javascript" src="<%=basePath%>js/jquery-2.1.1.js"></script>  
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
 
<script type="text/javascript">

var uid;

$(function(){  
	
    uid = ${requestScope.uid};
    
    queryCart(uid);
    
});




</script> 