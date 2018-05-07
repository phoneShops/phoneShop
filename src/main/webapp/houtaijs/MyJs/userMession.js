$(function() {
 		//加载表格数据
 		loadTable();
 	 	//加载弹出框
 		loadDialog(); 
 	})
 	//搜索查询
	function search(){$('#table').bootstrapTable('refresh');}
 	function add(){resetAdd();$("#add").dialog("open");}	
 	function editUser(number){getUser(number);$("#edit").dialog("open");}
 
 	/*
 	*number:用户证件
 	*根据证件获取用户信息
 	*/
 	function getUser(card){
 		$.ajax({
 			url : '/phone/mannage/queryUserByNo',
 			type : 'post',
 			data : {
      		  "card" : card
	      	  },
	      	  async:false,
			  cache : false,
			  success:function(data){
				  	console.log(data);
					var user =  data.user;
					$("#card").val(user.card);
					$("#username").val(user.username);
					$("#phone").val(user.phone);
					$("#address").val(user.address);
					$("#regtime").val(user.regTime);
					$("#u_id").val(user.uid);					
			  }
 		})
 	}
 	

 	
 	
 	/* 
 	*status:用户状态
 	*根据用户card修改用户状态
 	*/
 	function editStatus(card,status){
 		
 			layer.confirm('确定此操作？', {
 	 		btn : [ '确定', '取消' ]
 	 	//按钮
 	 	}, 
 	 	
 	 	function() {
 	 	//点击确定
 	 	var statu = 1;
 		if (status==1) {
			statu = 0;
		}
 		$.ajax({
 			url : '/phone/mannage/editStatu',
 			type : 'post',
 			data : {
 				'card' : card,
 				'status' : statu
 			},
 			async:false,
		  	cache : false,
		  	success:function(data){
		  		if(statu==0){
		  			
		  			layer.msg('入户成功', {
		  				time : 2000, //2s后自动关闭
		  			}
		  			);
		  		}else{
		  			layer.msg('销户成功', {
		  				time : 2000, //2s后自动关闭
		  			}
		  			);
		  		}
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
											field : 'status',
											title : '用户状态',
											align : 'center',
											width:'10',
											formatter : function(value, row, index) {
												var status = "";
												if (row.status==1) {
													status = "已销户";
												}else{
													status = "正常状态";
												}
												return status;
											}
										},
										{
											title : '操作',
											field : 'uid',
											align : 'center',
											width:'20',
											formatter : function(value, row, index) {
												var e = '<a href="#"><i class="icon-edit" title="编辑" onclick="editUser(\''+row.card+'\')" ></i></a>';
												var c = "";
												if (row.status==1) {
													c = '<a href="#"><i class="icon-lock" title="重新入户" onclick="editStatus(\''+row.card+'\',\''+row.status +'\')"></i></a>';
												}else{
													c = '<a href="#"><i class="icon-unlock" title="销户" onclick="editStatus(\''+row.card+'\',\''+row.status+'\')"></i></a>';
												}
												
												return e+ " | " + c;
										}
									}
								]
							});
		}
	 		
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
			        	var address = $("#address").val();        
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
					        		  'card' : $("#card").val(),
					        		  'username' : username,
					        		  'phone' : phone,
					        		  'address' : address,
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
	// 	}