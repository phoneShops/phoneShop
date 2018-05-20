<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../user/head.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/timeCss/time.css">


<title>订单处理</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>


			<div class="col-md-2" style="border-right: 1px solid #ddd;"></div>

			<div class="col-md-6">
				<div class="time_line_box">
					<div class="time_line" style="width: 100%;">
						<ol>
							<li><a class="order_item selected" style="left: 1%;">商品浏览</a>
							</li>
							<li><a class="order_item selected" style="left: 20%;">我的购物车</a>
							</li>
							<li><a class="order_item selected" style="left: 45%;">填写核对订单信息</a>
							</li>
							<li><a class="order_item" style="left: 75%;">成功提交订单</a></li>
						</ol>
						<span class="filling_line" style="transform: scaleX(0.55);"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="heading">
					<font size="4px;"><b>填写并核对订单信息</b></font>
				</div>
			</div>
		</div>
	</div>
	<br><br>
	<div class="container">
		<div class="col-lg-12">
			<div class="heading">
				<font size="4px">订单号：<span id="ORDER_ID"></span></font>
			</div>
		</div>
		<br><br>
		<div class="row">
				<table class="table table-striped"  id="orderTable" >
					<thead>
						<tr>
							<th>产品型号</th>
							<th>价格</th>
							<th>数量</th>
						</tr>
				</thead>
				<tbody id="ORDER_TABLE">
			
				</tbody>
			</table>
		</div>

		<br><br>

		<div class="row">
			<div class="col-lg-12">
				<div class="heading">
					<font size="4px;"><b>默认快递地址</b></font>&nbsp;<a onclick="choiceAddr();">&nbsp;[选择其他地址]</a>
				</div>
			</div>
			<br><br>
				<form class="form-horizontal" role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">*联系人：</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="username" value="庞攀" readonly="readonly">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">*手机号码：</label>
									<div class="col-sm-3">
										<input type="text" value="13787019873" class="form-control" id="phoneNumber" readonly="readonly">
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">*我的地址：</label>
									<div class="col-sm-2">
										<input type="text" readonly="readonly" value="湖南省" class="form-control" id="province">
									</div>
									<div class="col-sm-2">
										<input type="text" readonly="readonly" value="长沙市" class="form-control" id="city">
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">*详细地址：</label>
									<div class="col-sm-4">
										<input type="text" value="八方小区  6栋  XXX房间" class="form-control" id="detailAddress" readonly="readonly">
									</div>
								</div>
							</form>

			<!-- <div class="col-md-12 col-lg-12 col-sm-12">

				地址表格
				<table id="address">
				</table>
			</div> -->
		</div>
		
		
		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12">
				<div style="border-top: 1px solid gray; padding: 4px 10px;">
					<br>
					<div style="margin-left: 2px;" class="pull-left total"></div>
					<div style="margin-left: 0px;" class="pull-right total">
						<label>金额共计:<span class="currency">￥</span><span id="priceTotal" class="large-bold-red">0.00</span></label>
						<button class="btn-lg btn-success" type="button" onclick="toOrder();">提交订单</button>
					</div>
					<div class="pull-right selected" id="selected">
						<span id="selectedTotal"></span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row"></div>
		<div class="row"></div>
		
</div>

<!-- 选地址的弹框 -->

	<!-- 用户评论的弹框 -->
	<div class="modal fade" id="AddressModal" tabindex="-1" role="dialog"
		aria-labelledby="" CommentModal"" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<small class="modal-title" id="myModalLabel">地址选择</small>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">

						<table class="table">
							<thead>
								<th>选择</th>
								<th>收件人</th>
								<th>号码</th>
								<th>省份</th>
								<th>城市</th>
								<th>详细地址</th>
							</thead>
							
							<tbody>
							<!-- 开始循环 -->
							<c:forEach items="${list}" var="item">  
								<tr>
									<td><input type="radio" name="ADDRESSradio" value="${item.cid}"></td>
									<td>${item.aname}</td>
									<td>${item.phone}</td>
									<td>${item.areaprovince}</td>
									<td>${item.areacity}</td>
									<td>${item.areadetail}</td>
								</tr>
							</c:forEach>	
							</tbody>
						
						</table>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="SubAddress"
						class="btn btn-primary">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>




<br><br>
<!-- 隐藏域 -->
<input type="hidden" id="DataArray" value="">
<input type="hidden" id="AddressId" value="">
<!-- 隐藏域end -->
</body>
<script src="<%=basePath%>js/UserJs/Order.js"></script>
<script type="text/javascript">
	$(function() {

			var array=new Array();
			var data = ${array};
			
			queryOrder(data.toString());//查询 
	});
	
	function choiceAddr(){
		
		$("#AddressModal").modal('show');
		
	}
	
	 $("#SubAddress").click(function(){
         var obj=$('input:radio[name="ADDRESSradio"]:checked');
         var val = obj.val();
         if(val==null){
        	 
        	 $("#AddressModal").modal('hide');
         }
         else{
        	 
        	 $("#AddressId").val(val);
        	 
        	 $("#username").val(obj.parent().parent().find("td").eq(1).html());
        	 $("#phoneNumber").val(obj.parent().parent().find("td").eq(2).html());
        	 $("#province").val(obj.parent().parent().find("td").eq(3).html());
        	 $("#city").val(obj.parent().parent().find("td").eq(4).html());
        	 $("#detailAddress").val(obj.parent().parent().find("td").eq(5).html());
        	 
         	 $("#AddressModal").modal('hide');
         }
      });
	
	
	
</script>
</html>