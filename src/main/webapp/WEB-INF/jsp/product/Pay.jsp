<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ include file="../user/head.jsp"%>

<title>支付订单界面</title>
</head>
<body>

	<div class="container">

		<div class="row">
			<div class="col-md-12 col-lg-12 col-sm-12">
				<div style="border-top: 1px solid gray; padding: 4px 10px;">
					<br>
					<div style="margin-left: 2px;" class="pull-left total">

						<font size="3px;" color="green">订单提交成功！ </font><span>订单号：</span><span id="order_id"></span> <span>用户需要支付：</span><font id="money" color="green" size="3px;"></font>

					</div>
					<div style="margin-left: 0px;" class="pull-right total">
						<button class="btn-lg btn-success" type="button" onclick="pay();">支付宝支付</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row" style="margin-left: 2px;" class="pull-left total">
			<span>
					<p>
						本站是支付宝签约商户，您直接点击“支付宝付款”即可通过支付宝担保交易。<br>
						发货信息可以在电脑上登录支付宝查看，收到货后您可以在支付宝点击确认收货，跟在淘宝购物类似。
					</p>
				<p>
					需邮寄的客户如果您想选择别的支付方式，请先与客服联系。<br> 目前本站支持银行转账、支付宝付款、淘宝担保交易、微信支付。<br>
					<br> 支付宝账号：2269585445@qq.com 微信个人号：huishoucom0731<br> 建 设
					银 行 ：6214 0029 2069 0072 822庞攀<br> 公 司 账 户 ： 731 905 234 710
					501 <br> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;长沙XX科技有限公司 <br>
					&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;招商银行长沙分行营业部<br>
				</p>

			</span>

		</div>
	</div>




	<!-- 引入footer.jsp -->
	<jsp:include page="../user/footer.jsp"></jsp:include>

</body>

<script type="text/javascript">
$(function(){  
	
    var order_id = ${requestScope.order_id};
    var priceTotal = ${requestScope.priceTotal};
    
    $("#order_id").text(order_id);
    $("#money").text(priceTotal);
    
    
});
</script>



</html>