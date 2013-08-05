<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="<%=request.getContextPath() %>/statics/css/bootstrap.css" rel="stylesheet" />
<script language="JavaScript" src="<%=request.getContextPath() %>/statics/js/jquery-1.4.4.js"></script>
<title>新增应用限流</title>
</head>
<body style="padding-top:5px" class="span15">
<form action="./manage.do?method=addWhiteListApp" method="post">
<div class="span15">
<table class="left_bordered-table"  id="mytable" >
    <tr>
    	<td colspan="2"><font size="5">新增应用限流</td>
	<tr>	
		<td>应用名:</td>
		<td><input type="text" id="appName" name="appName" value="" style="width: 100%;"></td>
	</tr>
	
	<tr>	
		<td>限流应用:</td>
		<td><input type="text" id="flowApp" name="flowApp" value="" style="width: 100%;"></td>
	</tr>
	
	<tr>	
		<td>限流阀值:</td>
		<td><input type="text" id="limitFlow" name="limitFlow" value="" style="width: 100%;"></td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="button" value=" 新  增 " onclick="add()" /> &nbsp;&nbsp;
			<input type="button" value=" 关  闭 " onclick="closeW()" />
		</td>
	</tr>

</table>
</div>

<script type="text/javascript">

function add() {	
	var app_name = $("#appName").attr("value");
	var flow_app = $("#flowApp").attr("value");
	var limit_flow = $("#limitFlow").attr("value");
	var strategy = "${strategy}";
	if (app_name==null || app_name=="" ||  flow_app==null || flow_app=="" || limit_flow==null || limit_flow=="") {
		alert("应用名、限流应用与限流线程数均不能为空");
		return;
	}
	var patrn=/^[0-9]{1,20}$/; 
	if (!patrn.exec(limit_flow)) {
		alert("限流线程数必须为数字");
		return;
	}
    var urlDest = "manage.do?method=addFlowControlApp"
    var parameters = "appName=" + app_name + "&flowApp=" + flow_app + "&limitFlow=" + limit_flow + "&strategy=" + strategy;
    $.ajax({
    	url: urlDest,
    	async:false,
    	type: "POST",
    	dataType: "String",
    	data: parameters,
    	cache: false,
    	success: function(data) {
    		var message;
    		if (data == "fail") {
    			message = "权限不够或者配置已经存在.";	
    		} else {
    			message = "添加成功,限流应用共生成" + data + "个ip" + ".是否继续添加?";
    		}
    		if (!confirm(message)) {
    			window.close();
    			self.opener.location.reload();  
    		} else {
    			clear();
    		}

    	}
   	});
}

function closeW() {
	window.close();
	self.opener.location.reload();  
}

function clear() {
	$("#appName").val("");
	$("#flowApp").val("");
	$("#limitFlow").val("");
}


</script>
</body>
</html>