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
    
    <title>外出登记表新</title>
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
	
	<script type="text/javascript" src="<%=path %>/FRAMEWORK/My97DatePicker/WdatePicker.js"></script>
	
	<script type="text/javascript" src="<%=path %>/FRAMEWORK/js/myjs.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/FRAMEWORK/css/mycss.css">

	<script type="text/javascript">
	$(function(){
		$("#sele option[value='"+${page.size}+"']").attr("selected",true);
		$("#eidtASubjectWindow1").show();
		$('#tt').show();
	});
	
	function update(u0,u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16,u17,u18,u19,u20,u21,u22,u23,u24,u25,u26,u27,u28,u29,u30,u31,u32,u33,u34,u35,u36,u37,u38,u39,u40,u41,u42,u43,u44,u45,u46,u47,u48,u49){
		$('#u').window('open');
		$('#u_0').val(u0);
		$('#u_1').val(u1);
		$('#u_2').val(u2);
		$('#u_3').val(u3);
		$('#u_4').val(u4);
		$('#u_5').val(u5);
		$('#u_6').val(u6);
		$('#u_7').val(u7);
		$('#u_8').val(u8);
		$('#u_9').val(u9);
		$('#u_10').val(u10);
		$('#u_11').val(u11);
		$('#u_12').val(u12);
		$('#u_13').val(u13);
		$('#u_14').val(u14);
		$('#u_15').val(u15);
		$('#u_16').val(u16);
		$('#u_17').val(u17);
		$('#u_18').val(u18);
		$('#u_19').val(u19);
		$('#u_20').val(u20);
		$('#u_21').val(u21);
		$('#u_22').val(u22);
		$('#u_23').val(u23);
		$('#u_24').val(u24);
		$('#u_25').val(u25);
		$('#u_26').val(u26);
		$('#u_27').val(u27);
		$('#u_28').val(u28);
		$('#u_29').val(u29);
		$('#u_30').val(u30);
		$('#u_31').val(u31);
		$('#u_32').val(u32);
		$('#u_33').val(u33);
		$('#u_34').val(u34);
		$('#u_35').val(u35);
		$('#u_36').val(u36);
		$('#u_37').val(u37);
		$('#u_38').val(u38);
		$('#u_39').val(u39);
		$('#u_40').val(u40);
		$('#u_41').val(u41);
		$('#u_42').val(u42);
		$('#u_43').val(u43);
		$('#u_44').val(u44);
		$('#u_45').val(u45);
		$('#u_46').val(u46);
		$('#u_47').val(u47);
		$('#u_48').val(u48);
		$('#u_49').val(u49);
	}
	function page(no,cz){
		var num1=$('#page').val();
		if(cz==1){//上下页
			$('#page').val(num1*1+no*1);
		}else if(cz==2){//首末页
			$('#page').val(no);
		}else{
		}
		if($('#page').val()*1<1){
			$('#page').val(1);
		}else if($('#page').val()*1>${page.pageMax}*1){
			$('#page').val(${page.pageMax});
		}
		$('#f1').submit();
	}
	
	</script>
	
  </head>
  
  <body>
    
    <div class="easyui-panel" title="外出登记表新" style="width:100%;padding: 5px;display: none;" data-options="tools:'#tt'">
    
    <div class="kscx">
   		<div class="inp">
	    	<form id="ks" action="<%=path %>/outRegister!queryOfFenye" method="post">
	    		<div>
		    		<div>
			    		登记开始日期：<input name="dates" id="d4311" class="Wdate" type="text" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'d4312\')}'})" value="${dates }"/>
		    		</div>
		    		<div>
		    			登记结束日期：<input name="datee" id="d4312" class="Wdate" type="text" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'d4311\')}'})" value="${datee }"/>
		    		</div>
	    		</div>
	    		<div>
		    		<div>
			    		编号:<input name="id" type="text" value="${id }"/>
		    		</div>
	    			<div>
	    				分拨点：<input name="fbdName" type="text" value="${fbdName }"/>
	    			</div>
	    		</div>
	    		<div>
		    		<div>
			    		区域：<input name="area" type="text" value="${area }"/>
		    		</div>
	    			<div>
	    				跟进人：<input name="itman" type="text" value="${itman }"/>
	    			</div>
	    		</div>
	    	</form>
   		</div>
   		<div  class="btn">
   			<input type="submit" value="查询" onclick="$('.kscx .inp form').submit();"/>
   		</div>
   		<div style="clear:both;"></div>
    </div>
    
    <div style="margin-bottom: 5px;">
	    <table border="1" id="eidtASubjectWindow1">
	    <tr>
	    	<th>编号</th>
	    	<th>分拨点</th>
	    	<th>区域</th>
	    	<th>登记日期</th>
	    	<th>联系人/电话</th>
	    	<th>概述</th>
	    	<th>跟进人</th>
	    	<th>申购邮件</th>
	    	<th>完成情况</th>
	    	<th>计划时间</th>
	    	<th>实际时间</th>
	    	<th>操作</th>
	    </tr>
	    <c:forEach items="${outs}" var="o">
	    <tr>
			<td width="">${o.OId}</td>
			<td width="">${o.OFbd }</td>
			<td width="">${o.OArea }</td>
			<td width=""><fmt:formatDate value="${o.ODjrq }" pattern="yyyy/MM/dd" /></td>
			<td width="">${o.OLxr }</td>
			<td width="">${o.OGs }</td>
			<td width="">${o.OGjr }</td>
			<td width="">${o.OSgyj }</td>
			<td width="">${o.OWcqk }</td>
			<td width=""><fmt:formatDate value="${o.OJhsj }" pattern="yyyy/MM/dd" /></td>
			<td width=""><fmt:formatDate value="${o.OSjsj }" pattern="yyyy/MM/dd" /></td>
			<td width="5%" align="center">
				<a onclick="update('${o.OId}','${o.OFbd}','${o.OArea}','<fmt:formatDate value="${o.ODjrq}" pattern="yyyy-MM-dd" />','${o.ODjr}',
				'${o.OLxr}','${o.OFbdDz}','${o.OGs}','${o.OXySxtSl}','${o.OXySxtZt}','${o.OXyJkzjZt}','${o.OXyJkzjZh}',
				'${o.OKdh}','${o.OPass}','<fmt:formatDate value="${o.OAzsj}" pattern="yyyy-MM-dd" />','<fmt:formatDate value="${o.ODqsj}" pattern="yyyy-MM-dd" />','${o.OWlQy}','${o.OWlGz}','${o.OJkQy}',
				'${o.OJkAz}','${o.OJkHz}','${o.OJkWx}','${o.ODdSl}','<fmt:formatDate value="${o.ODdSj}" pattern="yyyy-MM-dd" />','${o.OZyxz}','${o.OXgSxtSl}',
				'${o.OXgSxtXh}','${o.OXgJkzjSl}','${o.OXgJkzjXh}','${o.OXgXc}','${o.OXgZj}','${o.OXgdwSxt}','${o.OXgdwJkzj}',
				'${o.OXgdwXc}','${o.OXgdwZj}','${o.OYwcSxt}','${o.OYwcJkzj}','${o.OYwcXc}','${o.OYwcZj}','<fmt:formatDate value="${o.OYwcSj}" pattern="yyyy-MM-dd" />',
				'${o.OWwcSxt}','${o.OWwcJkzj}','${o.OWwcXc}','${o.OWwcZj}','<fmt:formatDate value="${o.OWwcSj}" pattern="yyyy-MM-dd" />','${o.OGjr}','${o.OSgyj}',
				'${o.OWcqk}','<fmt:formatDate value="${o.OJhsj }" pattern="yyyy-MM-dd" />','<fmt:formatDate value="${o.OSjsj }" pattern="yyyy-MM-dd" />')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" title="修改"></a>
				<a href="<%=path %>/outRegister!delete?id=${o.OId}" onclick="return confirm('确定删除吗?')" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-delete'" title="删除"></a>
			</td>
	    </tr>
	    </c:forEach>
	    </table>
	</div>
	
	<div class="easyui-panel" style="padding:5px;width: 100%;display: none;">
		<form id="f1" action="<%=path %>/outRegister!queryOfFenye?id=${id }&fbdName=${fbdName }&area=${area }&itman=${itman }&dates=${dates }&datee=${datee }" method="post">
		<select id="sele" style="float: left;margin-top: 3px;margin-left: 5px;" name="page.size" onchange="$('#f1').submit();">
			<option value="10">10</option>
			<option value="15">15</option>
		</select>
		
		<span style="float: left;margin-left: 5px;">
		<span style="color: #A5A5A5;">|</span>
		<a onclick="page(1,2)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-last'" title="首页"></a>
		<a onclick="page(-1,1)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-l'" title="上一页"></a>
		<span style="color: #A5A5A5;">|</span>
		</span>
		
		<span style="float: left;margin-top: 3px;margin-left: 5px;">
		<input id="page" name="page.pageOn" type="number" style="width: 50px;height: 20px;" value="${page.pageOn }" min="1" max="${page.pageMax }" onchange="$('#f1').submit();"/>
		</span>
		
		<span style="float: left;margin-top: 5px;margin-left: 5px;">/${page.pageMax }</span>
		
		<span style="float: left;margin-left: 5px;">
		<span style="color: #A5A5A5;">|</span>
		<a onclick="page(1,1)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-n'" title="下一页"></a>
		<a onclick="page('${page.pageMax}',2)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-next'" title="末页"></a>
		</span>
		</form>
	</div>
	</div>
	
	<div id="u" class="easyui-window" title="修改" data-options="modal:true,closed:true" style="width:890px;height:auto;padding:10px;display: none;">
		<form action="<%=path %>/outRegister!update" method="post">
			<input id="u_0" name="o.OId" type="text" style="display:none"/>
			分拨点：<input id="u_1" name="o.OFbd" type="text" style="width:80px;"/>&nbsp;&nbsp;
			区域：<input id="u_2" name="o.OArea" type="text" style="width:80px;"/>&nbsp;&nbsp;
			登记日期：<input id="u_3" name="o.ODjrq" type="date" style="width:130px;"/>&nbsp;&nbsp;
			登记人：<input id="u_4" name="o.ODjr" type="text" style="width:80px;"/>&nbsp;&nbsp;
			联系人/电话：<input id="u_5" name="o.OLxr" type="text" style="width:150px;"/><br/><br/>
			分拨点地址：<input id="u_6" name="o.OFbdDz" type="text" style="width:387px;"/>&nbsp;&nbsp;
			概述：<input id="u_7" name="o.OGs" type="text" style="width:330px;"/>&nbsp;&nbsp;<br/><br/>
			现有设备：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input id="u_8" name="o.OXySxtSl" type="number" style="width:80px;"/>&nbsp;&nbsp;
			摄像头状态：<input id="u_9" name="o.OXySxtZt" type="text" style="width:80px;"/>&nbsp;&nbsp;
			监控主机状态：<input id="u_10" name="o.OXyJkzjZt" type="text" style="width:80px;"/>&nbsp;&nbsp;
			监控主机账户：<input id="u_11" name="o.OXyJkzjZh" type="text" style="width:168px;"/><br/><br/>
			宽带情况：&nbsp;&nbsp;&nbsp;&nbsp;
			宽带号：<input id="u_12" name="o.OKdh" type="text" style="width:150px;"/>&nbsp;&nbsp;
			宽带密码：<input id="u_13" name="o.OPass" type="text" style="width:80px;"/>&nbsp;&nbsp;
			安装时间：<input id="u_14" name="o.OAzsj" type="date" style="width:130px;"/>&nbsp;&nbsp;
			到期时间：<input id="u_15" name="o.ODqsj" type="date" style="width:132px;"/><br/><br/>
			&nbsp;网&nbsp;络&nbsp;类：&nbsp;&nbsp;&nbsp;&nbsp;
			迁移：<input id="u_16" name="o.OWlQy" type="text" style="width:331px;"/>&nbsp;&nbsp;
			故障：<input id="u_17" name="o.OWlGz" type="text" style="width:340px;"/><br/><br/>
			&nbsp;监&nbsp;控&nbsp;类：&nbsp;&nbsp;&nbsp;&nbsp;
			迁移：<input id="u_18" name="o.OJkQy" type="text" style="width:110px;"/>&nbsp;&nbsp;
			安装：<input id="u_19" name="o.OJkAz" type="text" style="width:180px;"/>&nbsp;&nbsp;
			换装：<input id="u_20" name="o.OJkHz" type="text" style="width:110px;"/>&nbsp;&nbsp;
			维修：<input id="u_21" name="o.OJkWx" type="text" style="width:175px;"/><br/><br/>
			定点情况：&nbsp;&nbsp;&nbsp;&nbsp;
			定点数量：<input id="u_22" name="o.ODdSl" type="number" style="width:80px;"/>&nbsp;&nbsp;
			定点时间：<input id="u_23" name="o.ODdSj" type="date" style="width:130px;"/>&nbsp;&nbsp;
			支援协助：<input id="u_24" name="o.OZyxz" type="text" style="width:340px;"/><br/><br/>
			需购设备：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input id="u_25" name="o.OXgSxtSl" type="number" style="width:42px;"/>&nbsp;&nbsp;
			摄像头型号：<input id="u_26" name="o.OXgSxtXh" type="text" style="width:70px;"/>&nbsp;&nbsp;
			监控主机数量：<input id="u_27" name="o.OXgJkzjSl" type="number" style="width:42px;"/>&nbsp;&nbsp;
			监控主机型号：<input id="u_28" name="o.OXgJkzjXh" type="text" style="width:70px;"/>&nbsp;&nbsp;
			线材：<input id="u_29" name="o.OXgXc" type="number" style="width:43px;"/>&nbsp;&nbsp;
			支架：<input id="u_30" name="o.OXgZj" type="number" style="width:43px;"/><br/><br/>
			到位情况：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input id="u_31" name="o.OXgdwSxt" type="number" style="width:90px;"/>&nbsp;&nbsp;
			监控主机数量：<input id="u_32" name="o.OXgdwJkzj" type="number" style="width:90px;"/>&nbsp;&nbsp;
			线材数量：<input id="u_33" name="o.OXgdwXc" type="number" style="width:90px;"/>&nbsp;&nbsp;
			支架数量：<input id="u_34" name="o.OXgdwZj" type="number" style="width:90px;"/><br/><br/>
			&nbsp;已&nbsp;完&nbsp;成：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input id="u_35" name="o.OYwcSxt" type="number" style="width:60px;"/>&nbsp;&nbsp;
			监控主机数量：<input id="u_36" name="o.OYwcJkzj" type="number" style="width:60px;"/>&nbsp;&nbsp;
			线材数量：<input id="u_37" name="o.OYwcXc" type="number" style="width:60px;"/>&nbsp;&nbsp;
			支架数量：<input id="u_38" name="o.OYwcZj" type="number" style="width:60px;"/>&nbsp;&nbsp;
			更新时间：<input id="u_39" name="o.OYwcSj" type="date" style="width:130px;"/><br/><br/>
			&nbsp;未&nbsp;完&nbsp;成：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input id="u_40" name="o.OWwcSxt" type="number" style="width:60px;"/>&nbsp;&nbsp;
			监控主机数量：<input id="u_41" name="o.OWwcJkzj" type="number" style="width:60px;"/>&nbsp;&nbsp;
			线材数量：<input id="u_42" name="o.OWwcXc" type="number" style="width:60px;"/>&nbsp;&nbsp;
			支架数量：<input id="u_43" name="o.OWwcZj" type="number" style="width:60px;"/>&nbsp;&nbsp;
			更新时间：<input id="u_44" name="o.OWwcSj" type="date" style="width:130px;"/><br/><br/>
			跟进人：<input id="u_45" name="o.OGjr" type="text" style="width:60px;"/>&nbsp;&nbsp;
			申购邮件：<input id="u_46" name="o.OSgyj" type="text" style="width:60px;"/>&nbsp;&nbsp;
			完成情况：<input id="u_47" name="o.OWcqk" type="text" style="width:117px;"/>&nbsp;&nbsp;
			计划时间：<input id="u_48" name="o.OJhsj" type="date" style="width:130px;"/>&nbsp;&nbsp;
			实际时间：<input id="u_49" name="o.OSjsj" type="date" style="width:130px;"/><br/><br/>
			<div style="width:865px;text-align: center;">
				<input type="submit" value="提 交" style="width:100px;height:30px;"/>
			</div>
		</form>
	</div>
	
	<div id="a" class="easyui-window" title="添加" data-options="modal:true,closed:true" style="width:890px;height:auto;padding:10px;display: none;">
		<form action="<%=path %>/outRegister!add" method="post">
			分拨点：<input name="o.OFbd" type="text" style="width:80px;"/>&nbsp;&nbsp;
			区域：<input name="o.OArea" type="text" style="width:80px;"/>&nbsp;&nbsp;
			登记日期：<input name="o.ODjrq" type="date" style="width:130px;"/>&nbsp;&nbsp;
			登记人：<input name="o.ODjr" type="text" style="width:80px;"/>&nbsp;&nbsp;
			联系人/电话：<input name="o.OLxr" type="text" style="width:150px;"/><br/><br/>
			分拨点地址：<input name="o.OFbdDz" type="text" style="width:387px;"/>&nbsp;&nbsp;
			概述：<input name="o.OGs" type="text" style="width:330px;"/>&nbsp;&nbsp;<br/><br/>
			现有设备：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input name="o.OXySxtSl" type="number" style="width:80px;"/>&nbsp;&nbsp;
			摄像头状态：<input name="o.OXySxtZt" type="text" style="width:80px;"/>&nbsp;&nbsp;
			监控主机状态：<input name="o.OXyJkzjZt" type="text" style="width:80px;"/>&nbsp;&nbsp;
			监控主机账户：<input name="o.OXyJkzjZh" type="text" style="width:168px;"/><br/><br/>
			宽带情况：&nbsp;&nbsp;&nbsp;&nbsp;
			宽带号：<input name="o.OKdh" type="text" style="width:150px;"/>&nbsp;&nbsp;
			宽带密码：<input name="o.OPass" type="text" style="width:80px;"/>&nbsp;&nbsp;
			安装时间：<input name="o.OAzsj" type="date" style="width:130px;"/>&nbsp;&nbsp;
			到期时间：<input name="o.ODqsj" type="date" style="width:132px;"/><br/><br/>
			&nbsp;网&nbsp;络&nbsp;类：&nbsp;&nbsp;&nbsp;&nbsp;
			迁移：<input name="o.OWlQy" type="text" style="width:331px;"/>&nbsp;&nbsp;
			故障：<input name="o.OWlGz" type="text" style="width:340px;"/><br/><br/>
			&nbsp;监&nbsp;控&nbsp;类：&nbsp;&nbsp;&nbsp;&nbsp;
			迁移：<input name="o.OJkQy" type="text" style="width:110px;"/>&nbsp;&nbsp;
			安装：<input name="o.OJkAz" type="text" style="width:180px;"/>&nbsp;&nbsp;
			换装：<input name="o.OJkHz" type="text" style="width:110px;"/>&nbsp;&nbsp;
			维修：<input name="o.OJkWx" type="text" style="width:175px;"/><br/><br/>
			定点情况：&nbsp;&nbsp;&nbsp;&nbsp;
			定点数量：<input name="o.ODdSl" type="number" style="width:80px;"/>&nbsp;&nbsp;
			定点时间：<input name="o.ODdSj" type="date" style="width:130px;"/>&nbsp;&nbsp;
			支援协助：<input name="o.OZyxz" type="text" style="width:340px;"/><br/><br/>
			需购设备：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input name="o.OXgSxtSl" type="number" style="width:42px;"/>&nbsp;&nbsp;
			摄像头型号：<input name="o.OXgSxtXh" type="text" style="width:70px;"/>&nbsp;&nbsp;
			监控主机数量：<input name="o.OXgJkzjSl" type="number" style="width:42px;"/>&nbsp;&nbsp;
			监控主机型号：<input name="o.OXgJkzjXh" type="text" style="width:70px;"/>&nbsp;&nbsp;
			线材：<input name="o.OXgXc" type="number" style="width:43px;"/>&nbsp;&nbsp;
			支架：<input name="o.OXgZj" type="number" style="width:43px;"/><br/><br/>
			到位情况：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input name="o.OXgdwSxt" type="number" style="width:90px;"/>&nbsp;&nbsp;
			监控主机数量：<input name="o.OXgdwJkzj" type="number" style="width:90px;"/>&nbsp;&nbsp;
			线材数量：<input name="o.OXgdwXc" type="number" style="width:90px;"/>&nbsp;&nbsp;
			支架数量：<input name="o.OXgdwZj" type="number" style="width:90px;"/><br/><br/>
			&nbsp;已&nbsp;完&nbsp;成：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input name="o.OYwcSxt" type="number" style="width:60px;"/>&nbsp;&nbsp;
			监控主机数量：<input name="o.OYwcJkzj" type="number" style="width:60px;"/>&nbsp;&nbsp;
			线材数量：<input name="o.OYwcXc" type="number" style="width:60px;"/>&nbsp;&nbsp;
			支架数量：<input name="o.OYwcZj" type="number" style="width:60px;"/>&nbsp;&nbsp;
			更新时间：<input name="o.OYwcSj" type="date" style="width:130px;"/><br/><br/>
			&nbsp;未&nbsp;完&nbsp;成：&nbsp;&nbsp;&nbsp;&nbsp;
			摄像头数量：<input name="o.OWwcSxt" type="number" style="width:60px;"/>&nbsp;&nbsp;
			监控主机数量：<input name="o.OWwcJkzj" type="number" style="width:60px;"/>&nbsp;&nbsp;
			线材数量：<input name="o.OWwcXc" type="number" style="width:60px;"/>&nbsp;&nbsp;
			支架数量：<input name="o.OWwcZj" type="number" style="width:60px;"/>&nbsp;&nbsp;
			更新时间：<input name="o.OWwcSj" type="date" style="width:130px;"/><br/><br/>
			跟进人：<input name="o.OGjr" type="text" style="width:60px;"/>&nbsp;&nbsp;
			申购邮件：<input name="o.OSgyj" type="text" style="width:60px;"/>&nbsp;&nbsp;
			完成情况：<input name="o.OWcqk" type="text" style="width:117px;"/>&nbsp;&nbsp;
			计划时间：<input name="o.OJhsj" type="date" style="width:130px;"/>&nbsp;&nbsp;
			实际时间：<input name="o.OSjsj" type="date" style="width:130px;"/><br/><br/>
			<div style="width:865px;text-align: center;">
				<input type="submit" value="提 交" style="width:100px;height:30px;"/>
			</div>
		</form>
	</div>
	
	<div id="tt" style="display: none;">
		<a class="icon-add" onclick="$('#a').window('open')" style="margin-left: 10px;" title="添加"></a>
	</div>
  </body>
</html>
