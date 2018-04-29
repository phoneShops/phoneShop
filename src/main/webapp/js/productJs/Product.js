//查询产品详细信息
function qryProductDetail(pid){
	
	//准备请求数据，显示模态框
	//$('#myModal').modal('show');
	
	/*加载产品信息数据*/
    $.ajax({  
        url : "/phone/product/queryProductDetail",
			data : {
				pid:pid
			},
			cache : false,
			success : function(data) {
				$("#PRODUCT_NAME").text(data.pname);
				$("#PRICE").text(data.price);
				$("#PRODUCT_DETAIL").attr("href",data.detail);
				//请求完成，隐藏模态框
				//$('div.loading').hide();
			},
			error : function() {
				alert("查询出错了！");
			}
		});
	
}
//查询产品图片地址信息
function qryProductPicture(pid){
	
	
	/*加载产品图片信息数据*/
    $.ajax({  
        url : "/phone/product/queryProductPicture",
			data : {
				pid:pid
			},
			cache : false,
			success : function(data) {
				
				var content = "";
				
				for(var i=0;i<data.length;i++){
					
					
					if(data[i].prStatus==0){
						
						$("#MAIN_PICTURE").attr("src","/phone/images"+data[i].prAddress);
					}
					content  = "<li class='col-lg-3 col-sm-3 col-xs-4'> <a href='#'><img class='img-responsive' src=/phone/images"+data[i].prAddress
								+"></a></li>";
					
					$("#PRODUCT_PICTURE").append(content);
				}
			},
			error : function() {
				alert("查询出错了！");
			}
		});
	
	
	
}
//查询产品属性信息
function qryProductAttr(pid){
	
//	product_attr
	
	/*加载产品属性信息数据*/
    $.ajax({  
        url : "/phone/product/queryProductAttr",
			data : {
				pid:pid
			},
			cache : false,
			success : function(data) {
				var content = "";
				
				//循环放入产品属性
				for(var i=0;i<data.length;i++){
//					style="border:2px solid red;letter-spacing:5px;padding:0.5px 0.5px;"
					 content  = "<li>"+data[i].attrName+'	:&emsp;&emsp;<span>'+data[i].attrDesc+"</span></li>";
					 $("#product_attr").append(content);
				}
				
			},
			error : function() {
				alert("查询出错了！");
			}
		});
}


//点击 立即购买事件
function buy(){
	
	debugger;
	
	var pid = $("#PID_VAL").val();
	
	/*加载产品属性信息数据*/
    $.ajax({  
        url : "/phone/product/buyProduct",
			data : {
				pid:pid
			},
			cache : false,
			success : function(data) {
				
				if(data.code==-1){
					 var r=confirm("您还未登录，是否立即登录？")
					 if (r==true)
					 {
					    window.location.href = "/phone/user/tologin";
					 }else{
						 //window.location.href = "<%=basePath%>user/toregister";   
				     }0
					
				}
			},
			error : function() {
				alert("查询出错了！");
			}
		});
	
	
}