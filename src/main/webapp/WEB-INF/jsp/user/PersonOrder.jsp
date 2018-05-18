<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="head.jsp"%>

<link type="text/css"
	href="<%=basePath%>assets/css/bootstrap-table.min.css" rel="stylesheet">
<link href="<%=basePath%>assets/css/add-ons.min.css" rel="stylesheet" />

<title>订单管理</title>
</head>
<body style="background-color: #F5F5F5" onload="selectProvince();">
	<br>
	<div class="container">
		<div class="row">
			<div class="span1"></div>
			<div class="span5">
				<div class="tabbable" id="">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#buying"
							onclick="managerOrder();" data-toggle="tab">交易中订单</a></li>
						<li><a href="#buyed" onclick="managerFinishOrder();"
							data-toggle="tab">已成交订单</a></li>
						<li><a href="#address_manager" onclick="managerAddress();"
							data-toggle="tab">地址管理</a></li>
						<li><a href="#person_manager" onclick="managerMessage();"
							data-toggle="tab">个人信息</a></li>
						<li><a href="#person_password" data-toggle="tab">个人密码修改</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="buying">
							<div class="heading">
								<font size="3px;">交易中的订单</font>
							</div>
						</div>

						<!-- 已经购买的商品 -->
						<div class="tab-pane" id="buyed">
							<div class="heading">
								<font size="3px;">已经完成的订单</font>
							</div>

						</div>
						<!-- 已经购买的商品 end -->


						<div class="tab-pane" id="address_manager">

							<div class="heading">
								<font size="2px;">地址管理</font>
							</div>

							<form class="form-horizontal" role="form">
								<div class="form-group">
									<label for="firstname" class="col-sm-2 control-label">*联系人：</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="username"
											placeholder="请输入名字">
									</div>
								</div>
								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">*手机号码：</label>
									<div class="col-sm-3">
										<input type="text" class="form-control" id="phoneNumber"
											placeholder="请输入手机号码">
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">*我的地址：</label>
									<div class="col-sm-2">
										<select onchange="changeCity(this)" class="form-control"
											name="Province" id="Province" data-dropdown-auto="true">
											<option value="请选择省份" selected>请选择省份</option>
										</select>
									</div>
									<div class="col-sm-2">
										<select class="form-control" name="City" id="City">
											<option value="请选择城市" selected>请选择城市</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label for="lastname" class="col-sm-2 control-label">*详细地址：</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" id="detailAddress"
											placeholder="请输入详细地址">
									</div>
								</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div class="checkbox">
											<label> <input type="checkbox" checked="false"
												id="STATUS">启用默认
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="button" onclick="addAddress();"
											class="btn btn-success btn-primary">确认增加</button>
									</div>
								</div>
							</form>
							<br>
							<div class="heading">
								<font size="2px;">已有地址</font>
							</div>
							<!-- 地址表格 -->
							<table id="address">
							</table>
						</div>

						<!-- 个人信息tab -->
						<div class="tab-pane" id="person_manager">
							<div class="heading">
								<font size="3px;">个人信息&nbsp;&nbsp;</font><a
									onclick="updateMessage()">[修改]</a>
							</div>
							<table id="personTable" style="margin-top: 20px; width: 100%;">
								<tbody>
									<tr>
										<td style='display: none' id="UID"></td>
										<td style='vertical-align: middle;'>昵称：<span
											id="USERNAMES"></span></td>
										<td style='vertical-align: middle;'>身份证：<span id="CARD"></span></td>
										<td style='vertical-align: middle;'>电话号码：<span id="PHONE"></span></td>
									</tr>
									<tr>
										<p id="msg" style="display: none">没有数据！</p>
									</tr>
								</tbody>

							</table>
							<br> <br>

							<div class="heading">
								<font size="3px;">快递信息</font>
							</div>
							<td>&nbsp;</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>
									<p style="width: 90%; margin: 0 auto; font-size: 16px;">快递邮寄信息</p>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>
									<p style="width: 90%; margin: 0 auto; line-height: 25px;">收件人：手机销售网</p>
									<p style="width: 90%; margin: 0 auto; line-height: 25px;">联系电话：0731-84415099</p>
									<p style="width: 90%; margin: 0 auto; line-height: 25px;">邮寄地址：长沙市芙蓉路与八一路交叉路口西北角，金帆大厦8楼806</p>
								</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="3">
									<p
										style="width: 90%; margin: 0 auto; border-bottom: 1px solid #e3e3e3;">&nbsp;</p>
								</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="3">
									<p style="width: 90%; margin: 0 auto; line-height: 25px;">温馨提示：</p>
									<p style="width: 90%; margin: 0 auto; line-height: 25px;">1.用户名即手机号下次登录需通过短信验证请保持信号畅通。</p>
									<p style="width: 90%; margin: 0 auto; line-height: 25px;">2.收款账号请仔细确认，如有错误请及时修改。</p>
									<p style="width: 90%; margin: 0 auto; line-height: 25px;">3.通过快递邮寄发货的用户，发完货后请及时在【当前订单】里面点击【请发货】填写快递单号，回售网帮您追踪物流。</p>
								</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>
							<tr>
								<td colspan="3">&nbsp;</td>
							</tr>


						</div>

						<!-- 个人密码修改 -->
						<div class="tab-pane" id="person_password">
							<div class="row" style="margin-top: 30px;">

								<div class="col-md-1"></div>
								<div class="col-md-5" style="border-right: 1px solid #ddd;">
									<div class="well col-md-10">
										<center>
											<h4>密码修改</h4>
										</center>
										<br> <br>
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
										<br> <br> <font id="font" style="visibility: hidden"
											color="#FF0000"></font> <br> <br>
										<button type="button" onclick="checkpassword();"
											class="btn btn-success btn-block">确认修改</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 个人密码修改 end -->


					</div>
				</div>
			</div>
			<div class="span3"></div>
			<div class="span3"></div>
		</div>
	</div>

	<!-- 修改个人信息的弹框 -->
	<div class="modal fade" id="PersonModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<small class="modal-title" id="myModalLabel">个人信息修改</small>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">

						<input type="text" id="UPDATE_CID" style="display: none" /> <input
							type="text" id="UPDATE_UID" style="display: none" />
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">*昵称：</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="UPDATE_SNAME"
									placeholder="请输入昵称">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">*手机号码：</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="UPDATE_PERSON_PHONE"
									placeholder="请输入手机号码">
							</div>
						</div>

						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">*身份证：</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="UPDATE_CARD"
									placeholder="请输入身份证">
							</div>
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="updatePerson();"
						class="btn btn-primary">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 修改个人信息的弹框end -->


	<!-- 修改的弹框 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<small class="modal-title" id="myModalLabel">地址修改</small>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">

						<input type="text" id="UPDATE_CID" style="display: none" /> <input
							type="text" id="UPDATE_UID" style="display: none" />
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">*联系人：</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="UPDATE_NAME"
									placeholder="请输入名字">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">*手机号码：</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="UPDATE_PHONE"
									placeholder="请输入手机号码">
							</div>
						</div>

						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">*我的地址：</label>
							<div class="col-sm-4">
								<select onchange="changesCity(this)" class="form-control"
									name="PROVINCE" id="PROVINCE" data-dropdown-auto="true">
									<option value="请选择省份" selected>请选择省份</option>
								</select>
							</div>
							<div class="col-sm-4">
								<select class="form-control" name="CITY" id="CITY">
									<option value="请选择城市" selected>请选择城市</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="lastname" class="col-sm-3 control-label">*详细地址：</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="UPDATE_DETAIL"
									placeholder="请输入详细地址">
							</div>
						</div>


						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-5">
								<div class="checkbox">
									<label> <input type="checkbox" id="UPDATE_MAIN_STATUS"
										checked="true">启用默认
									</label>
								</div>
							</div>
						</div>
						<!-- <div class="form-group">
									<div class="col-sm-offset-3 col-sm-10">
										<button type="submit" class="btn btn-success btn-primary">确认修改</button>
									</div>
								</div> -->
					</form>



				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="updateAddress();"
						class="btn btn-primary">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!--end  -->


	<!-- 用户评论的弹框 -->
	<div class="modal fade" id="CommentModal" tabindex="-1" role="dialog"
		aria-labelledby="" CommentModal"" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<small class="modal-title" id="myModalLabel">用户评论</small>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">

						<input type="text" id="UPDATE_CID" style="display: none" /> <input
							type="text" id="UPDATE_UID" style="display: none" />
						<div class="form-group">
							<label for="firstname" class="col-sm-3 control-label">评论信息：</label>
							<div class="col-sm-6">
								<textarea class="form-control" rows="5" id="comment"></textarea>
							</div>
							<input style='display: none' type='text' id='MODAL_UID' value="">
							<input style='display: none' type='text' id='MODAL_OID' value="">
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" onclick="SubComment();"
						class="btn btn-primary">提交评论</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<!-- 用户评论的弹框end -->
	<!-- 弹出的载入框 -->
	<div class="container">
		<div id="myModal" class="modal fade" data-keyboard="false"
			data-backdrop="static" data-role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div id="loading" class="loading">
				<span id="loadfont">加载中。。。</span>
			</div>
		</div>
	</div>
	<!-- end -->

	<!-- 引入footer.jsp -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>

<script type="text/javascript" src="<%=basePath%>js/UserJs/AddressJs.js"></script>
<script src="<%=basePath%>assets/js/bootstrap-table.min.js" type="text/javascript"></script>
<script src="<%=basePath%>assets/js/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>



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

			var op = $("<option vname="+data[i].pname+" value="+data[i].pvId+">"+ data[i].pname + "</option>");
			sel.append(op);
		}
		
	}
});
//加载交易中的订单
managerOrder();

}

function changeCity(data) {

	var province = $("#Province").val();
	
	selcity.empty();
	
	$.ajax({
		url:'<%=basePath%>province/selectCity?pid=' + province,
					type : "post",
					dataType : "json",
					success : function(data) {
						for (var i = 0; i < data.length; i++) {

							var op = $("<option cname="+data[i].cname+" value="+data[i].cid+">"
									+ data[i].cname + "</option>");
							selcity.append(op);
						}
					}
				});
	}
</script>


</html>