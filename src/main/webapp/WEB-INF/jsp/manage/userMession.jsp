<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>用户管理</title>  
        
          <%@include file="/WEB-INF/jsp/manage/tag.jsp"%>
        
      <%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
		%>      
		
	
		
    </head>
    
    <body>
		<div style="height: 900px;">
			<table id="table" ></table>
		</div>
		<!-- 表格上方 检索条件 -->
	<div id="toolbar" style="margin-bottom: 15px;">
		<input type="text" id="queryKey" placeholder="用户姓名或用户ID" style="height: 40px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" ><i class="icon-search icon-2x" title="搜索" onclick="search()"> </i></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<!-- 新增用户 -->
		<!-- <a href="#" ><i class="icon-plus-sign icon-2x" title="新增员工" onclick="add()"> </i></a> -->
	
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
	<script type="text/javascript" src="<%=basePath %>houtaijs/MyJs/userMession.js"></script>
</html>