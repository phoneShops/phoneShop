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
	 	
<link rel="stylesheet" href="<%=basePath %>houtaicss/style.css" /> 
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


	<div class="place">
   		 <span>位置：</span>
   		 <ul class="placeul">
   	   	 	<li><a href="#">首页</a></li>
   			 <li><a href="#">图片列表</a></li>
   		 </ul>
    </div>   
     
    <div class="rightinfo">
   		 <div class="tools">
    		<ul class="toolbar">
       			 <li class="click"><span><img src="<%=basePath %>houtaiimages/t01.png" /></span></a>添加</li>
        		 <li class="click"><span><img src="<%=basePath %>houtaiimages/t02.png" /></span>修改</li>
                 <li><span><img src="<%=basePath %>houtaiimages/t03.png" /></span>删除</li>
                 <li><span><img src="<%=basePath %>houtaiimages/t04.png" /></span>统计</li>
           </ul>
        
        <ul class="toolbar1">
           <li><span><img src="<%=basePath %>houtaiimages/t05.png" /></span>设置</li>
        </ul>   
    </div>	
    
</div>
	
	<!-- 表格上方 检索条件 -->
	<div id="toolbar" style="margin-bottom: 15px;">
		<input type="text" id="queryKey" placeholder="请输入手机型号或者手机代码" style="height: 40px;" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		<a href="#"><i class="icon-search icon-2x" title="搜索" onclick="search()"> </i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	
	<div style="height: 900px;">
		<table id="table"></table>
	</div>
	
	<!-- 弹出框 -->
	<div id="edit">	
		<table id="table2"></table>
	</div>
	 

</body>
<script src="<%=basePath %>houtaijs/MyJs/productData.js"></script>	
</html>
