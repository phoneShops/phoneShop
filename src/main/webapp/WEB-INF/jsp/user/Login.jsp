<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<title>用户登录界面</title>

<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">

<style>
.loading {
    width: 160px;
    height: 56px;
    position: absolute;
    top: 50%;
    left: 40%;
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

<!--[if IE]>
		<script src="http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<![endif]-->
</head>
<body style="background-color: #F5F5F5">
	<header class="container"> <br>
	<div class="row">
		<div class="col-lg-12">
			<div class="col-lg-12">
			<ul class="breadcrumb">
				<li><a href="<%=basePath%>user/toHome">Home</a></li>
				<li><a href="<%=basePath%>user/tologin">Login</a></li>
			</ul>
		</div>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-4" style="border-right: 1px solid #ddd;">
			<div id="logo">
				<img src="../images/logo.png" />
			</div>
		</div>
		<div class="col-md-8" style="border-right: 1px solid #ddd;">
			<font size="6px;" color="#D1D1D1">欢迎登陆</font>
		
		</div>
	</div>

	</header>
	<div class="row" style="margin-top: 30px;background-color: #E5E5E5">
		
		<div class="col-md-4" style="border-right: 1px solid #ddd;">
		 	<!-- <font size="5px;">
		 			说明：第一次登陆的用户的初始密码是：6个6
		 	</font> -->
		</div>
		<div class="col-md-4">
			<div class="well col-md-10">
				<center>
					<h4>用户登录</h4>
				</center>
				<br>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-user" aria-hidden="true"></i></span> <input
						id="username" type="text" class="form-control" placeholder="用户名或手机号"
						aria-describedby="sizing-addon1">
				</div>
				<br>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="pwd"
						type="password" class="form-control" placeholder="密码"
						aria-describedby="sizing-addon1">
				</div>
				<br>
				<br> 
				
				<div class="row">
					<div class="col-xs-3">
						<input id="code" style="width: 110px; height: 40px;" type="text" class="form-control" placeholder="验证码" aria-describedby="sizing-addon1"> 
					</div>
					<div class="col-xs-3">
						<img style="width: 100px; height: 40px;" id="imgObj" src="<%=basePath%>captcha/getCaptchaImage" onclick="changeImg()"> 
						<input id="timestamp" name="timestamp" value="${timestamp }" type="hidden"> 
					</div>
					<div class="col-xs-5">
						<a style="cursor: pointer;" onclick="changeImg();">看不清,换一张？</a>
					</div>
					<div class="col-xs-1">
					
					</div>
				</div>
				<br>
				<font id="font" style="visibility: hidden" color="#FF0000">XXXXXX</font>
				<br>
				<br>
				<div class="well well-sm" style="text-align: right;">
					<a href="<%=basePath %>user/toregister" style="position: absolute; top: 350px; left: 25px">没有账号？马上注册</a>
					<a href="">忘记密码？立即找回</a>
				</div>
				<br>
				<br>
				<button id="login" type="button" class="btn btn-success btn-block">登录</button>
				<br>
				<button id="register" type="button" class="btn btn-success btn-block">立即注册</button>
			</div>
		</div>
		
		<div class="col-md-4" style="border-right: 1px solid #ddd;">
		</div>
	</div>



 <div class="container">
        <div id="myModal" class="modal fade" data-keyboard="false"
            data-backdrop="static" data-role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div id="loading" class="loading"><span id="loadfont">加载中。。。</span></div>
        </div>
    </div>



	<script type="text/javascript" src="<%=basePath%>js/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
	<script type="text/javascript">
/**  
 * 更换图片  
 */  
function changeImg() {  
    var imgSrc = $("#imgObj");
    var username = $("#username").val();
    var src = imgSrc.attr("src");
    imgSrc.attr("src", chgUrl(src)); 
    $("#username").val(username);
}  
/**  
 * 时间戳    
 * 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳   
 */  
function chgUrl(url) {  
    var timestamp = (new Date()).valueOf();  
    var stamp = $("#timestamp");  
//    alert(url);  
    url = url.substring(0, 60);  
    if ((url.indexOf("&") >= 0)) {  
        url = url + "×tamp=" + timestamp;  
    } else {  
        url = url + "?timestamp=" + timestamp;  
        stamp.val(timestamp);  
    }  
    return url;  
};  


$("#register").click(function(){
	
	window.location.href = "/phone/user/toregister";
});



$("#login").click(function(){
	
	$("#font").html("");

	 
	var username = $("#username").val();
	var pwd = $("#pwd").val();

	var code = $("#code").val();
	var phone ;
	
	
	var re = /^[0-9]+.?[0-9]*$/; //判断字符串是否为数字 //判断正整数 /^[1-9]+[0-9]*]*$/ 
	if(re.test(username)==true){
		phone = username;
	}
	var reg = /^1[3|4|5|7|8][0-9]{9}$/; //验证规则

	//验证手机号
	var flag = reg.test(username); //true
	
	if(phone!=null&&flag!=true){
		alert("手机号不符合规范");
		return;
		
	}
	
	if(username==""){
		alert("用户名或手机号不能为空");
	}else if(pwd==""){
		alert("密码不能为空");
	}else if(code==""){ 
		alert("验证码不能为空");		
	}else if(flag==true){
		$('#myModal').modal('show');
		/*输入是手机号时*/
		$.ajax({  
			type : 'post',
			dataType : 'json',
	        url : '<%=basePath%>user/checkLogin',
	        data : {
					"code" : code,
					"username" : username,
					"pwd" : pwd,
					"status":0
				},
				success : function(data) {
					if(data.msg=="success"){
						$('#loadfont').html("成功登录");
					    window.location.href = "<%=basePath%>user/toHome";
					    }else{
							$('#myModal').modal('hide');
					    	changeImg();
					    	$("#font").html(data.msg);
					    	$("#font").attr("style", "visibility:visible");
					    	
					    }
					 }
					});
		
	}else{
		$('#myModal').modal('show');
		/*输入是用户名时*/
		$.ajax({  
	        type : 'post',  
	        async : false,  
	        url : '<%=basePath%>user/checkLogin',
						data : {
							"code" : code,
							"username" : username,
							"pwd" : pwd,
							"status":1
						},
						success : function(data) {
							if(data.msg=="success"){
								$('#loadfont').html("成功登录");
							    window.location.href = "<%=basePath%>user/toHome";
					    }else{
					    	$('#myModal').modal('hide');
					    	changeImg();
					    	$("#font").html(data.msg);
					    	$("#font").attr("style", "visibility:visible");
					    	
					    }
						}
					});
	}

	});
		
	</script>