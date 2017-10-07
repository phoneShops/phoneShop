<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>注册界面</title>

<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">

</head>
<body>
	<header class="container"> <br>
	<div class="row">
		<div class="col-lg-12">
			<ul class="breadcrumb">
				<li><a href="<%=basePath%>user/toHome">Home</a></li>
				<li><a href="<%=basePath%>user/toregister">Register</a></li>
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
					<h4>用户注册</h4>
				</center>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-user" aria-hidden="true"></i></span> <input
						type="text" class="form-control" placeholder="用户名或昵称"
						aria-describedby="sizing-addon1">
				</div>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-earphone"></i></span> <input type="text"
						class="form-control" placeholder="电话号码"
						aria-describedby="sizing-addon1">
				</div>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-credit-card"></i></span> <input type="text"
						class="form-control" placeholder="身份证号"
						aria-describedby="sizing-addon1">
				</div>
				<br><br>
				<div class="input-group input-group-md">
					<div class="form-group">
						<div class="col-sm-6">
							<select class="form-control" name="Province" id="Province">
								<option value="请选择省份" selected>请选择省份</option>
							</select>
						</div>
						<div class="col-sm-6">
							<select class="form-control" name="City" id="City">
								<option value="请选择城市" selected>请选择城市</option>
							</select>
						</div>
					</div>
				</div>
				<br><br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="	glyphicon glyphicon-home"></i></span> <input type="text"
						class="form-control" placeholder="详细住址"
						aria-describedby="sizing-addon1">
				</div>


				<br> <br> <span>XXX</span> <br> <br>
				<button type="button" class="btn btn-success btn-block">注册
				</button>
			</div>
		</div>
		<div class="col-md-6">
			<h4>欢迎注册本站账号</h4>
			<br>
			<ul>
				<li>用户使用用户名或手机号码登录，初始密码为6个6，登录后请及时修改密码</li>
				<br>
				<li>您填的所有信息我们将为您严格保密，请放心填写</li>
				<br>
				<li>本站实体店地址：长沙市 芙蓉区 五一大道 xxxx</li>
			</ul>
		</div>
	</div>



	<script type="text/javascript" src="<%=basePath%>js/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>

</body>
</html>