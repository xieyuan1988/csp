<%@ page language="java" import="java.util.*" pageEncoding="GBK" isELIgnored="false"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
	<head>
		<title>�����Ŷӵ���������</title>
		<%@ include file="/time/common/base.jsp"%>
		<meta http-equiv="content-type" content="text/html;charset=gbk" />
		<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/statics/css/jsPlumb.css">
		<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/statics/css/index.css">
		<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/statics/css/jquery-ui.css">
		<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/statics/css/bootstrap.css">
		<link type="text/css" rel="stylesheet"	href="<%=request.getContextPath()%>/statics/css/bootstrap-responsive.css">
		<script type="text/javascript"	src="<%=request.getContextPath()%>/statics/js/jquery/jquery.min.js"></script>
		<script type="text/javascript"   src="<%=request.getContextPath()%>/statics/js/jquery/jquery-ui.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/statics/js/bootstrap.js"></script>
		<script type="text/javascript"	src="<%=request.getContextPath()%>/statics/js/jquery/jquery.jsPlumb-1.3.14-all-min.js"></script>
<%
	//���̻����Ļ�������
	int baseTop = 0;
	int baseLeft = 0;
	int windowWidth = 15;
	int windowHeight = 9;
%>		
<style>
.window { 
border:1px solid #346789;
	-moz-border-radius:0.5em;
	border-radius:0.5em;
	z-index:20; position:absolute;
	background-color:#eeeeef;
	color:black;
	font-family:helvetica;padding:0.5em;
	font-size:0.9em;
    position: absolute;
    height: <%=windowHeight%>em;
    width: <%=windowWidth%>em;
    z-index: 20;	
}
.window:hover {

box-shadow: 2px 2px 19px #444;
   -o-box-shadow: 2px 2px 19px #444;
   -webkit-box-shadow: 2px 2px 19px #444;
   -moz-box-shadow: 2px 2px 19px #444;
    opacity:0.6;
filter:alpha(opacity=60);

}

.active {
	border:1px dotted green;
}
.hover {
	border:1px dotted red;
}
._jsPlumb_connector { z-index:4; }
._jsPlumb_endpoint, .endpointTargetLabel, .endpointSourceLabel{ z-index:-1;cursor:pointer; }
.hl { border:3px solid red; }
#debug { position:absolute; background-color:black; color:red; z-index:5000 }

.aLabel {
 	background-color:white; 
	padding:0.4em; 
	font:12px sans-serif; 
	color:#444;
	z-index:21;
	border:1px dotted gray;
	opacity:0.8;
	filter:alpha(opacity=80);
}
.window td {
	font-size: 12px
}

#opsname_buyerstory {  top:<%=baseTop%>em;left:<%=baseLeft%>em;}
#opsname_tcif { top:<%=baseTop%>em;left:<%=baseLeft + windowWidth + 5%>em;}
#opsname_taobaoindex  { top:<%=baseTop%>em;left:<%=baseLeft + windowWidth * 2 + 5 * 2%>em;}
#opsname_cubesearch  { top:<%=baseTop%>em;left:<%=baseLeft + windowWidth * 3 + 5 * 3%>em;}
#opsname_cubeweb  { top:<%=baseTop%>em;left:<%=baseLeft + windowWidth * 4 + 5 * 4%>em;}

#opsname_itier { top:<%=baseTop + windowHeight + 5%>em;left:<%=baseLeft + windowWidth * 2 + 5 * 2%>em;}

#opsname_nodefox {  top:<%=baseTop + windowHeight * 2 + 5*2%>em;left:<%=baseLeft%>em;}
#opsname_hbaserest { top:<%=baseTop + windowHeight * 2 + 5*2%>em;left:<%=baseLeft + windowWidth + 5%>em;}
#opsname_cubeorder  { top:<%=baseTop + windowHeight * 2 + 5*2%>em;left:<%=baseLeft + windowWidth * 2 + 5 * 2%>em;}
#opsname_andes  { top:<%=baseTop + windowHeight * 2 + 5*2%>em;left:<%=baseLeft + windowWidth * 3 + 5 * 3%>em;}
#opsname_galaxyfirsttime  { top:<%=baseTop + windowHeight * 2 + 5*2%>em;left:<%=baseLeft + windowWidth * 4 + 5 * 4%>em;}
</style>
<%
	Map<String, AppInfoPo> appMap = (Map<String, AppInfoPo>) request.getAttribute("appMap");
	Map<String, Integer[]> capacityMap = (Map<String, Integer[]>) request.getAttribute("capacityMap");

	AppInfoPo tmallCart = null;
	AppInfoPo tmallBuy = null;
	if (appMap != null) {
	} else {
		appMap = new HashMap<String, AppInfoPo>();
	}
	
	if(capacityMap == null)
		capacityMap = new HashMap<String, Integer[]>();
