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
//						 window.location.href = "<%=basePath%>product/toCart";   
				     }
					
				}else if(data.code==1){
					alert("库存不够！！ 添加购物车失败");
				}else if(data.code==2){
					//添加 成功直接跳到购物车
					window.location.href = "/phone/product/toCart";   
				}else if(data.code==3){
					alert("修改库存失败！");
				}else if(data.code==4){
					alert("加入购物车失败！ 请重试！");
				}
			},
			error : function() {
				alert("查询出错了！");
			}
		});
}


//用户选择的产品
function choice(val) {
		
		
	clearProduct(val);
	
		/*加载数据*/
	    $.ajax({  
	        url : "/phone/product/queryProduct",
				data : {
					type_id:val
				},
				cache : false,
				success : function(data) {
					loading = true;
					
					if (data.length>0) {
						var content = "";
						
					    for (var i = 0; i < data.length; i++) {
					    	
					    	 content  = "<div class='col-md-3 product-men'>"
					    	 		+ "<div class='men-pro-item simpleCart_shelfItem'>"
									+ "<div class='men-thumb-item'>"
									+"<img src=/phone/images"+data[i].picture.prAddress+" alt='' class='pro-image-front'>"
									+ "<img src=/phone/images"+data[i].picture.prAddress+" alt='' class='pro-image-back'>"
									+ "<div class='men-cart-pro'> <div class='inner-men-cart-pro'>"
									+ "<a onclick='toDetail("+data[i].product.pid+")' class='link-product-add-cart'>查看详情</a> </div> </div>"
									+"<span class='product-new-top'>New</span>"
									+"</div>"
									+" <div class='item-info-product'> "
									+"<h4> <a href=''>"+data[i].product.pname+"</a></h4>"
									+"<div class='info-product-price'> <span class='item_price'>$"+data[i].product.price+"</span> <del>$5000</del> </div>"
									+"<a  onclick='toDetail("+data[i].product.pid+")' class='item_add single-item hvr-outline-out button2'>查看详情</a>"
									+"	</div></div></div>";
									
					    	 appendContent(content,val);
						}
					    
					} else{
						sweetAlert("提示", "抱歉，暂时没货！", "error");
					}
				},
				error : function() {
					sweetAlert("提示", "系统错误", "error");
				}
			});

	}
	
function clearProduct(val){
	
	if(val==1){
		$("#ProductList").empty();
	}else if(val==2){
		$("#ProductList1").empty();
	}else if(val==11){
		$("#ProductList2").empty();
	}else if(val==12){
		$("#ProductList3").empty();
	}else if(val==13){
		$("#ProductList4").empty();
	}else if(val==14){
		$("#ProductList5").empty();
	}else if(val==0){
		$("#ProductList6").empty();
	}
	
}	


function  appendContent(content,val){
	
	
	if(val==1){
		$("#ProductList").append(content);
	}else if(val==2){
		$("#ProductList1").append(content);
	}else if(val==11){
		$("#ProductList2").append(content);
	}else if(val==12){
		$("#ProductList3").append(content);
	}else if(val==13){
		$("#ProductList4").append(content);
	}else if(val==14){
		$("#ProductList5").append(content);
	}else if(val==0){
		$("#ProductList6").append(content);
	}
}



function toDetail(pid){
		
	//跳转到详情页并带pid过去
	window.location.href='/phone/product/toProductDetail?pid='+pid;
		
}
	
