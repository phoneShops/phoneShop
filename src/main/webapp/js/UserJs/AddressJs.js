/**
 * 
 */
function managerAddress() {
	loadTable();
}

function loadTable() {
	$('#address')
			.bootstrapTable(
					{
						url : '/phone/address/qryUserAddress',
						dataType : "json",
						toolbar : '#toolbar', // 工具按钮用哪个容器
						pagination : false, // 分页
						pageNumber : 1, // 初始化加载第一页，默认第一页
						pageSize : 10, // 每页的记录行数（*）
						clickToSelect : true, // 是否启用点击选中行
						smartDisplay : false,
						sidePagination : "server",
						queryParamsType : "",
						queryParams : function queryParams(params) {
							return {
								pageSize : params.pageSize,
								pageIndex : params.pageNumber,
								key : $("#queryKey").val()
							}
						},
						pageList : [ 5, 10, 15, 20 ], // 可供选择的每页的行数（*）
						columns : [
								{
									field : 'cid',
									title : '序号',
									align : 'center',
									width : '50',
									formatter : function(value, row, index) {
										return index + 1;
									}
								},
								{
									field : 'aname',
									title : '收件人',
									align : 'center',
									width : '20'
								},
								{
									field : 'phone',
									title : '手机号码',
									align : 'center',
									width : '10'
								},
								{
									field : 'areaprovince',
									title : '所在 区域',
									align : 'center',
									width : '50'
								},
								{
									field : 'areadetail',
									title : '详细地址',
									align : 'center',
									width : '50'
								},
								{
									field : 'areastatus',
									title : '是否主地址',
									align : 'center',
									width : '10',
									formatter : function(value, row, index) {
										var areastatus = "";
										if (row.areastatus == 1) {
											areastatus = "非主地址";
										} else {
											areastatus = "主地址";
										}
										return areastatus;
									}
								},
								{
									title : '操作',
									field : 'uid',
									align : 'center',
									width : '20',
									formatter : function(value, row, index) {
										var e = '<a href="#"><i class="glyphicon glyphicon-pencil" title="编辑" onclick="editAddress(\''
												+ row.uid
												+ '\',\''
												+ row.cid
												+ '\',\''
												+ row.aname
												+ '\',\''
												+ row.phone
												+ '\',\''
												+ row.areadetail
												+ '\',\''
												+ row.areastatus
												+ '\')" ></i></a>';
										var c = '<a href="#"><i class="glyphicon glyphicon-remove" title="删除" onclick="removeAddress(\''
												+ row.uid
												+ '\',\''
												+ row.uid
												+ '\')"></i></a>';

										return e + " | " + c;
									}
								} ]
					});
}


// 弹出编辑框
function editAddress(uid, cid, aname, phone, areadetail, areastatus) {

	$("#UPDATE_NAME").val(aname);
	$("#UPDATE_PHONE").val(phone);
	$("#UPDATE_DETAIL").val(areadetail);

	$("#UPDATE_CID").val(cid);
	$("#UPDATE_UID").val(uid);
	
	// 0表示是默认地址
	if (areastatus == 0) {
		$("#UPDATE_MAIN_STATUS").attr('checked', true);
	} else {
		$("#UPDATE_MAIN_STATUS").attr('checked', false);
	}

	$("#myModal").modal();
	selectsProvince();
}

// 修改地址
function updateAddress() {

	var name = $("#UPDATE_NAME").val();
	var phone = $("#UPDATE_PHONE").val();
	var areadetail = $("#UPDATE_DETAIL").val();
	var cid = $("#UPDATE_CID").val();
	
	var province = $("#PROVINCE").val();
	var city = $("#CITY").val();
	
	
	var uid = $("#UPDATE_UID").val();
	
	if(name==""||phone==""||areadetail==""||cid==""||province==""||city==""||uid==""){
		
		Ewin.alert({ message: "不能有空值！！" }).on(function (e) {
			if (!e) {
				return;
			}
		});
		
		return;
		
	}
	
	Ewin.confirm({ message: "确认要修改该数据吗？" }).on(function (e) {
		if (!e) {
		 return;
		}
		
		//获得状态
		var statusBox = $("#UPDATE_MAIN_STATUS").is(':checked');
		
		var status;
		
		if(statusBox==true){
			status = 0;
		}else{
			status = 1;
		}
		
		$.ajax({
		 type: "post",
		 url: "/phone/address/updateAddress",
		 data: { 
			 cid:cid,
			 uid:uid,
			 name:name,
			 phone:phone,
			 detail:areadetail,
			 province:province,
			 city:city,
			 status:status
			 
		 },
		 success: function (data) {
			 
			if(data.code==0){
				alert("修改成功！");
				$('#myModal').modal('hide');
				
				$('#address').bootstrapTable('refresh');
				
			}else if(data.code==1){
				alert("修改失败");
			}else{
				alert("修改其他地址出错!");
			}
		 },
		 error: function () {
		 toastr.error('Error');
		 },
		 complete: function () {
		 
		 }
		 
		});
		});

}

//增加地址
function addAddress(){
	
	username
	phoneNumber
	Province
	City
	detailAddress
	STATUS
	
	var name = $("#username").val();
	var phoneNumber = $("#phoneNumber").val();
	var Province = $("#Province").getAttribute("vname");
	var City = $("#City").getAttribute("cname");
	var detailAddress = $("#detailAddress").val();
	var STATUS = $("#STATUS").val();
	
	
	
	
}


// 删除功能
function removeAddress(uid) {

}


function selectsProvince() {

	var sele = $("#PROVINCE");

	$.ajax({
		url : "/phone/province/selectAll",
		type : "post",
		dataType : "json",
		success : function(data) {
			for (var i = 0; i < data.length; i++) {

				var op = $("<option value=" + data[i].pvId + ">"
						+ data[i].pname + "</option>");
				sele.append(op);
			}

		}
	});

}
function changesCity(data) {

	var province = $("#PROVINCE").val();

	var selCity = $("#CITY");

	selCity.empty();

	$.ajax({
		url : '/phone/province/selectCity?pid=' + province,
		type : "post",
		dataType : "json",
		success : function(data) {
			for (var i = 0; i < data.length; i++) {

				var op = $("<option value=" + data[i].cid + ">" + data[i].cname
						+ "</option>");
				selCity.append(op);
			}
		}
	});
}
