/**
 * 
 */
function managerAddress() {
	loadTable();
}

function loadTable() {
	$('#address').bootstrapTable(
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
								/*{
									field : 'cid',
									title : '序号',
									align : 'center',
									width : '50',
									formatter : function(value, row, index) {
										return index + 1;
									}
								},*/
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
									title : '所在 省份',
									align : 'center',
									width : '50'
								},{
									field : 'areacity',
									title : '所在城市',
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
												+ row.cid
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
		
		sweetAlert("提示", "不能有空值！", "error");
		
		return;
		
	}
	
	
	
	swal(
            {title:"确认要添加该数据吗？",
                text:"",
                type:"warning",
                showCancelButton:true,
                confirmButtonColor:"#DD6B55",
                confirmButtonText:"确定添加！",
                cancelButtonText:"取消",
                closeOnConfirm:false,
                closeOnCancel:false
            },
            function(isConfirm)
            {
                if(isConfirm)
                {
                	
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
            				swal({title:"提示信息",
                                text:"您已经成功修改地址。",
                                type:"success"},function(){
                                	$("#myModal").modal('hide');
                     				$('#address').bootstrapTable('refresh');
                     				
                                })
            				
            			}else if(data.code==1){
            				alert("修改失败");
            			}else{
            				alert("修改其他地址出错!");
            			}
            		 }
            		});
                }
                else{
                    swal({title:"已取消",
                        text:"您取消了修改操作！",
                        type:"error"})
                }
            }
        )
}

//增加地址
function addAddress(){
	
	var name = $("#username").val();
	var phoneNumber = $("#phoneNumber").val();
	var Province = $("#Province").val();
	var City = $("#City").val();
	var detailAddress = $("#detailAddress").val();
	var STATUS = $("#STATUS").val();
	
	if(name==""||phoneNumber==""||Province==""||City==""||detailAddress==""){
		
		sweetAlert("提示", "不能有空值！", "error");
		return;
	}
	
	 swal(
             {title:"确认要添加该数据吗？",
                 text:"",
                 type:"warning",
                 showCancelButton:true,
                 confirmButtonColor:"#DD6B55",
                 confirmButtonText:"确定添加！",
                 cancelButtonText:"取消",
                 closeOnConfirm:false,
                 closeOnCancel:false
             },
             function(isConfirm)
             {
                 if(isConfirm)
                 {
                	//获得状态
             		var statusBox = $("#STATUS").is(':checked');
             		
             		var status;
             		
             		if(statusBox==true){
             			status = 0;
             		}else{
             			status = 1;
             		}
             		$.ajax({
             		 type: "post",
             		 url: "/phone/address/addAddress",
             		 data: { 
             			 name:name,
             			 phone:phoneNumber,
             			 detail:detailAddress,
             			 province:Province,
             			 city:City,
             			 status:status
             			 
             		 },
             		 success: function (data) {
             			 
             			if(data.code==0){
             				 swal({title:"提示信息",
                                 text:"您已经成功添加地址。",
                                 type:"success"},function(){
                                	//将所有选项置空
                      				removeNUll();
                      				$('#address').bootstrapTable('refresh');
                      				
                                 })
             				
             				
             			}else if(data.code==1){
             				alert("添加失败");
             			}else{
             				alert("修改其他地址出错!");
             			}
             		 }
             		 
             		});
                	 
                 }
                 else{
                     swal({title:"已取消",
                         text:"您取消了添加操作！",
                         type:"error"})
                 }
             }
         )
	
}

function removeNUll(){
	
	$("#username").val('');
	 $("#phoneNumber").val('');
//	var Province = $("#Province").val();
//	var City = $("#City").val();
	 $("#detailAddress").val('');
	$("#STATUS").val('');
	
	
}

// 删除功能
function removeAddress(uid,cid) {
	
	swal(
            {title:"确认要删除该数据吗？",
                text:"",
                type:"warning",
                showCancelButton:true,
                confirmButtonColor:"#DD6B55",
                confirmButtonText:"确定删除！",
                cancelButtonText:"取消",
                closeOnConfirm:false,
                closeOnCancel:false
            },
            function(isConfirm)
            {
                if(isConfirm)
                {
               	 
               	$.ajax({
		 type: "post",
		 url: "/phone/address/delAddress",
		 data: { 
			 uid:uid,
			 cid:cid
		 },
		 success: function (data) {
			 
			if(data.code==1){
				 swal({title:"提示信息",
                     text:"您已经成功删除地址。",
                     type:"success"},function(){
          				$('#address').bootstrapTable('refresh');
                     })
			}else{
				alert("删除失败");
			}
		 }
         });
            	 
             }
             else{
                 swal({title:"已取消",
                     text:"您取消了取消操作！",
                     type:"error"})
             }
         }
     )

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


//点击个人信息的时候事件
function managerMessage(){
	
	loadPersonTable();
	
}


//加载个人信息
function loadPersonTable(){
	
	$.ajax({  
        url : "/phone/user/qryUserMessage",
			cache : false,
			success : function(data) {
				
				if(data!=null){
					
					$("#UID").html(data.uid);
					$("#USERNAMES").html(data.username);
					$("#PHONE").html(data.phone);
					$("#CARD").html(data.card);
				}else{
					$("#msg").css('display','block');
				}
				
				
			},
			error : function() {
				sweetAlert("提示", "查询错误！", "error");
			}
		});
}

//弹出个人信息修改弹框
function updateMessage(){
	
	
	$("#UPDATE_SNAME").val($("#USERNAMES").text());
	$("#UPDATE_PERSON_PHONE").val($("#PHONE").text());
	$("#UPDATE_CARD").val($("#CARD").text());
	
	$("#PersonModal").modal();
	
}

function updatePerson(){
	
	
	
	var uid = $("#UID").html()
	var username = $("#UPDATE_SNAME").val();
	var phone = $("#UPDATE_PERSON_PHONE").val();
	var card = $("#UPDATE_CARD").val();

	if(username==""||phone==""||card==""){
		sweetAlert("提示", "不能有空值！", "error");
		return;
	}
	
	
	
	
	swal(
            {title:"确认要修改该数据吗？",
                text:"",
                type:"warning",
                showCancelButton:true,
                confirmButtonColor:"#DD6B55",
                confirmButtonText:"确定修改",
                cancelButtonText:"取消",
                closeOnConfirm:false,
                closeOnCancel:false
            },
            function(isConfirm)
            {
                if(isConfirm)
                {
                	$.ajax({  
                        url : "/phone/user/updatePersonMsg",
                			cache : false,
                			data:{
                				uid:uid,
                				username:username,
                				phone:phone,
                				card:card
                			},
                			success : function(data) {
                				if(data.result==1){
                					 swal({title:"提示信息",
                	                     text:"您已经成功修改个人信息。",
                	                     type:"success"},function(){
                	                    	 
                	                    	 loadPersonTable();
                	                    	 $("#PersonModal").modal('hide');;
                	                     });
                					
                				}else{
                					
                					sweetAlert("提示", "修改出现错误！", "error");
                				}
                				
                			},
                			error : function() {
                				sweetAlert("提示", "修改出现错误！", "error");
                			}
                		});
                }
             else{
                 swal({title:"已取消",
                     text:"您取消了修改操作！",
                     type:"error"})
             }
         }
     )
	
}




