/**
 * 购物车引用Js
 */
  

function queryCart(uid){
	
	//后台还原库存，并且将cart表中该项删除
    $.ajax({  
        url : "/phone/product/qryCartByUid",
			data : {
				uid:uid
			},
			cache : false,
			success : function(data) {
				
				var content ="";
				for (var i = 0; i < data.length; i++) {
					
					content  = "<tr>" +
							"<td style='vertical-align:middle;'><input  type='checkbox' name = 'check' /> </td>" 
							+"<td style='vertical-align:middle;' class='goods'><img alt='' width='100px' height='100px;' src=/phone/images"+data[i].address+"  class='img-thumbnail'><label>" +data[i].product.pname +"</label></td>"
							+"<td style='vertical-align:middle;' class='number small-bold-red'><span name='onePrice'>"+data[i].product.price+"</span></td>"
							+"<td style='vertical-align:middle;'><button onclick='reduce(this)'>-</button><input style='width:100px;text-align' type='text' value='"+data[i].cart.count+"' readonly='readonly' class='num'  ng-change='change($index)' /><button onclick='add(this)'>+</button></td>"
							+"<td style='vertical-align:middle;' class='subtotal number small-bold-red' name='total'>"+data[i].product.price*data[i].cart.count+"</td> "
							+"<td style='vertical-align:middle;' class='operation'><a onclick='remove(this);' class='btn btn-danger btn-info btn-md'><span class='glyphicon glyphicon-remove-sign'></span></a></td>"
							+"<td style='display:none;' name='PID'>"+data[i].product.pid+"</td>"
							+"<td style='display:none;' name='UID'>"+data[i].cart.uid+"</td>"
							+"<td style='display:none;' name='COUNT'>"+data[i].cart.count+"</td>"
							+"<td style='display:none;' name='CID'>"+data[i].cart.cid+"</td>"
							+"</tr>";
					
					$("#CartTable").append(content);;
				}
				
				//利用ajax刷新出来的需要重新加载
				//全选框  
				$("#allCheck").click(function(){  
				    $("input[name='check']").prop("checked",this.checked);
				    TotalPrice();
				});

				//单选框  
				$("input[name='check']").change(function(){  
				    if($("input[name='check']").not("input:checked").size() <= 0){  
				        $("#allCheck").prop("checked",true);  
				    }else{  
				        $("#allCheck").prop("checked",false);  
				    }  
				    TotalPrice();
				}); 
				
			},
			error : function() {
				alert("出错了！");
			}
		});
	
	
	
}

//清除单行
function remove(obj){
	
	var tdObject = $(obj).parent();
	
	var pid = tdObject.parent().find("td").eq(6).text();
	
	var cid = tdObject.parent().find("td").eq(9).text();
	
	
	 var r=confirm("是否删除该产品？")
	 if (r==true){
		//后台还原库存，并且将cart表中该项删除
		    $.ajax({  
		        url : "/phone/product/removeCartOpt",
					data : {
						uid:uid,
						pid:pid,
						cid:cid
					},
					cache : false,
					success : function(data) {
						if(data.result==1){
							//直接刷新购物车
							window.location.href = "/phone/product/toCart";
							
						}else if(data.result==-1){
							alert("删除购物车条目失败！");
						}
					},
					error : function() {
						alert("出错了！");
					}
				});
		 
	 }
	
	
	
	
}


//全选框  
$("#allCheck").click(function(){  
    $("input[name='check']").prop("checked",this.checked);
    TotalPrice();
});

//单选框  
$("input[name='check']").change(function(){  
    if($("input[name='check']").not("input:checked").size() <= 0){  
        $("#allCheck").prop("checked",true);  
    }else{  
        $("#allCheck").prop("checked",false);  
    }  
    TotalPrice();
});  


