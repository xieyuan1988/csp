<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK" isELIgnored="false"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.taobao.csp.dataserver.Constants"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>实时监控系统</title>
<%@ include file="/time/common/base.jsp"%>
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/statics/css/bootstrap.css">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/statics/css/bootstrap-responsive.css">
<script type="text/javascript"	src="<%=request.getContextPath()%>/statics/js/jquery/jquery.min.js"></script>
<script type="text/javascript"		src="<%=request.getContextPath()%>/statics/js/bootstrap.js"></script>


<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/css/jquery-ui.css">
<script type="text/javascript"   src="<%=request.getContextPath()%>/statics/js/jquery/jquery-ui.js"></script>
			
<style type="text/css">
body {
	padding-top: 60px;
}
</style>

</head>
<body>
<%@include file="/header.jsp" %>
<div class="container-fluid">
<div class="row-fluid" style="text-align: center">
<div class="span12" id="page_nav"></div>
<script>
	$("#page_nav").load('<%=request.getContextPath()%>/page_nav.jsp', {urlPrefix:'<%=request.getContextPath()%>/app/detail/show.do?method=showIndex&appId=',appId: '${appInfo.appId}'});
</script>	
</div>
<div class="row-fluid">
<div class="span2">
<%@include file="/leftmenu.jsp" %>
</div>
<div class="span12">
<%--导航 --%>
			<%request.setAttribute("s_sperator", Constants.S_SEPERATOR);%>
			<c:forEach var="item" items="${fn:split(param.key,  s_sperator)}" varStatus="status">
				<c:if test="${status.index==1}">
					<c:set var="group" value="${item}"/>
				</c:if>
			</c:forEach>
<a href="<%=request.getContextPath()%>/index.jsp">实时首页</a> 
-><a href="<%=request.getContextPath()%>/app/detail/show.do?method=showIndex&appId=${appInfo.appId}">${appInfo.appName} </a>
-><a href="<%=request.getContextPath()%>/app/detail/tair/show.do?method=showIndex&appId=${appInfo.appId}"> Tair首页 </a>
-><a href="<%=request.getContextPath()%>/app/detail/tair/show.do?method=gotoHost&appId=${appInfo.appId}">主机列表 </a>
-><a href="<%=request.getContextPath()%>/app/detail/tair/show.do?method=gotoHostGroup&appId=${appInfo.appId}&ip=${param.ip}">${param.ip }  Tair分组列表 </a>
->${group} 命名空间和方法列表
<div class="row-fluid">
	<div class="span12">
		<table class="table table-striped table-bordered table-condensed" id="appNotifyConsumerHostGroupTable">
			<caption>
				<strong>${param.ip } 命名空间和方法列表</strong>
			</caption>
			<thead>
						<tr>
							<td width="200" style="text-align:center;">类型</td>
							<td style="text-align:center;" id="time1">10:21</td>
							<td style="text-align:center;" id="time2">10:22</td>
							<td style="text-align:center;" id="time3">10:23</td>
							<td style="text-align:center;" id="time4">10:24</td>
							<td style="text-align:center;" id="time5">10:25</td>
							<td style="text-align:center;" id="time6">10:26</td>
							<td style="text-align:center;" id="time7">10:27</td>
							<td style="text-align:center;" id="time8">10:28</td>
							<td style="text-align:center;" id="time9">10:29</td>
							<td style="text-align:center;" id="time10">10:30</td>
							<td style="text-align:center;">历史数据</td>
						</tr>
			</thead>
			<tbody id="tbody1">
			</tbody>
		</table>
	</div>
</div>
</div>
</div>
</div>
</body>
<script type="text/javascript">
function query(){

		var d  = new Date();
		var time = {};
		var tarray = [];
		for(var i=0;i<10;i++){
			var h = d.getHours()>9?d.getHours():"0"+d.getHours();
			var m = d.getMinutes()>9?d.getMinutes():"0"+d.getMinutes();
			var t = h+":"+m;
			time[t] = (10-i);
			tarray[tarray.length] = t;
			var f = d.getTime()-60*1000
			d = new Date(f);
			$("#time"+(10-i)).text(h+":"+m);
		}
		$.ajax({
			url : "<%=request.getContextPath()%>/app/detail/tair/show.do?method=querySingleHostNamespace&appId=${appInfo.appId}&key=${param.key}&ip=${param.ip}",
			success : function(data) {
				var tbody = "";
				 var  for_popover_map = {};
		    for(var n=0;n<data.length;n++){
			     var row = data[n];
			     var tmp = {};
			     var objectMap = row.objectMap;
			     for(var ftk in objectMap){
				      var ft = objectMap[ftk].ftime;
				      tmp[ft] = objectMap[ftk];
			     }
		     var tr="<tr id='tr_"+n+"' ><td>"+row.keyName+"<a target='_blank' href='<%=request.getContextPath()%>/app/conf/key/show.do?method=keyPropsList&&appId=${appInfo.appId}&keyName="+row.fullKeyName+"' ><img src='<%=request.getContextPath()%>/statics/img/add.png' width='10px' height='10px' title='加入告警' /></a></td>";
		    
		     for(var i=10;i>=1;i--){
			      var k = tarray[(i-1)]
			      if(tmp[k]){
				      //因为key是url，url中包含.，会和js中.运算符冲突，所以id中不能包含key
				       var for_popover_id = "popover_a_tr"+ n +"td" + i;
				       
				       tr+="<td style='text-align:center;' id='"+n+"_time'"+i+" title='"+k+"' ><a data-content='1234' href=''  rel='popover' id='"+for_popover_id+"'>"+tmp[k].mainValue+""+tmp[k].mainValueRate+"</a></td>";
				      
				       var h = "<table class='table table-striped table-bordered table-condensed'><tr>";
				       //遍历属性列表  ips[i].propertyMap.prop
				       var propNames = "", propValues="";
				       var propertyMap = tmp[k].propertyMap;
				       for(var prop in propertyMap){
				        propNames +="<td>"+ prop +"</td>"; 
				        propValues +="<td>"+  propertyMap[prop] +"</td>"
				       }
				       h += propNames+"</tr><tr>"+propValues+"</tr></table>";
				       for_popover_map[for_popover_id] = h;
			       
			      }else{
			       tr+="<td style='text-align:center;' id='"+n+"_time'"+i+" title='"+k+"'>0</td>";
			      }
		     }
		     tr+="<td  style='text-align:center;'><a target='_blank'  href='<%=request.getContextPath()%>/app/detail/history.do?method=showHistoryByip&appName=${appInfo.appName}&keyName="+row.keyName+"&ip="+row.ip+"'>查看</a></td></tr>";
		     
			 tbody+=tr;
		}
		$("#tbody1").html(tbody);
	    
	    $("a[rel='popover']").popover({placement:'left'}).click(function(e) {
	     e.preventDefault()
	       });
	    //给popover元素添加data-content属性
	    for(var i in for_popover_map){
	     $("#"+ i).attr('data-content', for_popover_map[i]);
	    }
				
	}
});
		window.setTimeout("query()",60000);
}
query();
</script>
</html>