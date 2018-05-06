/**
 *订单js 
 */

function queryOrder(array){
	
	//后台生成订单信息，生成order_id
	$.ajax({  
        url : "/phone/order/qryOrderByUid",
			data : {
				array:array
			},
			cache : false,
			success : function(data) {
				
				
				//订单号
				$("#ORDER_ID").text(data[0].order_id);
				//数组
				$("#DataArray").val(data[0].data);
				
				var content = "";
				
				var TotalPrice = 0;
				
				for (var i = 0; i < data.length; i++) {
					
//					alert(data[i].product.pid);
//					alert(data[i].cart.uid);
//							
//					alert(data[i].cart.count);
					
					TotalPrice = TotalPrice + data[i].cart.count*data[i].product.price;
					
					content  = "<tr>"
					+"<td style='vertical-align:middle;' class='goods'><img alt='' width='100px' height='100px;' src=/phone/images"+data[i].address+"  class='img-thumbnail'><label>" +data[i].product.pname +"</label></td>"
					+"<td style='vertical-align:middle;' class='number small-bold-red'>"+data[i].product.price+"</td>"
					+"<td style='vertical-align:middle;'>"+data[i].cart.count+"</td>"
					+"</tr>";
					
					$("#ORDER_TABLE").append(content);
				}
				
				$("#priceTotal").text(TotalPrice);
				
			},
			error : function() {
				sweetAlert("提示", "出错了！", "error");
			}
		});
	
	
	
}