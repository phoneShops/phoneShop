<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%--   <%@ include file="top.jsp"%>
<%@ include file="left.jsp"%>
<%@ include file="index.jsp"%>
    --%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<title>Insert title here</title>
</head>


<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="<%=basePath %>ViewManage/toViewTop" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
    <frame src="<%=basePath %>ViewManage/toViewLeft" name="leftFrame" scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="<%=basePath %>ViewManage/toViewIndex" name="rightFrame" id="rightFrame" title="rightFrame" />
  </frameset>
</frameset>


<noframes>
	<body>
		浏览器不支持frame
	</body>
</noframes>
</html>