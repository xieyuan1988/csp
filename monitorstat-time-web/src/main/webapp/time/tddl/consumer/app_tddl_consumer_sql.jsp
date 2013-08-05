<%@page import="com.taobao.csp.time.web.po.SortEntry"%>
<%@page import="com.taobao.csp.time.web.po.TimeDataInfo"%>
<%@page import="com.taobao.csp.dataserver.Constants"%>
<%@page import="com.taobao.csp.dataserver.KeyConstants"%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"
	isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<%@page import="com.taobao.monitor.common.po.AppInfoPo"%><html>
<head>
<title>监控详情</title>
<%@ include file="/time/common/base.jsp"%>

<meta http-equiv="content-type" content="text/html;charset=gbk" />
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/statics/css/bootstrap.css">
<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/statics/css/bootstrap-responsive.css">
<script type="text/javascript"	src="<%=request.getContextPath()%>/statics/js/jquery/jquery.min.js"></script>
<script type="text/javascript"	src="<%=request.getContextPath()%>/statics/js/jquery/jquery.tooltip.min.js"></script>
<script type="text/javascript"		src="<%=request.getContextPath()%>/statics/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/statics/css/jquery-ui.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/statics/js/jquery/jquery-ui.js"></script>
<script>
$(function(){
	$(".pop").popover({placement : "right"});
	$(".pop").popover("hide");
});
</script>
<style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
</style>
</head>
<body >
<%@ include file="/header.jsp"%>

<%
List<String> timeList = (List<String>)request.getAttribute("timeList");
List<SortEntry<TimeDataInfo>> sortEntryList = (List<SortEntry<TimeDataInfo>>)request.getAttribute("sortEntryList");
%>

<div class="container-fluid">
<div class="row-fluid" style="text-align: center">
	<div class="span12" id="page_nav"></div>
<script>
	$("#page_nav").load('<%=request.getContextPath()%>/page_nav.jsp', {urlPrefix:'<%=request.getContextPath()%>/app/detail/show.do?method=showIndex&appId=',appId: '${appInfo.appId}'});
</script>	

</div>
	<div class="row-fluid">
        <div class="span2">
			<%@include file="/leftmenu.jsp"%>
		</div>
		<div class="span12">
			<a href="<%=request.getContextPath()%>/index.jsp">实时首页</a> -><a href="<%=request.getContextPath()%>/app/detail/show.do?method=showIndex&appId=${appInfo.appId}">${appInfo.appName} </a>
			-><a href="<%=request.getContextPath()%>/app/detail/tddl/consumer/show.do?method=showIndex&appId=${appInfo.appId}">消耗的TDDL信息</a>
			->${key1Name}数据库
			<hr>
			<div class="row-fluid">
				<table class="table table-striped table-bordered table-condensed"  width="100%">
					<thead>
						<tr>
							<td width="250" style="text-align:center;">SQL</td>
							<%for(String time:timeList){ %>
							<td style="text-align:center;"><%=time %></td>
							<%} %>
							<td style="text-align:center;">主机详情</td>
							<td style="text-align:center;">历史数据</td>
						</tr>
					</thead>
					
					<tbody id="exctbody">
					
						<%
							for(SortEntry<TimeDataInfo> se:sortEntryList){
								String sql = se.getKeyName();
								String sqlInCell;
								final int I = 100;
								if (sql.length() > I) {
									sqlInCell = sql.substring(0, I)+"...";
								} else {
									sqlInCell = sql;
								}
						%>
							<tr>
								<td width="250" title='<%=sql %>'  style="text-align:center;" rowspan="2"><%=sqlInCell %><a target='_blank' href='<%=request.getContextPath()%>/app/conf/key/show.do?method=keyPropsList&&appId=${appInfo.appId}&keyName=<%=se.getFullKeyName()%>' ><img src='<%=request.getContextPath()%>/statics/img/add.png' width='10px' height='10px' title='加入告警' /></a></td>
								<%
								for(String time:timeList){ 
									TimeDataInfo td = se.getObjectMap().get(time);
									if(td == null){
								%>
								<td style="text-align:center;"></td>
								<%}else{
									%>
									<td style="text-align:center;" title="执行次数"><%=td.getOriginalPropertyMap().get("E-times") == null ? "" : td.getOriginalPropertyMap().get("E-times")%></td>
									<%
									}} %>
								<td style="text-align:center;" rowspan="2"><a target='_blank' title='查看主机调用量' href='<%=request.getContextPath()%>/app/detail/tddl/consumer/show.do?method=showSqlHostInfo&appId=${appInfo.appId}&key1Name=${key1Name}&key2Name=<%=sql %>'>查看</a></td>
								<td style="text-align:center;" rowspan="2"><a target='_blank' title='查看历史调用量' href='<%=request.getContextPath()%>/app/detail/history.do?method=showHistory&appId=${appInfo.appId}&keyName=<%=se.getFullKeyName() %>'>查看</a></td>
							</tr>
							<tr>
								<%
								for(String time:timeList){ 
									TimeDataInfo td = se.getObjectMap().get(time);
									if(td == null){
								%>
								<td style="text-align:center;"></td>
								<%}else{
									%>
									<td class="pop"  style="text-align:center;" data-content="<table class='table table-striped table-bordered table-condensed'><tr><td>平均响应时间</td><td><%=td.getOriginalPropertyMap().get("C-time") == null ? "" : td.getOriginalPropertyMap().get("C-time")+"ms"%></td></tr><tr><td>最大响应时间</td><td><%=td.getOriginalPropertyMap().get("Max-C-time") == null ? "" : td.getOriginalPropertyMap().get("Max-C-time")+"ms"%></td></tr><tr><td>最小响应时间</td><td><%=td.getOriginalPropertyMap().get("Min-C-time") == null ? "" : td.getOriginalPropertyMap().get("Min-C-time")+"ms"%></td></tr></table>"><%=td.getOriginalPropertyMap().get("C-time") == null ? "" : td.getOriginalPropertyMap().get("C-time")+"ms"%></td>
									
									<%
									}} %>
							</tr>
							<%} %>
					</tbody>
				</table>
			</div>
		</div>			
    </div>
</div>
   
</body>
<script type="text/javascript">
  
  $(document).ready(function() {
	  $("td[rel=popover]") .popover({placement:"left"}) .click(function(e) {
	      e.preventDefault()
	    });
    });
</script>

</html>
