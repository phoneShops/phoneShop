$(function() {
 		//加载表格数据
 		loadTable();
 	 	//加载弹出框
 		loadDialog(); 
 	})
 	//搜索查询
	function search(){$('#table').bootstrapTable('refresh');}
	//加载手机详情弹框
	function getMession(num){
		$("#edit").dialog("open");
		$('#table2').bootstrapTable(
				{
					url : '/phone/productData/loadMession',
					dataType : "json",
					pagination : true, //分页
					pageNumber : 1, //初始化加载第一页，默认第一页
					pageSize : 10, //每页的记录行数（*）
					clickToSelect : true, //是否启用点击选中行 
					showToggle : "true",
					smartDisplay : false,
					sidePagination : "server",
					queryParamsType : "",
					queryParams : function queryParams(params) {
						return {
							pageSize : params.pageSize,
							pageIndex : params.pageNumber,
							key : num
						}
					},
					pageList : [ 5, 10, 15, 20 ], //可供选择的每页的行数（*） 
					columns : [
							{
								field : '',
								title : '编号',
								align : 'center',
								width:'10',
							formatter : function(value, row, index) {
								return index+1;
								}
							},
							{
								field : 'attrCode',
								title : '属性标签',
								align : 'center',
								width:'20',
							},
							{
								field : 'attrName',
								title : '属性名称',
								align : 'center',
								width:'10',											
							},
							{
								field : 'attrDesc',
								title : '参数',
								align : 'center',
								width:'20',						
							}
					]
				});
	}
	
	
	
	$("#edit").dialog({
		autoOpen : false,
		title:'产品详情',
		width : 800,
		height : 400,
		modal : true,
	});
	
	function loadTable() {
			$('#table').bootstrapTable(
							{
								url : '/phone/productData/ProductList',
								dataType : "json",
								toolbar : '#toolbar', //工具按钮用哪个容器
								pagination : true, //分页
								pageNumber : 1, //初始化加载第一页，默认第一页
								pageSize : 10, //每页的记录行数（*）
								clickToSelect : true, //是否启用点击选中行 
								showToggle : "true",
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
											field : '',
											title : '编号',
											align : 'center',
											width:'10',
										formatter : function(value, row, index) {
											return index+1;
											}
										},
										{
											field : '',
											title : '图片',
											align : 'center',
											width:'50',
											formatter : function(value, row, index) {
												//var imgsrc = "";
												/*if (row.typeId==1) {
													imgsrc = "D:\picture\sun.png";
												}else if(row.typeId==2){
													imgsrc = "苹果";
												}else if(row.typeId==3){
													imgsrc = "诺基亚";
												}else if(row.typeId==4){
													imgsrc = "联想";
												}else if(row.typeId==5){
													imgsrc = "谷歌";
												}else if(row.typeId==6){
													imgsrc = "LG";
												}else if(row.typeId==7){
													imgsrc = "Dell";
												}else if(row.typeId==8){
													imgsrc = "OPPO";
												}else if(row.typeId==9){
													imgsrc = "HTC";
												}else{				//www.baidu.com/img/baidu_jgylogo3.gif
													imgsrc = "SONY";file://图片的地址
												}*/
												return '<a class = "view"  href="javascript:void(0)"><img style="width:80;height:40px;" src="/file/sun.png"/></a>';
											},
										  events: 'operateEvents'
										},
										{
											field : 'typeId',
											title : '公司品牌',
											align : 'center',
											width:'20',
											formatter : function(value, row, index) {
												var log = "";
												if (row.typeId==1) {
													log = "三星";
												}else if(row.typeId==2){
													log = "苹果";
												}else if(row.typeId==3){
													log = "诺基亚";
												}else if(row.typeId==4){
													log = "联想";
												}else if(row.typeId==5){
													log = "谷歌";
												}else if(row.typeId==6){
													log = "LG";
												}else if(row.typeId==7){
													log = "Dell";
												}else if(row.typeId==8){
													log = "OPPO";
												}else if(row.typeId==9){
													log = "HTC";
												}else{
													log = "SONY";
												}
												return log;
											}
										},
										{
											field : 'pname',
											title : '手机品牌',
											align : 'center',
											width:'10',											
										},
										{
											field : 'price',
											title : '手机价格',
											align : 'center',
											width:'50'
										},
										{
											field : 'discount',
											title : '折扣',
											align : 'center',
											width:'50'
										},
										{
											field : 'stock',
											title : '库存',
											align : 'center',
											width:'50'
										},										
										{
											field : '',
											title : '产品参数',
											align : 'center',
											width:'20',
											formatter : function(value, row, index) {
												 return '<button class="btn btn-default btn-sm" onclick="getMession(\'' + row.pid + '\')">详情</button>';										    
											}
										},		
										{
											field : 'status',
											title : '销售状态',
											align : 'center',
											width:'10',
											formatter : function(value, row, index) {
												var status = "";
												if (row.status==1) {
													status = "已下架";
												}else{
													status = "线上销售";
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
													c = '<a href="#"><i class="icon-lock" title="重新上架" onclick="editStatus(\''+row.card+'\',\''+row.status +'\')"></i></a>';
												}else{
													c = '<a href="#"><i class="icon-unlock" title="商品下线" onclick="editStatus(\''+row.card+'\',\''+row.status+'\')"></i></a>';
												}
												
												return e+ " | " + c;
										}
									}
								],
							});

	}
//点击放大事件
	window.operateEvents = {
				    'click.view': function (e, value, row, index) {
				    	console.log(row);
				    	layer.open({
				    	  type: 1,
				    	  title: false,
				    	  closeBtn: 0,
				    	  area: 'auto',
				    	  skin: 'layui-layer-nobg', //没有背景色
				    	  shadeClose: true,
				    	  content: '<img src="/file/sun.png"/>'
				    	});
				    },
				};
			
	//详情弹出框
	