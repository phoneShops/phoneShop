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
<body onload="selectProvince();" style="background-color: #F5F5F5">
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
				<br>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="glyphicon glyphicon-user" aria-hidden="true"></i></span> <input
						type="text" class="form-control" id="username" placeholder="用户名或昵称"
						aria-describedby="sizing-addon1">
				</div>
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
				<div class="row">
						<div class="col-xs-4">
							<select onchange="changeCity(this)" class="form-control"
								name="Province" id="Province" data-dropdown-auto="true">
								<option value="请选择省份" selected>请选择省份</option>
							</select>
						</div>
						<div class="col-xs-4">
							<select class="form-control" name="City" id="City">
								<option value="请选择城市" selected>请选择城市</option>
							</select>
						</div>
						<div class="col-xs-4">
							<a href="#idea">查看注册须知</a>
						</div>
				</div>
				<br>
				<br>
				<div class="input-group input-group-md">
					<span class="input-group-addon" id="sizing-addon1"><i
						class="	glyphicon glyphicon-home"></i></span> <input id="detail" type="text"
						class="form-control" placeholder="详细住址"
						aria-describedby="sizing-addon1">
				</div>
				<br> <br> 
				<font id="font" style="visibility: hidden" color="#FF0000"></font>
				<br> <br>
				<button type="button" id="checkSubmit" class="btn btn-success btn-block">注册
				</button>
			</div>
		</div>
		<div class="col-md-6" id="idea">
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
	
	var selcity = $("#City");
	
	var sel = null;
	
function selectProvince(){
	
    sel = $("#Province");
	
	$.ajax({
		url:"<%=basePath%>province/selectAll",
			type : "post",
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {

					var op = $("<option value="+data[i].pvId+">"+ data[i].pname + "</option>");
					sel.append(op);
				}
				
			}
		});

	}

	function changeCity(data) {

		var province = $("#Province").val();
		
		selcity.empty();
		
		
		$.ajax({
			url:'<%=basePath%>province/selectCity?pid='+province,
				type : "post",
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {

						var op = $("<option value="+data[i].cid+">"+ data[i].cname+ "</option>");
						selcity.append(op);
					}
				}
			});
	}
	
	
	$("#checkSubmit").click(function(){
		
		$("#font").html("");

		 
		var username = $("#username").val();
		var phone = $("#phone").val();
		var card = $("#card").val();
		var pid = $("#Province").val();
		var cid = $("#City").val();
		var address = $("#detail").val();
		
		var regex = /^1[34578]\d{9}$/;
		var tegx=/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		
		
		//alert(card.test(tegx));
		
		if(username==""||username==null){
			alert("用户名不能为空");
		}else if(phone==""||phone==null){
			alert("电话号码不能为空");
		}else if(card==""||card==null){
			alert("身份证号不能为空");
		}else if(pid==""||pid==null){
			alert("请选择省份");
		}else if(cid==""||cid==null){
			alert("请选择您所在的市");
		}else if(address==""||address==null){
			alert("请填写家庭详细住址！");
		}else if(regex.test(phone)!=true){
			alert("电话号码格式不正确");
		}else if(tegx.test(card)!=true){
	        alert("证件号格式不对！");
		}else{
			$('#myModal').modal('show');
			/*输入是手机号时*/
			$.ajax({  
				type : 'post',
				dataType : 'json',
		        url : '<%=basePath%>user/checkRegister',
		        data : {
						"username" : username,
						"phone" : phone,
						"pid" : pid,
						"cid": cid,
						"card":card,
						"address":address,
					},
					success : function(data) {
						if(data.msg=="0"){
							$('#loadfont').html("成功注册");
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
		
	/*function  HtmlLoad(url){
	            $('#myModal').modal('show');

	        setTimeout(function () {
	       $('#myModal').modal('hide');
	    }, 3000);

	    }*/
		
</script>








