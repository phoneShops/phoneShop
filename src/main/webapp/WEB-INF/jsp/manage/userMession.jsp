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
		
    	 <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css"  type="text/css">
		<!-- jQuery and Modernizr-->
	   <script src="<%=basePath %>js/jquery-2.1.1.js"></script>
	
	   <!-- Core JavaScript Files -->  	 
       <script src="<%=basePath %>js/bootstrap.min.js"></script>
		
	 	<script src="<%=basePath %>houtaijs/MyJs/userMession.js"></script>	
	 	
	 	
	 	
	 	
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
          <%-- <%@ include file="tag.jsp"%> --%>
	 	 
    
    
    <body>
		<div style="height: 900px;">
			<table id="table" ></table>
		</div>
		<!-- 表格上方 检索条件 -->
	<div id="toolbar" style="margin-bottom: 15px;">
		<input type="text" id="queryKey" placeholder="用户姓名或用户ID" style="height: 40px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" ><i class="icon-search icon-2x" title="搜索" onclick="search()"> </i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<!-- 新增用户 -->
		<a href="#" ><i class="icon-plus-sign icon-2x" title="新增员工" onclick="add()"> </i></a>
	
	</div>
	
	<div id="add"> 
    	 <p><span style="font-family: '微软雅黑';font-size: 18px;">员工姓名：</span><input type="text" id="repairName"/></p>
    	 <p><span style="font-family: '微软雅黑';font-size: 18px;">&nbsp;&nbsp;&nbsp;手机号：</span><input type="text" id="phone"/></p>
    	 <p><span style="font-family: '微软雅黑';font-size: 18px;">小时工资：</span><input type="text" id="salary"/></p>
    	  <p><span style="font-family: '微软雅黑';font-size: 18px;">&nbsp;&nbsp;&nbsp;月工资：</span><input type="text" id="monthlyWage"/></p>
    	 <p><span style="font-family: '微软雅黑';font-size: 18px;">身份证号：</span><input type="text" id="IDCard"/></p>
	</div>
	
	<div id="edit">
		 <p><span style="font-family: '微软雅黑';font-size: 18px;">员工编号：</span><input type="text" id="repairmanNo" readonly="readonly" /></p>
		 <p><span style="font-family: '微软雅黑';font-size: 18px;">员工姓名：</span><input type="text" id="repairmanName"/></p>
    	 <p><span style="font-family: '微软雅黑';font-size: 18px;">&nbsp;&nbsp;&nbsp;手机号：</span><input type="text" id="tel"/></p>
    	 <p><span style="font-family: '微软雅黑';font-size: 18px;">小时工资：</span><input type="text" id="hourlyPay"/></p>
    	  <p><span style="font-family: '微软雅黑';font-size: 18px;">&nbsp;&nbsp;&nbsp;月工资：</span><input type="text" id="monthlyWages"/></p>
    	 <p><span style="font-family: '微软雅黑';font-size: 18px;">身份证号：</span><input type="text" id="IDNumber"/></p>
	</div>	
 	</body>	
</html>