function TotalPrice(){
	
	var totalprice = 0 ;
	
	$("input[name='check']:checkbox:checked").each(function(){ 
		
//		alert($(this).parent().parent().html());
		
		var obj = $(this).parent().parent();
		
		var onetotal = parseInt(obj.find("[name='total']").text());
		
		totalprice+=onetotal;
		
	}) 
	$("#priceTotal").text(totalprice);
}


/**
 * 点击减少，判断减完后是否是0，是的话则 弹框提示 是否取消 
 * 点击增加，从后台查询库存是否大于0，如果大于0，则允许加，否则不允许添加
 */


function reduce(object){
	
	var tdObject = $(object).parent();
	
	var qty = tdObject.find("input").eq(0).val();
	
	var pid = tdObject.parent().find("td").eq(6).text();
	
	
	var cid = tdObject.parent().find("td").eq(9).text();
	
	
	//判断减完后是否为0
	if(qty==1){
		 var r=confirm("是否删除该产品？")
		 if (r==true)
		 {
			//后台还原库存，并且将cart表中该项删除
			    $.ajax({  
			        url : "/phone/product/deleteCartOpt",
						data : {
							uid:uid,
							pid:pid,
							cid:cid
						},
						cache : false,
						success : function(data) {
							if(data.result==1){
								//直接刷新购物车
								window.location.href = "/phone/product/toCart";
//								tdObject.find("input").eq(0).val(--qty);
//								calcPrice(object);
								
							}else if(data.result==-1){
								alert("库存更新失败");
							}else if(data.result==0){
								
								alert("删除购物车失败");
							}
						},
						error : function() {
							alert("出错了！");
						}
					});
		 }
	}else{
		//库存加1并且购物车减1
		 $.ajax({  
		        url : "/phone/product/reduceCartOpt",
					data : {
						uid:uid,
						pid:pid,
						cid:cid
					},
					cache : false,
					success : function(data) {
						if(data.result==1){
							//直接刷新购物车
//							window.location.href = "/phone/product/toCart";
							tdObject.find("input").eq(0).val(--qty);
							calcPrice(object);
							
						}else if(data.result==-1){
							alert("更新失败!");
						}
					},
					error : function() {
						alert("出错了！");
					}
				});
		
	}
	
}

//增加按钮事件
function add(object){
	
	var tdObject = $(object).parent();
	
	var qty = tdObject.find("input").eq(0).val();
	
	var pid = tdObject.parent().find("td").eq(6).text();
	
	var cid = tdObject.parent().find("td").eq(9).text();
	
	//查询后台的库存是否大于0，大于0 就添加，否则提示库存不够
	
	//更新库存是否大于0
	 $.ajax({  
	        url : "/phone/product/addCart",
				data : {
					uid:uid,
					pid:pid,
					cid:cid
				},
				cache : false,
				success : function(data) {
					if(data.result==0){
						//直接刷新购物车
//						window.location.href = "/phone/product/toCart";
						tdObject.find("input").eq(0).val(++qty);
						calcPrice(object);
						
					}else if(data.result==-1){
						alert("库存不够!");
					}
				},
				error : function() {
					alert("出错了！");
				}
			});
	
	
	//模拟数据
//	var stock = 1;
//	
//	if(stock>0){
//		
//		tdObject.find("input").eq(0).val(++qty);
//		calcPrice(object);
//	}else{
//		alert("库存不够！ 添加失败");
//	}
	
}


//计算单条产品的价格
function calcPrice(obj){
	
	var tdObject = $(obj).parent().parent();
	
	//获得单价
	var onePrice =  $(tdObject).find("[name='onePrice']").text();
	//获得数量
	var qty =  $(obj).parent().find("input").eq(0).val();
	//计算价格
	var totalPrice = onePrice*qty;
	
	$(tdObject).find("[name='total']").text(totalPrice);	
	
	TotalPrice();
}


//跳转到订单环节
function toOrder(){
	
	window.location.href = "/phone/user/toOrder";
	
}


