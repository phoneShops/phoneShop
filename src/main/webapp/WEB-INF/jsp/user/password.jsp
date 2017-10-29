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
<title>注册界面</title>

<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">

<style>
.loading {
    width: 160px;
    height: 56px;
    position: absolute;
    top: 50%;
    left: 30%;
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
	<header class="container"> <br>
	<div class="row">
		<div class="col-lg-12">
			<ul class="breadcrumb">
				<li><a href="<%=basePath%>user/toHome">Home</a></li>
				<li><a href="<%=basePath%>user/topassword">密码修改</a></li>
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
					<h4>密码修改</h4>
				</center>
				<br>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="pwd"
						type="password" class="form-control" placeholder="旧密码"
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
				<button type="button" id="checkpassword" class="btn btn-success btn-block">确认修改
				</button>
			</div>
		</div>
	</div>

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

<script type="text/javascript">


$("#checkpassword").click(function(){
	
	$("#font").html("");

	 
	var pwd = $("#pwd").val();
	var newpwd = $("#newpwd").val();
	var newpwd2 = $("#newpwd2").val();
	
	//alert(card.test(tegx));
	
	if(pwd==""||pwd==null){
		alert("密码不能为空！");
	}else if(newpwd==""||newpwd==null){
		alert("密码不能为空！");
	}else if(newpwd2==""||newpwd2==null){
		alert("密码不能为空！");
	}else if(newpwd!=newpwd2){
		alert("两次密码不一致！");
	}else{
		$('#myModal').modal('show');
		$.ajax({  
			type : 'post',
			dataType : 'json',
	        url : '<%=basePath%>user/checkPassword',
	        data : {
					"pwd" : pwd,
					"newpwd" : newpwd,
				},
				success : function(data) {
					if(data.msg=="0"){
						$('#loadfont').html("成功修改");
					    var r=confirm("立即登录？")
						 if (r==true)
						 {
							$('#myModal').modal('hide');
						    window.location.href = "<%=basePath%>user/tologin";
						 }else{
							 window.location.href = "<%=basePath%>user/toregister";   
					     }
					    }else{
					    	$('#myModal').modal('hide');
					    	$("#font").html(data.msg);
					    	$("#font").attr("style", "visibility:visible");
					    	
					    }
					 }
					});
	}
});



</script>
