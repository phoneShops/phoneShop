<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>用户管理</title>  
          <%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
		%>      
	 	
		 	<!-- Vendor CSS-->

<link rel="stylesheet" href="<%=basePath %>css/bootstrap.css" /> 
<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" />
<script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.min.js" ></script>
<script src="<%=basePath %>layer/layer.js" type="text/javascript"></script>

<link href="<%=basePath %>assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath %>assets/vendor/skycons/css/skycons.css" rel="stylesheet" />
<link href="<%=basePath %>assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!-- Theme CSS -->
<link href="<%=basePath %>assets/css/jquery.mmenu.css" rel="stylesheet" />
<link type="text/css" href="<%=basePath %>assets/css/bootstrap-theme.min.css" rel="stylesheet">
<link type="text/css" href="<%=basePath %>assets/css/bootstrap-table.min.css" rel="stylesheet">
<link type="text/css" href="<%=basePath %>assets/css/bootstrap-responsive.min.css" rel="stylesheet">
<link type="text/css" href="<%=basePath %>assets/css/jquery-ui.min.css" rel="stylesheet">
<!-- Page CSS -->		
<link href="<%=basePath %>assets/css/style.css" rel="stylesheet" />
<link href="<%=basePath %>assets/css/add-ons.min.css" rel="stylesheet" /> 

<!--[if lte IE 8]>
<script src="<%=basePath %>assets/vendor/js/jquery-1.9.1.min.js"></script>
<![endif]-->   
<script src="<%=basePath %>assets/vendor/js/jquery.min.js"></script>
<script src="<%=basePath %>assets/vendor/js/jquery-migrate-1.2.1.min.js"></script>
<script src="<%=basePath %>assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Theme JS -->		
<script src="<%=basePath %>assets/js/jquery.mmenu.min.js"></script>
<script src="<%=basePath %>assets/js/core.min.js"></script>  
<script src="<%=basePath %>assets/js/bootstrap-table.min.js" type="text/javascript"></script>
<script src="<%=basePath %>assets/js/bootstrap-table-zh-CN.min.js" type="text/javascript"></script>
<script src="<%=basePath %>assets/js/jquery-ui.min.js" type="text/javascript"></script>     
<script src="<%=basePath %>js/bootstrap-datepicker.js" type="text/javascript"></script> 
 </head>
       
     <body>
		<!-- 表格上方 检索条件 -->
	<div id="toolbar" style="margin-bottom: 15px;">
		<input type="text" id="queryKey" placeholder="用户姓名或用户身份证" style="height: 40px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" ><i class="icon-search icon-2x" title="搜索" onclick="search()"> </i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
		<div style="height: 900px;">
			<table id="table" ></table>
		</div>
	
	<div id="edit">
		 <p><span style="font-family: '微软雅黑';font-size: 18px;">序列号：</span><input type="text" id="u_id" readonly="readonly" /></p>		
		 <p><span style="font-family: '微软雅黑';font-size: 18px;">证件号：</span><input type="text" id="card" readonly="readonly" /></p>		
		 <p><span style="font-family: '微软雅黑';font-size: 18px;">用户姓名：</span><input type="text" id="username"/></p>
		 <p><span style="font-family: '微软雅黑';font-size: 18px;">注册时间：</span><input type="text" id="regtime" readonly="readonly" /></p>
    	 <p><span style="font-family: '微软雅黑';font-size: 18px;">手机号：</span><input type="text" id="phone"/></p>
    	 <p><span style="font-family: '微软雅黑';font-size: 18px;">家庭住址：</span><input type="text" id="address"/></p>
	</div>	
 	</body>	
 		<script src="<%=basePath %>houtaijs/MyJs/userMession.js"></script>	
</html>