%>
</head>
	<body data-demo-id="flowchartConnectorsDemo" data-library="jquery">
		<%@ include file="/header.jsp"%>
	<div class="index_body">	
	<div class="container-fluid">
		<div class="row-fluid" style="text-align: center">
			<div class="span12" id="page_nav"></div>
		<script>
			$("#page_nav").load('<%=request.getContextPath()%>/page_nav.jsp', {urlPrefix:'<%=request.getContextPath()%>/app/detail/show.do?method=showIndex&appId=',appId: '${appInfo.appId}'});
		</script>
		</div>
		<div>
		<h1 align="center">����������������</h1>
		<table class="table table-striped table-bordered table-condensed"  width="100%">
			<tr>
				<td>1.QPS=��ȺQPS/������. ����QPS=CSPѹ�ⵥ̨����QPS������ֵ;&nbsp;RT=��Ⱥ����Ӧʱ��/������, load=��Ⱥ��ƽ��load.&nbsp;PVָ��Ⱥ��������pv</td>
			<tr>
			<tr>
				<td>2.��־�쳣=������־�쳣����.</td>
			</tr>
			<tr>
				<td>3.�������ݾ�Ϊ1������ȫ�����ݣ��Ա�����Ϊ7��ǰͬʱ������</td>
			</tr>
		</table>
		</div>
		<div style="position: relative; margin-top: 5px;">
			<div id="demo">
			<%
				List<String> appList = Arrays.asList("tcif","buyerstory","taobaoindex","cubeweb","cubesearch", "itier",
						"nodefox","hbaserest","andes","galaxyfirsttime","cubeorder");
				for (String appName : appList) {
					AppInfoPo item = appMap.get(appName);
					Integer[] capacity = capacityMap.get(appName);
					if(capacity == null)
						capacity = new Integer[]{0, 0};
					//��null������action������
			%>
					<div class="component window" id="opsname_<%=item.getOpsName()%>"  onclick="popoverAppDetail('<%=item.getAppId()%>')" >
								<table>
									<tr>
										<td><a href="<%=request.getContextPath()%>/app/detail/show.do?method=showIndex&appId=<%=item.getAppId()%>" target="_blank;"><%=item.getOpsName()%></a>&nbsp;&nbsp;[<font id="<%=item.getOpsName()%>_collectTime">����</font>]&nbsp;&nbsp;��<font id="<%=item.getOpsName()%>_hostSize"><%=capacity[0]%></font>̨��</td>
									</tr>
									<tr>
										<td>��ǰQPS:<font color="blue" style="font-weight:bold;" id="<%=item.getOpsName()%>_qps">����</font>
										&nbsp;&nbsp; PV:<font color="blue" style="font-weight:bold;" id="<%=item.getOpsName()%>_totalpv">����</font></td>
									</tr>
									<tr style="display: none;">
										<td colspan="2">����QPS:<font color="green" id="<%=item.getOpsName()%>_capacity"><%=capacity[1]%></font>
											&nbsp;&nbsp;ʧ����:<font id="<%=item.getOpsName()%>_failRate">����</font>
										</td>
									</tr>								
									<tr>
										<td >RT��ms��:<font color="blue"  style="font-weight:900;" id="<%=item.getOpsName()%>_rt">����</font>
										&nbsp;&nbsp;
										load:<a href="<%=request.getContextPath()%>/app/detail/exception/show.do?method=showIndex&appId=<%=item.getAppId()%>"><font style="color: red;" id="<%=item.getOpsName()%>_load">����</font></a>
										</td>
									</tr>							
									<tr style="display: none;">
										<td>��־�쳣:<a href="<%=request.getContextPath()%>/app/detail/exception/show.do?method=showIndex&appId=<%=item.getAppId()%>"><font style="color: red;" id="<%=item.getOpsName()%>_exceptionCount">����</font></a>
										</td>
									</tr>
									<tr>
									</tr>
								</table>
					</div>				
			<%
								}
				%>
		</div>
		</div>
			<div class="modal hide fade" id="appDentailMessageDiv" style="width: 960px;left: 400px;">
			  <div class="modal-header">
			    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			     <div id="modelHeader"><h4></h4></div>
			  </div>
			  <div class="modal-body">
				<ul class="nav nav-tabs" id="myTab">
				  <li class="active"><a href="#tableinfo">Ӧ����Ϣ</a></li>
				</ul>
				<div class="tab-content">
				  <div class="tab-pane active" id="tableinfo">
				  	<!-- Ӧ����Ϣ -->
				  </div>				
				  <div class="tab-pane" id="dependinfo">
				  	<!-- ������Ϣ -->
				  </div>
				  <div class="tab-pane" id="groupinfo">
				  	<!-- ������Ϣ -->
				  </div>				  
				</div>
			  </div>
			 </div>
			 <input type="hidden" id="currentAppId" value="-1">
		</div>		
		<div id="waitDiv"   class="alert alert-block alert-error fade in"  style="position: absolute;left: 0px;top:100px">���ڻ�ȡ����....</div>
		</div>
