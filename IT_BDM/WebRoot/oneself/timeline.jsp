<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>区部信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=path %>/FRAMEWORK/jquery-easyui/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/FRAMEWORK/jquery-easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/FRAMEWORK/jquery-easyui/demo/demo.css">
	<script type="text/javascript" src="<%=path %>/FRAMEWORK/jquery-easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/FRAMEWORK/jquery-easyui/jquery.easyui.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/FRAMEWORK/css/mycss.css">
	
  </head>
  
  <body style="padding-right: 40px;">
  	<div style="color: blue;font-weight: bold;">今天的时间轴:</div>
  	<br/>
	<table border="1">
	<c:forEach items="${tls}" var="tl">
	<tr>
		<td>${tl.tlTime }</td>
		<td>
			<c:if test="${tl.tlState=='查看' }">
				<span style="background-color: #00FF00;">
			</c:if>
			<c:if test="${tl.tlState=='添加' }">
				<span style="background-color: green;">
			</c:if>
			<c:if test="${tl.tlState=='删除' }">
				<span style="background-color: red;">
			</c:if>
			<c:if test="${tl.tlState=='修改' }">
				<span style="background-color: #FF00FF;">
			</c:if>
			${tl.tlState }
			</span>
		</td>
		<td>${tl.tlTableName }</td>
		<td>${tl.tlTableId }</td>	
	</tr>	
	</c:forEach>
	</table>
	
	
	    
  </body>
</html>