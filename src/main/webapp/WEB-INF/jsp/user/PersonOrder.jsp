<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="head.jsp"%>

<link type="text/css" href="<%=basePath%>assets/css/bootstrap-table.min.css" rel="stylesheet">
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
						<li class="active"><a href="#buying" data-toggle="tab">交易中订单</a>
						</li>
						<li><a href="#buyed" data-toggle="tab">已成交订单</a></li>
						<li><a href="#address_manager" onclick="managerAddress();"
							data-toggle="tab">地址管理</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="buying"></div>

						<div class="tab-pane" id="buyed"></div>


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
											<label> <input type="checkbox" checked="false" id="STATUS" >启用默认
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="button" onclick="addAddress();" class="btn btn-success btn-primary">确认增加</button>
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
					</div>
				</div>
			</div>
			<div class="span3"></div>
			<div class="span3"></div>
		</div>
	</div>


<!-- 修改的弹框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <small class="modal-title" id="myModalLabel">地址修改</small>
            </div>
            <div class="modal-body">
            	<form class="form-horizontal" role="form">
            					
            					<input type="text" id="UPDATE_CID" style="display: none" />
            					<input type="text" id="UPDATE_UID" style="display: none" />
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
											<label> <input type="checkbox" id="UPDATE_MAIN_STATUS" checked="true">启用默认</label>
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
                <button type="button" onclick="updateAddress();" class="btn btn-primary">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

	<!--end  -->
</body>

<script type="text/javascript" src="<%=basePath%>js/UserJs/AddressJs.js"></script>
<script src="<%=basePath%>assets/js/bootstrap-table.min.js"type="text/javascript"></script>
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

			var op = $("<option vname="+data[i].pvId+" value="+data[i].pvId+">"+ data[i].pname + "</option>");
			sel.append(op);
		}
		
	}
});

}

function changeCity(data) {

	var province = $("#Province").val();
	
	selcity.empty();
	
	
	$.ajax({url:'<%=basePath%>province/selectCity?pid=' + province,
			type : "post",
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {

					var op = $("<option cname="+data[i].cname+" value="+data[i].cid+">" + data[i].cname
							+ "</option>");
					selcity.append(op);
				}
			}
		});
	}
</script>


</html>