</body>
<script type="text/javascript">
window.jsPlumbDemo = {
		init : function() {
			jsPlumb.importDefaults({
				// default drag options
				DragOptions : { cursor: 'pointer', zIndex:2000 },
				// default to blue at one end and green at the other
				EndpointStyles : [{ fillStyle:'#225588' }, { fillStyle:'#558822' }],
				// blue endpoints 7 px; green endpoints 11.
				Endpoints : [ [ "Dot", {radius:3} ], [ "Dot", { radius:3 } ]],
				// the overlays to decorate each connection with.  note that the label overlay uses a function to generate the label text; in this
				// case it returns the 'labelText' member that we set on each connection in the 'init' method below.
				ConnectionOverlays : [
					[ "Arrow", { location:0.9 } ]
					/*,
					[ "Label", { 
						location:0.1,
						id:"label",
						cssClass:"aLabel"
					}]*/
				],
				ConnectorZIndex:5
			});			

			// this is the paint style for the connecting lines..
			var connectorPaintStyle = {
				lineWidth:5,
				strokeStyle:"gray",
				joinstyle:"round",
				outlineColor:"white",
				outlineWidth:7
			},
			// .. and this is the hover style. 
			connectorHoverStyle = {
				lineWidth:5,
				strokeStyle:"#ec9f2e"
			},
			// the definition of source endpoints (the small blue ones)
			sourceEndpoint = {
				endpoint:"Dot",
				paintStyle:{ fillStyle:"#225588",radius:7 },
				isSource:true,
				connector:[ "Flowchart", { stub:[40, 60], gap:10 } ],								
				connectorStyle:connectorPaintStyle,
				hoverPaintStyle:connectorHoverStyle,
				connectorHoverStyle:connectorHoverStyle,
                dragOptions:{}
				/*,
                overlays:[
                	[ "Label", { 
	                	location:[0.5, 1.5], 
	                	label:"Drag",
	                	cssClass:"endpointSourceLabel" 
	                } ]
                ]*/
			},
			// a source endpoint that sits at BottomCenter
		//	bottomSource = jsPlumb.extend( { anchor:"BottomCenter" }, sourceEndpoint),
			// the definition of target endpoints (will appear when the user drags a connection) 
			targetEndpoint = {
				endpoint:"Dot",					
				paintStyle:{ fillStyle:"#558822",radius:7 },
				hoverPaintStyle:connectorHoverStyle,
				maxConnections:-1,
				dropOptions:{ hoverClass:"hover", activeClass:"active" },
				isTarget:true
				/*,			
                overlays:[
                	[ "Label", { location:[0.5, -0.5], label:"Drop", cssClass:"endpointTargetLabel" } ]
                ]*/
			},			
			init = function(connection) {
				//connection.getOverlay("label").setLabel(connection.sourceId.substring(6) + "-" + connection.targetId.substring(6));
			};			

			var allSourceEndpoints = [], allTargetEndpoints = [];
				_addEndpoints = function(toId, sourceAnchors, targetAnchors) {
					for (var i = 0; i < sourceAnchors.length; i++) {
						var sourceUUID = toId + sourceAnchors[i];
						allSourceEndpoints.push(jsPlumb.addEndpoint(toId, sourceEndpoint, { anchor:sourceAnchors[i], uuid:sourceUUID }));						
					}
					for (var j = 0; j < targetAnchors.length; j++) {
						var targetUUID = toId + targetAnchors[j];
						allTargetEndpoints.push(jsPlumb.addEndpoint(toId, targetEndpoint, { anchor:targetAnchors[j], uuid:targetUUID }));						
					}
				};
			//Here FIXME
		
		}
	};

	if(jsPlumbDemo.reset) 
		jsPlumbDemo.reset();
	jsPlumb.setRenderMode(jsPlumb.SVG);
	jsPlumbDemo.init();
	
	grap();
	refresh();
	
	function grap(){
		$.ajax({
			url : "<%=request.getContextPath()%>/indexother.do?method=getDataAppInfo&company=${company}",
			success : function(data) {
				for(var i=0;i<data.length;i++){
					var ie = data[i];
					$("#"+ie["appName"]+"_collectTime").text(ie.ftime);
					$("#"+ie["appName"]+"_totalpv").html(ie.pv);
					$("#"+ie["appName"]+"_qps").html(ie.qps+""+ie.pvRate); //QPS��PV�������ʣ�����ͬ��
					$("#"+ie["appName"]+"_rt").text(ie.rt);
					if($("#"+ie["appName"]+"_failRate"))
						$("#"+ie["appName"]+"_failRate").html(ie.failurerate);
					//$("#"+ie["appName"]+"_capacity").text(ie.capcityRate);
					$("#"+ie["appName"]+"_alarm").text(ie.alarms);
					$("#"+ie["appName"]+"_exceptionCount").html(ie.exceptionNum+""+ie.exceptionRate);
					$("#"+ie["appName"]+"_load").html(ie.load);
					//$("#"+ie["appName"]+"_hostSize").text(ie.machines);
				}
				$("#waitDiv").hide();
			}
		});
	}
	
	function refresh(){
		//ˢ�½�������
		$("#tradeId").html("");	
		$("#tradeId").load("<%=request.getContextPath()%>/index.do?method=tradeTcCreateIndex");
		window.setTimeout("refresh()",60000);	//1min
	}
	//����
	function popoverAppDetail(appId){
		$("#tableinfo").html("");	//��յ�һ��ѡ�(ͳ����Ϣ����)
		 $("#tableinfo").load("<%=request.getContextPath()%>/time/popover_app_table.jsp?appId="+appId,  function(){
		 	$('#myTab a[href="#tableinfo"]').tab('show');
			$('#appDentailMessageDiv').modal();
			$('#currentAppId').attr("value", appId);	//����ʱ��¼��ǰ��AppId
		 }); 
	}
	//����������ڵ�Tab��ʱ�򣬰���appid������Ӧ��ҳ��
	$(function() {
		$('#myTab a').click(function (e) {
			  e.preventDefault();
			  var nodeValue = $(this)[0].attributes[0].nodeValue;
			  if(nodeValue == "#tableinfo") {
				$(nodeValue).html("");	
				$(nodeValue).load("<%=request.getContextPath()%>/time/popover_app_table.jsp?appId=" + $('#currentAppId').val()); 
			  } else if(nodeValue == "#dependinfo") {
				$(nodeValue).html("");	
				$(nodeValue).load("<%=request.getContextPath()%>/time/popover_app_table.jsp?appId=" + $('#currentAppId').val() + "&showType=dependinfo");				  
			  } else if(nodeValue == "#groupinfo") {
					$(nodeValue).html("");//������Ϣ
					$(nodeValue).load("<%=request.getContextPath()%>/time/popover_app_table.jsp?appId=" + $('#currentAppId').val() + "&showType=groupinfo");  
			  }
			  $(this).tab('show');
		})
	});
	
</script>
</html>