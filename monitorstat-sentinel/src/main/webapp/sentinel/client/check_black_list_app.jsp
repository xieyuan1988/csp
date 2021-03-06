<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="<%=request.getContextPath() %>/statics/css/bootstrap.css" rel="stylesheet" />
<script language="JavaScript" src="<%=request.getContextPath() %>/statics/js/jquery-1.4.4.js"></script>
<title>生效应用黑名单</title>
</head>
<body style="padding-top:5px" class="span15">
<form>
<table class="left_bordered-table"  id="mytable">
    <tr>
    	<td colspan="2"><font size="5">${self}&nbsp;生效应用黑名单</td>
    </tr>
    <tr>
    	<th>序号</th>
    	<th>黑名单应用</th>
    </tr>
	<c:forEach items="${ips}" var="ip" varStatus="stauts">
      <tr>
      	<td>${stauts.index+1} </td>  
      	<td align="center">${ip}</td>
	  </tr>
	 </c:forEach>
</table>

<script type="text/javascript">

function removeConfig(limitIp) {
	var ip = "${self}";
	var appName = "${appName}";
	
	if (confirm("确定向线上机器发送应用黑名单ip删除信息?")) {
		var urlDest = "alter.do?method=blackListAppRemove";
		var parameters = "ip=" + ip + "&limitIp=" + limitIp + "&appName=" + appName;
		$.ajax({
    		url: urlDest,
    		async:false,
    		type: "GET",
    		dataType: "String",
    		data: parameters,
    		cache: false,
    		success: function(data) {
    		
    		}
   		});
	}
	
	window.location.reload();
}

function addConfig() {
	var ip = "${self}";
	var appName = "${appName}";
	
	var limitIp = document.getElementById("new").value;
	var urlDest = "alter.do?method=blackListAppAdd";
	var parameters = "ip=" + ip + "&limitIp=" + limitIp + "&appName=" + appName;
	if (limitIp == null || limitIp == "") {
		alert("不能为空");
		return;
	}
	
	var pattern=/^[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}$/; 
	if (!pattern.exec(limitIp)) {
		alert("应用格式不正确");
		return;
	}
	
	$.ajax({
    		url: urlDest,
    		async:false,
    		type: "GET",
    		dataType: "String",
    		data: parameters,
    		cache: false,
    		success: function(data) {
    		
    		}
   		});
	
	window.location.reload();
}

</script>

</body>
</html>