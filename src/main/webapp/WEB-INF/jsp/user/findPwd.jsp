<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
<title>密码找回</title>

<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/sweetalert.css">

</head>
<body  style="background-color: #F5F5F5">
	<header class="container"> <br>
	<div class="row">
		<div class="col-lg-12">
			<ul class="breadcrumb">
				<li><a href="<%=basePath%>user/toHome">Home</a></li>
				<li><a href="<%=basePath%>user/toPwd">找回密码</a></li>
			</ul>
		</div>
	</div>
	<br>
	<br>
	<br>
	<div class="row">

		<center>
			<div id="logo">
				<img src="../images/logo.png" />
			</div>
		</center>
	</div>

	</header>
	<div class="row" style="margin-top: 30px;">

		<div class="col-md-1"></div>
		<div class="col-md-5" style="border-right: 1px solid #ddd;">
			<div class="well col-md-10">
				<center>
					<h4>密码找回</h4>
				</center>
				<br>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-earphone"></i></span> <input type="text"
						class="form-control" id="phone" placeholder="电话号码"
						aria-describedby="sizing-addon1">
				</div>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-credit-card"></i></span> <input type="text"
						class="form-control" id="card" placeholder="身份证号"
						aria-describedby="sizing-addon1">
				</div>
				<br>
			<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="newpwd"
						type="password" class="form-control" placeholder="新密码"
						aria-describedby="sizing-addon1">
				</div>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="newpwd2"
						type="password" class="form-control" placeholder="再次输入新密码"
						aria-describedby="sizing-addon1">
				</div>
				<br> <br> 
				<font id="font" style="visibility: hidden" color="#FF0000"></font>
				<br> <br>
				<button type="button" id="checkSubmit" class="btn btn-success btn-block">确认
				</button>
			</div>
		</div>
		<div class="col-md-6" id="idea">
			<h4>找回密码</h4>
			<br>
			<ul>
				<li>用户需要输入身份证号和手机号码 来找回</li>
			</ul>
		</div>
	</div>
	
		<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>

<!-- 弹出的载入框 -->
 <div class="container">
        <div id="myModal" class="modal fade" data-keyboard="false"
            data-backdrop="static" data-role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
           <div id="loading" class="loading"><span id="loadfont">加载中。。。</span></div>
        </div>
    </div>
<!-- end -->
</body>
</html>

<script type="text/javascript" src="<%=basePath%>js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/sweetalert.min.js"></script>
	
<script type="text/javascript">
	

	$("#checkSubmit").click(function(){
		
		$("#font").html("");

		 
		var phone = $("#phone").val();
		var card = $("#card").val();
		
		var newpwd = $("#newpwd").val();
		var newpwd2 = $("#newpwd2").val();
		//alert(card.test(tegx));
		
		if(phone==""||phone==null){
			sweetAlert("提示", "电话号码不能为空！", "error");
		}else if(card==""||card==null){
			sweetAlert("提示", "身份证号不能为空！", "error");
		}else if(newpwd==""||newpwd==null){
			sweetAlert("提示", "密码不能为空！", "error");
		}else if(newpwd2==""||newpwd2==null){
			sweetAlert("提示", "密码不能为空！", "error");
		}else if(newpwd!=newpwd2){
			sweetAlert("提示", "两次密码不一致！", "error");
		}else{
			/*输入是手机号时*/
			$.ajax({  
				type : 'post',
				dataType : 'json',
		        url : '<%=basePath%>user/updateFindPwd',
		        data : {
						"phone" : phone,
						"card" : card,
						"pwd": newpwd
					},
					success : function(data) {
						if(data.result=="2"){
							alert("修改成功！");
						    var r=confirm("立即登录？")
							 if (r==true)
							 {
							    window.location.href = "<%=basePath%>user/tologin";
							 }else{
								 window.location.href = "<%=basePath%>user/toPwd";   
						     }
						}else if(data.result=="0"){
						    	$("#font").html("用户不存在");
						    	$("#font").attr("style", "visibility:visible");
						}else if(data.result=="1"){
							$("#font").html("手机与身份证不匹配");
					    	$("#font").attr("style", "visibility:visible");
						}else if(data.result=="3"){
							$("#font").html("修改密码失败");
					    	$("#font").attr("style", "visibility:visible");
						}
						}
					});
		}
		
		
		
	
	});
		
</script>








