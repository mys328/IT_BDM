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
    
    <title>总部电脑统计</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<%=path %>/FRAMEWORK/jquery-easyui/themes/${theme }/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/FRAMEWORK/jquery-easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/FRAMEWORK/jquery-easyui/demo/demo.css">
	<script type="text/javascript" src="<%=path %>/FRAMEWORK/jquery-easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/FRAMEWORK/jquery-easyui/jquery.easyui.min.js"></script>
	
	<script type="text/javascript" src="<%=path %>/FRAMEWORK/js/myjs.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/FRAMEWORK/css/mycss.css">

	<script type="text/javascript">
	$(function(){
		$("#sel_dt option[value='${filtrate}']").attr("selected",true);
		$("#sele option[value='"+${page.size}+"']").attr("selected",true);
		$("#eidtASubjectWindow1").show();
		$('#tt').show();
	});
	function queryDetails(section){
		var path="<%=path%>/computer!queryOfFenye?cz=no&id=&section="+section;
		//console.log(path);
		window.location.href=path;
	}
	function xiazai(){
		var path ="<%=path %>/computerCount!exportExc";
		$.post(
			path,
			function(){
				//console.log(result);
				window.location.href="<%=path%>/files/export/zmz/管理电脑统计.xls";
			}
		);
	}
	</script>
	
  </head>
  <body>
 	<div style="text-align: center;margin-right: 17px;color: white;background-color:#17B4FF;padding: 5px;font-size: 14px;font-weight:bold;">电脑登记统计</div>
 	
 	
	<div style="background-color:white;margin-bottom: 5px;padding: 5px;border: 1px solid #224466;margin-right: 17px;margin-top: 10px;">
    	<input type= "button" onclick="xiazai()" value="导出" />
    </div>
    <div style="margin-bottom: 5px;">
	    
	    
  	<div style="margin-right: 17px;">
    <table border="1" id="" style="font-size: 12px;">
	    <tr>
	    	<th>序号</th>
	    	<th>部门</th>
	    	<th>电脑数量</th>
	    	<th>操作</th>
	    </tr>
	    <c:forEach items="${counts}" var="count" varStatus="status">
	    <c:choose>
	    	<c:when test="${status.index %2 !=0}">
	    		<tr class="odd_even_tr">
	    	</c:when>
	    	<c:otherwise>
	    		<tr>
	    	</c:otherwise>
	    </c:choose>
	    	<td>${status.index+1 }</td>
	    	<td>${count.section }</td>
	    	<td>${count.count }</td>
	    	<td>
				<a onclick="queryDetails('${count.section}')" class="easyui-linkbutton" title="查看详情">查看详情</a>
			</td>
			
	    </tr>
	    </c:forEach>
    </table>
	</div>
  	</div>
	
	
	
  </body>
</html>
