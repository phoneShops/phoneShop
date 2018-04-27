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
 	*number:员工编码
 	*statu:员工状态
 	*根据员工编码修改员工状态
 	*/
 	function editStatus(number,status){
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
 			url : '/sys/staff/editStatu.do',
 			type : 'post',
 			data : {
 				'repairmanNo' : number,
 				'statu' : statu
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
 	/*
 	*number:员工编码
 	*根据编码获取员工信息
 	*/
 	function getStaff(repairmanNo){
 		$.ajax({
 			url : '/sys/staff/queryStaffByNo.do',
 			type : 'post',
 			data : {
      		  "repairmanNo" : repairmanNo
	      	  },
	      	  async:false,
			  cache : false,
			  success:function(data){
				  	console.log(data);
					var staff =  data.staff;
					$("#repairmanNo").val(staff.repairmanNo);
					$("#repairmanName").val(staff.repairmanName);
					$("#monthlyWages").val(staff.monthlyWages);
					$("#tel").val(staff.phone);
					$("#hourlyPay").val(staff.hourlyPay);
					$("#IDNumber").val(staff.iDNumber);
			  }
 		})
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
											field : 'loginTime',
											title : '登陆时间',
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
													statu = "已离职";
												}else{
													statu = "在职";
												}
												return statu;
											}
										},
										{
											title : '操作',
											field : 'E_id',
											align : 'center',
											width:'20',
											formatter : function(value, row, index) {
												var e = '<a href="#"><i class="icon-edit" title="编辑" onclick="editRepair(\''+row.E_id +'\')" ></i></a>';
												var c = "";
												if (row.statu==0) {
													c = '<a href="#"><i class="icon-lock" title="重新入职" onclick="editStatus(\''+row.E_id +'\',\''+row.statu +'\')"></i></a>';
												}else{
													c = '<a href="#"><i class="icon-unlock" title="离职" onclick="editStatus(\''+row.E_id +'\',\''+row.statu +'\')"></i></a>';
												}
												
												return e+ " | " + c;
										}
									}
								]
							});
		}
	 	
	 	function loadDialog() {
	 		$("#add").dialog({
				autoOpen : false,
				title:'新增员工',
				width : 350,
				height : 350,
				modal : true,
				buttons: {
			        "确定": function() {
			        	var repairName = $("#repairName").val();
			        	var phone = $("#phone").val();
			        	var salary = $("#salary").val();
			        	var IDCard = $("#IDCard").val();
			        	var monthlyWages = $("#monthlyWage").val();
			        	if (repairName=="") {
			        		layer.msg("请填写姓名", {
			     				time : 2000, //2s后自动关闭
			     			});
						}else if (!(/^1[34578]\d{9}$/.test(phone))) {
							layer.msg("请输入正确的手机号码", {
			     				time : 2000, //2s后自动关闭
			     			});
						}else if (!/^(:?(:?\d+.\d+)|(:?\d+))$/.test(monthlyWages)) {
							layer.msg("请输入正确工资", {
			     				time : 2000, //2s后自动关闭
			     			});
						}else if (!/^(:?(:?\d+.\d+)|(:?\d+))$/.test(salary)) {
							layer.msg("请正确输入小时工资", {
			     				time : 2000, //2s后自动关闭
			     			});
						} else if(!/(^\d{15}$)|(^\d{17}(\d|X)$)/.test(IDCard)){
							layer.msg("请输入合法身份证号", {
			     				time : 2000, //2s后自动关闭
			     			});
						}else{
					          $.ajax({
					        	  url : '/sys/staff/addStaff.do',
					        	  type : 'post',
					        	  data : {
					        		  'repairName' : repairName,
					        		  'phone' : phone,
					        		  'salary' : salary,
					        		  'monthlyWages' :  monthlyWages,
					        		  'IDCard' : IDCard
					        	  },
					        	  async:false,
								  cache : false,
								  success:function(data){
										if (data=="success") {
											layer.msg('入职成功', {time : 2000,});
											$('#table').bootstrapTable("refresh");
											$('#add').dialog( "close" );
										}else{
											layer.msg('请重新操作', {time : 2000,});
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
	 		$("#edit").dialog({
				autoOpen : false,
				title:'修改员工信息',
				width : 350,
				height : 350,
				modal : true,
				buttons: {
			        "确定": function() {
			        	var repairName = $("#repairmanName").val();
			        	var phone = $("#tel").val();
			        	var salary = $("#hourlyPay").val();
			        	var IDCard = $("#IDNumber").val();
			        	var monthlyWages = $("#monthlyWages").val();
			        	if (repairName=="") {
			        		layer.msg("请填写姓名", {
			     				time : 2000, //2s后自动关闭
			     			});
						}else if (!(/^1[34578]\d{9}$/.test(phone))) {
							layer.msg("请输入正确的手机号码", {
			     				time : 2000, //2s后自动关闭
			     			});
						}else if (!/^(:?(:?\d+.\d+)|(:?\d+))$/.test(salary)) {
							layer.msg("请正确输入小时工资", {
			     				time : 2000, //2s后自动关闭
			     			});
						} else if(!/(^\d{15}$)|(^\d{17}(\d|X)$)/.test(IDCard)){
							layer.msg("请输入合法身份证号", {
			     				time : 2000, //2s后自动关闭
			     			});
						}else{
					          $.ajax({
					        	  url : '/sys/staff/editStaff.do',
					        	  type : 'post',
					        	  data : {
					        		  'repairmanNo' : $("#repairmanNo").val(),
					        		  'repairName' : repairName,
					        		  'phone' : phone,
					        		  'monthlyWages' : monthlyWages,
					        		  'salary' : salary,
					        		  'IDCard' : IDCard
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