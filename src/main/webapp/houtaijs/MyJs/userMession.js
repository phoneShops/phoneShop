$(function() {
 		//加载表格数据
 		loadTable();
 	 	//加载弹出框
 		loadDialog(); 
 	})
 	//搜索查询
	function search(){$('#table').bootstrapTable('refresh');}
 	function add(){resetAdd();$("#add").dialog("open");}
 	function editRepair(number){getStaff(number);$("#edit").dialog("open");}
 	function resetAdd(){
 		$("#repairName").val;
 		$("#monthlyWage").val;
 		$("#phone").val();
 		$("#salary").val();
 		$("IDCard").val();
 	}
 	/* 
 	*status:用户状态
 	*根据用户uid修改员工状态
 	*/
 	function editStatus(uid,status){
 		layer.confirm('确定修改', {
 	 		btn : [ '确定', '取消' ]
 	 	//按钮
 	 	}, function() {
 	 	//点击确定
 	 	var statu = 0;
 		if (status==0) {
			statu = 1;
		}
 		$.ajax({
 			url : '/phone/mannage/editUser',
 			type : 'post',
 			data : {
 				'uid' : number,
 				'status' : status
 			},
 			async:false,
		  	cache : false,
		  	success:function(data){
		  		layer.msg('修改成功', {
					time : 2000, //2s后自动关闭
				});
		  		$('#table').bootstrapTable("refresh");
		  	}
 		})
 	 	}, function() {

 	 	});
 		
 	}
 	
	 	function loadTable() {
			$('#table').bootstrapTable(
							{
								url : '/phone/mannage/userList',
								dataType : "json",
								toolbar : '#toolbar', //工具按钮用哪个容器
								pagination : true, //分页
								pageNumber : 1, //初始化加载第一页，默认第一页
								pageSize : 10, //每页的记录行数（*）
								clickToSelect : true, //是否启用点击选中行 
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
								pageList : [ 5, 10, 15, 20 ], //可供选择的每页的行数（*） 
								columns : [
										{
											field : 'uid',
											title : '序号',
											align : 'center',
											width:'50',
										formatter : function(value, row, index) {
											return index+1;
											}
										},
										{
											field : 'username',
											title : '用户姓名',
											align : 'center',
											width:'20',
										},
										{
											field : 'card',
											title : '身份证',
											align : 'center',
											width:'10'
										},
										{
											field : 'phone',
											title : '手机号码',
											align : 'center',
											width:'50'
										},
										{
											field : 'address',
											title : '家庭住址',
											align : 'center',
											width:'50'
										},
										{
											field : 'regTime',
											title : '注册时间',
											align : 'center',
											width:'50'
										},
										{
											field : 'statue',
											title : '用户状态',
											align : 'center',
											width:'10',
											formatter : function(value, row, index) {
												var statu = "";
												if (row.statu==0) {
													statu = "已销户";
												}else{
													statu = "正常";
												}
												return statu;
											}
										},
										{
											title : '操作',
											field : 'uid',
											align : 'center',
											width:'20',
											formatter : function(value, row, index) {
												var e = '<a href="#"><i class="icon-edit" title="编辑" onclick="editRepair(\''+row.uid +'\')" ></i></a>';
												var c = "";
												if (row.statu==0) {
													c = '<a href="#"><i class="icon-lock" title="重新入户" onclick="editStatus(\''+row.uid +'\',\''+row.status +'\')"></i></a>';
												}else{
													c = '<a href="#"><i class="icon-unlock" title="销户" onclick="editStatus(\''+row.uid +'\',\''+row.status+'\')"></i></a>';
												}
												
												return e+ " | " + c;
										}
									}
								]
							});
		}
	 	
	 	function loadDialog() {	 		
	 		$("#edit").dialog({
				autoOpen : false,
				title:'修改用户信息',
				width : 350,
				height : 350,
				modal : true,
				buttons: {
			        "确定": function() {
			        	var username = $("#username").val();
			        	var phone = $("#phone").val();
			        	var adress = $("#adress").val();
			        
			        	if (username=="") {
			        		layer.msg("请填写姓名", {
			     				time : 2000, //2s后自动关闭
			     			});
						}else if (!(/^1[34578]\d{9}$/.test(phone))) {
							layer.msg("请输入正确的手机号码", {
			     				time : 2000, //2s后自动关闭
			     			});
						} else{
					          $.ajax({
					        	  url : '/phone/mannage/editUser',
					        	  type : 'post',
					        	  data : {
					        		  'uid' : $("#uid").val(),
					        		  'username' : username,
					        		  'phone' : phone,
					        		  'adress' : adress,
					        	  },
					        	  async:false,
								  cache : false,
								  success:function(data){
										if (data=="success") {
											layer.msg('修改成功', {time : 2000,});
											$('#table').bootstrapTable("refresh");
											$('#edit').dialog( "close" );
										}else{
											layer.msg('请重新操作', {time : 2000,});
											$('#table').bootstrapTable("refresh");
										}
								  }
					          })
						}
			        },
			        "取消": function() {
			        	 $( this ).dialog( "close" );
			        }
			      }
			});
	 	}