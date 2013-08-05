<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="<%=request.getContextPath() %>/statics/css/bootstrap.css" rel="stylesheet" />
<script language="JavaScript" src="<%=request.getContextPath() %>/statics/js/jquery-1.4.4.js"></script>
<title>接口调用注册</title>
</head>
<body style="padding-top:5px" class="span15" onload="loadElement()">
<form action="./manage.do?method=addWhiteListApp" method="post">
<div class="span15">
<table class="left_bordered-table"  id="mytable" >
    <tr>
    	<td colspan="2"><font size="5">接口调用信息</td>
	<tr>	
		<td>应用名:</td>
		<td><input type="text" id="appName" name="appName" value="${po.appName}" style="width: 100%;" /></td>
	</tr>
	
	<tr>	
		<td>调用应用:</td>
		<td><input type="text" id="refApp" name="refApp" value="${po.refApp}" style="width: 100%;"></td>
	</tr>
	
	<tr>	
		<td>接口信息:</td>
		<td><input type="text" id="interfaceInfo" name="interfaceInfo" value="${po.interfaceInfo}" style="width: 100%;"></td>
	</tr>
	
	<tr>	
		<td>高峰期qps预估:</td>
		<td><input type="text" id="estimateQps" name="estimateQps" value="${po.estimateQps}" style="width: 100%;"></td>
	</tr>
	
	<tr>	
		<td>依赖级别:</td>
		<td>
			<input type="radio" name="strong" value="strong" />&nbsp;Strong&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" name="strong" value="weak" />&nbsp;Weak&nbsp;
		</td>
	</tr>
	
	<tr>	
		<td>描述:</td>
		<td><textarea id="remark" name="remark"  style="width: 100%;" ></textArea></td>
	</tr>
	
	
	<tr>
		<td colspan="2">
			<input type="hidden" id="id" name="id" value="${po.id}" />
			<input type="button" value=" 更  新 " onclick="update()" /> &nbsp;&nbsp;
			<input type="button" value=" 关  闭 " onclick="closeW()" />
		</td>
	</tr>

</table>
</div>

<script type="text/javascript">

function loadElement() {
	var strong = "${po.strong}";
	var strongs = document.getElementsByName("strong");
	
	for (i=0; i<strongs.length; i++) {
		if (strongs[i].value == strong) {
			strongs[i].checked = true;
		}
	}
	
	document.getElementById('remark').value = "${po.remark}"; 
}

function update() {	
	var strong;
	var strongs =   document.getElementsByName("strong");
	for (i=0; i<strongs.length; i++) {
		if (strongs[i].checked) {
			strong = strongs[i].value;
		}
	}
	
	var id = $("#id").attr("value");
	var app_name = $("#appName").attr("value");
	var interface_info = $("#interfaceInfo").attr("value");
	var ref_app = $("#refApp").attr("value");
	var estimate_qps = $("#estimateQps").attr("value");
	var remark = $("#remark").attr("value");
	
	if (app_name==null || app_name=="" || interface_info==null || interface_info=="" || ref_app == null || ref_app == "" || estimate_qps == null || estimate_qps =="")
	{
		alert("应用名、接口信息、预估qps均不能为空!");
		return;
	}
	
	var patrn=/^[0-9]{1,20}$/; 
	if (!patrn.exec(estimate_qps)) {
		alert("预估qps必须为数字");
		return;
	}
	
	var urlDest = "./invokeManage.do?method=updateInterfaceInvoke"
    var parameters = "id=" + id + "&appName=" + app_name + "&interfaceInfo=" + interface_info + "&refApp=" + ref_app + "&estimateQps=" + estimate_qps + "&strong=" + strong + "&remark=" + remark;
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
    			message = "配置已存在，更新失败.";	
    		} else {
    			message = "更新成功.";
    		}
    		alert(message);
    	}
   	});
	
}


function closeW() {
	window.close();
	self.opener.location.reload();  
}



</script>
</body>
</html>