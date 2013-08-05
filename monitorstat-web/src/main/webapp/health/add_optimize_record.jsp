<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.taobao.monitor.web.ao.MonitorTimeAo"%>
<%@page import="com.taobao.monitor.web.rating.RatingOptimizeRecord"%>
<%@page import="com.taobao.monitor.web.ao.MonitorRatingAo"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache">
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
		<title>����Ӧ���Ż���¼</title>
		<style>
.report_on {
	background: #bce774;
}
</style>
		<link type="text/css"
			href="<%=request.getContextPath()%>/statics/css/themes/base/ui.all.css"
			rel="stylesheet" />
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/statics/js/jquery.min.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/statics/js/ui/ui.core.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/statics/js/ui/ui.tabs.js"></script>

		<script type="text/javascript"
			src="<%=request.getContextPath()%>/statics/js/ui/ui.draggable.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/statics/js/ui/ui.resizable.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/statics/js/ui/ui.dialog.js"></script>
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/statics/js/jquery.bgiframe.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/statics/js/swfobject.js"></script>
		<style type="text/css">
div {
	font-size: 12px;
}

table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
	font-size: 12px;
	margin: 0px 0;
}

table td {
	font-size: 12px;
}

.ui-button {
	outline: 0;
	margin: 0;
	padding: .4em 1em .5em;
	text-decoration: none; ! important;
	cursor: pointer;
	position: relative;
	text-align: center;
}

.ui-dialog .ui-state-highlight,.ui-dialog .ui-state-error {
	padding: .3em;
}

.headcon {
	font-family: "����";
	font-size: 12px;
	font-weight: bold;
	text-indent: 3px;
	border-color: #316cb2;
	/*text-transform: uppercase;*/
	background: url(<%=     request.getContextPath () %>/ statics/ images/
		4_17 .         gif );
}

img {
	cursor: pointer;
	border: 0;
}

.body_summary {
	margin: 5px 0;
	padding: 2px;
	border-top: 2px solid #ccc;
	border-bottom: 1px solid #ccc;
}
</style>


<style type="text/css">
            body{font-size:12px;font-family:Verdana,Arial,"����";} a:link {color:#464646;text-decoration:none;}
            a:visited {color:#464646;text-decoration:none;} a:hover{color:#ed145b;text-decoration:underline;}
            a:active{color:#ed145b;text-decoration:underline;} td{font-size:12px} /*DateCSS��ʽ*/
            .header {font: 12px Arial, Tahoma !important;font-weight: bold !important;font:
            11px Arial, Tahoma;font-weight: bold;color: #154BA0;background:#C2DEED;height:
            25px;padding-left: 10px; } .header td {padding-left: 10px;} .header a {color:
            #154BA0;} .header input {background:none;vertical-align: middle;height:
            16px;} .category {font: 12px Arial, Tahoma !important;font: 11px Arial,
            Tahoma;color: #92A05A;height:20px;background-color: #FFFFD9;} .category
            td {border-bottom: 1px solid #DEDEB8;} .expire, .expire a:link, .expire
            a:visited {color: #999999;} .default, .default a:link, .default a:visited
            {color: #000000;} .checked, .checked a:link, .checked a:visited {color:
            #FF0000;} .today, .today a:link, .today a:visited {color: #00BB00;} #calendar_year
            {display: none;line-height: 130%;background: #FFFFFF;position: absolute;z-index:
            10;} #calendar_year .col {float: left;background: #FFFFFF;margin-left:
            1px;border: 1px solid #86B9D6;padding: 4px;} #calendar_month {display:
            none;background: #FFFFFF;line-height: 130%;border: 1px solid #86B9D6;padding:
            4px;position: absolute;z-index: 11;} .tableborder {background: white;border:
            1px solid #86B9D6;} #year,#month{padding-right:10px;}
</style>

	</head>
	<body>
		<jsp:include page="../head.jsp"></jsp:include>	
		<jsp:include page="../left.jsp"></jsp:include>	
		<%
			request.setCharacterEncoding("gbk");
			String action = request.getParameter("action");
			if ("add".equals(action)) {
				RatingOptimizeRecord record = new RatingOptimizeRecord();
				String appid = request.getParameter("appid");
				record.setAppId(Integer.parseInt(appid));
				record.setOwner(request.getParameter("owner"));
				String rating_value_tmp = request.getParameter("rating_value");
				Double rating_value = 0.0;
				if (rating_value_tmp != "")
					rating_value = Double.parseDouble(rating_value_tmp);
				record.setRating_value(rating_value);
				java.text.SimpleDateFormat sdf=new java.text.SimpleDateFormat("yyyy-MM-dd");
				record.setCollect_day(sdf.parse(request.getParameter("collect_day")));
				record.setPriority(request.getParameter("priority"));
				record.setStatus(request.getParameter("status"));
				record.setSubject(request.getParameter("subject"));
				record.setSubmitter(request.getParameter("submitter"));
				record.setDescription(request.getParameter("description"));
				record.setComment(request.getParameter("comment"));
				MonitorRatingAo.get().addRatingOptimizeRecord(record);
				response.sendRedirect("manage_optimize_record.jsp?appid=" + appid);
			} else {
		%>
		<form action="./add_optimize_record.jsp" method="post"  onsubmit="return checkSubmit()">
			<div class="ui-dialog ui-widget ui-widget-content ui-corner-all "
				style="width: 100%;">
				<div
					class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix">
					<font color="#FF0000">�������Ż���¼��</font>&nbsp;&nbsp;
				</div>
				<div id="dialog" class="ui-dialog-content ui-widget-content">
					<table width="100%" border="1" class="ui-widget ui-widget-content"
						align="center">
						<tr align="left">
							<td>
								<font color="#FF0000">*&nbsp;</font>��&nbsp;&nbsp;&nbsp;�⣺
								<input type="text" name="subject" id="subject" value="" size="128" />
							</td>
						</tr>
						<tr align="left">
							<td>
								<font color="#FF0000">*&nbsp;</font>�ύ�ˣ�
								<input type="text" name="submitter" id="submitter"  value="" size="20" />
							</td>
						</tr>
						<tr align="left">
							<td>
								<font color="#FF0000">*&nbsp;</font>�����ˣ�
								<input type="text" name="owner" id="owner"  value="" size="20" />
							</td>
						</tr>
						<tr align="left">
							<td>
								����״̬��
								<select name="status" id="status">
									<option value="new">
										new
									</option>
									<option value="closed">
										closed
									</option>
									<option value="wontfix">
										wontfix
									</option>
									<option value="later">
										later
									</option>
									<option value="fixed">
										fixed
									</option>
								</select>
							</td>
						</tr>
						<tr align="left">
							<td>
								���ȼ���
								<select name="priority" id="priority">
									<option value="high">
										high
									</option>
									<option value="medium">
										medium
									</option>
									<option value="low">
										low
									</option>
								</select>
							</td>
						</tr>
						<tr align="left">
							<td>
								Ӧ�õ÷֣�
								<input type="text" name="rating_value" id="rating_value" value="" size="20" />
							</td>
						</tr>
						<tr align="left">
							<td>
								������
								<input type="text" name="description" id="description" value="" size="150" />
							</td>
						</tr>
						<tr align="left">
							<td>
								��ע��
								<input type="text" name="comment" id="comment" value="" size="100" />
							</td>
						</tr>
						<tr align="left">
							<td>
								�ռ��գ�
								<input type="text" name="collect_day" value="2010-10-01" size="14"
									id="collect_day" readonly onclick="showcalendar(event,this);" 
									 onfocus="showcalendar(event, this);if(this.value=='0000-00-00') this.value=''""/>
							</td>
						</tr>
						<tr align="center">
							<td>
								<input type="hidden" name="action" value="add" />
								<input type="hidden" name="appid"
									value="<%=request.getParameter("appid")%>" />
								<input type="submit" value="�ύ" />
							</td>
						</tr>

					</table>
				</div>
			</div>
		</form>
		<%
			}
		%>

<script type="text/javascript">
            var controlid = null;
            var currdate = null;
            var startdate = null;
            var enddate = null;
            var yy = null;
            var mm = null;
            var hh = null;
            var ii = null;
            var currday = null;
            var addtime = false;
            var today = new Date();
            var lastcheckedyear = false;
            var lastcheckedmonth = false;
            var ie = navigator.appName == "Microsoft Internet Explorer" ? true: false;
            function $(objID) {
  				return document.getElementById(objID);
			}
            function _cancelBubble(event) {
                e = event ? event: window.event;
                if (ie) {
                    e.cancelBubble = true;
                } else {
                    e.stopPropagation();
                }
            }
            function getposition(obj) {
                var r = new Array();
                r['x'] = obj.offsetLeft;
                r['y'] = obj.offsetTop;
                while (obj = obj.offsetParent) {
                    r['x'] += obj.offsetLeft;
                    r['y'] += obj.offsetTop;
                }
                return r;
            }
            function loadcalendar() {
                s = '';
                s += '<div id="calendar" style="display:none; position:absolute; z-index:9;" onclick="_cancelBubble(event)">';
                if (ie) {
                    s += '<iframe width="200" height="160" src="about:blank" style="position: absolute;z-index:-1;"></iframe>';
                }
                s += '<div style="width: 200px;"><table class="tableborder" cellspacing="0" cellpadding="0" width="100%" style="text-align: center">';
                s += '<tr align="center" class="header"><td class="header"><a href="#" onclick="refreshcalendar(yy, mm-1);return false" title="��һ��"><<</a></td><td colspan="5" style="text-align: center" class="header"><a href="#" onclick="showdiv(\'year\');_cancelBubble(event);return false" title="���ѡ�����" id="year"></a>  -  <a id="month" title="���ѡ���·�" href="#" onclick="showdiv(\'month\');_cancelBubble(event);return false"></a></td><td class="header"><A href="#" onclick="refreshcalendar(yy, mm+1);return false" title="��һ��">>></A></td></tr>';
                s += '<tr class="category"><td>��</td><td>һ</td><td>��</td><td>��</td><td>��</td><td>��</td><td>��</td></tr>';
                for (var i = 0; i < 6; i++) {
                    s += '<tr class="altbg2">';
                    for (var j = 1; j <= 7; j++) s += "<td id=d" + (i * 7 + j) + " height=\"19\">0</td>";
                    s += "</tr>";
                }
                s += '<tr id="hourminute"><td colspan="7" align="center"><input type="text" size="1" value="" id="hour" onKeyUp=\'this.value=this.value > 23 ? 23 : zerofill(this.value);controlid.value=controlid.value.replace(/\\d+(\:\\d+)/ig, this.value+"$1")\'> �� <input type="text" size="1" value="" id="minute" onKeyUp=\'this.value=this.value > 59 ? 59 : zerofill(this.value);controlid.value=controlid.value.replace(/(\\d+\:)\\d+/ig, "$1"+this.value)\'> ��</td></tr>';
                s += '</table></div></div>';
                s += '<div id="calendar_year" onclick="_cancelBubble(event)"><div class="col">';
                for (var k = 1930; k <= 2019; k++) {
                    s += k != 1930 && k % 10 == 0 ? '</div><div class="col">': '';
                    s += '<a href="#" onclick="refreshcalendar(' + k + ', mm);$(\'calendar_year\').style.display=\'none\';return false"><span' + (today.getFullYear() == k ? ' class="today"': '') + ' id="calendar_year_' + k + '">' + k + '</span></a><br />';
                }
                s += '</div></div>';
                s += '<div id="calendar_month" onclick="_cancelBubble(event)">';
                for (var k = 1; k <= 12; k++) {
                    s += '<a href="#" onclick="refreshcalendar(yy, ' + (k - 1) + ');$(\'calendar_month\').style.display=\'none\';return false"><span' + (today.getMonth() + 1 == k ? ' class="today"': '') + ' id="calendar_month_' + k + '">' + k + (k < 10 ? ' ': '') + ' ��</span></a><br />';
                }
                s += '</div>';
                var nElement = document.createElement("div");
                nElement.innerHTML = s;
                document.getElementsByTagName("body")[0].appendChild(nElement);
                //document.write(s);
                document.onclick = function(event) {
                    $('calendar').style.display = 'none';
                    $('calendar_year').style.display = 'none';
                    $('calendar_month').style.display = 'none';
                }
                $('calendar').onclick = function(event) {
                    _cancelBubble(event);
                    $('calendar_year').style.display = 'none';
                    $('calendar_month').style.display = 'none';
                }
            }
            function parsedate(s) { / (\d + )\ - (\d + )\ - (\d + )\s * (\d * ) : ?(\d * ) / .exec(s);
                var m1 = (RegExp.$1 && RegExp.$1 > 1899 && RegExp.$1 < 2101) ? parseFloat(RegExp.$1) : today.getFullYear();
                var m2 = (RegExp.$2 && (RegExp.$2 > 0 && RegExp.$2 < 13)) ? parseFloat(RegExp.$2) : today.getMonth() + 1;
                var m3 = (RegExp.$3 && (RegExp.$3 > 0 && RegExp.$3 < 32)) ? parseFloat(RegExp.$3) : today.getDate();
                var m4 = (RegExp.$4 && (RegExp.$4 > -1 && RegExp.$4 < 24)) ? parseFloat(RegExp.$4) : 0;
                var m5 = (RegExp.$5 && (RegExp.$5 > -1 && RegExp.$5 < 60)) ? parseFloat(RegExp.$5) : 0;
                /(\d+)\-(\d+)\-(\d+)\s*(\d*):?(\d*)/.exec("0000-00-00 00\:00");
                return new Date(m1, m2 - 1, m3, m4, m5);
            }
            function settime(d) {
                $('calendar').style.display = 'none';
                controlid.value = yy + "-" + zerofill(mm + 1) + "-" + zerofill(d) + (addtime ? ' ' + zerofill($('hour').value) + ':' + zerofill($('minute').value) : '');
            }
            function showcalendar(event, controlid1, addtime1, startdate1, enddate1) {
                controlid = controlid1;
                addtime = addtime1;
                startdate = startdate1 ? parsedate(startdate1) : false;
                enddate = enddate1 ? parsedate(enddate1) : false;
                currday = controlid.value ? parsedate(controlid.value) : today;
                hh = currday.getHours();
                ii = currday.getMinutes();
                var p = getposition(controlid);
                $('calendar').style.display = 'block';
                $('calendar').style.left = p['x'] + 'px';
                $('calendar').style.top = (p['y'] + 20) + 'px';
                _cancelBubble(event);
                refreshcalendar(currday.getFullYear(), currday.getMonth());
                if (lastcheckedyear != false) {
                    $('calendar_year_' + lastcheckedyear).className = 'default';
                    $('calendar_year_' + today.getFullYear()).className = 'today';
                }
                if (lastcheckedmonth != false) {
                    $('calendar_month_' + lastcheckedmonth).className = 'default';
                    $('calendar_month_' + (today.getMonth() + 1)).className = 'today';
                }
                $('calendar_year_' + currday.getFullYear()).className = 'checked';
                $('calendar_month_' + (currday.getMonth() + 1)).className = 'checked';
                $('hourminute').style.display = addtime ? '': 'none';
                lastcheckedyear = currday.getFullYear();
                lastcheckedmonth = currday.getMonth() + 1;
            }
            function refreshcalendar(y, m) {
                var x = new Date(y, m, 1);
                var mv = x.getDay();
                var d = x.getDate();
                var dd = null;
                yy = x.getFullYear();
                mm = x.getMonth();
                $("year").innerHTML = yy;
                $("month").innerHTML = mm + 1 > 9 ? (mm + 1) : '0' + (mm + 1);
                for (var i = 1; i <= mv; i++) {
                    dd = $("d" + i);
                    dd.innerHTML = " ";
                    dd.className = "";
                }
                while (x.getMonth() == mm) {
                    dd = $("d" + (d + mv));
                    dd.innerHTML = '<a href="###" onclick="settime(' + d + ');return false">' + d + '</a>';
                    if (x.getTime() < today.getTime() || (enddate && x.getTime() > enddate.getTime()) || (startdate && x.getTime() < startdate.getTime())) {
                        dd.className = 'expire';
                    } else {
                        dd.className = 'default';
                    }
                    if (x.getFullYear() == today.getFullYear() && x.getMonth() == today.getMonth() && x.getDate() == today.getDate()) {
                        dd.className = 'today';
                        dd.firstChild.title = '����';
                    }
                    if (x.getFullYear() == currday.getFullYear() && x.getMonth() == currday.getMonth() && x.getDate() == currday.getDate()) {
                        dd.className = 'checked';
                    }
                    x.setDate(++d);
                }
                while (d + mv <= 42) {
                    dd = $("d" + (d + mv));
                    dd.innerHTML = " ";
                    d++;
                }
                if (addtime) {
                    $('hour').value = zerofill(hh);
                    $('minute').value = zerofill(ii);
                }
            }
            function showdiv(id) {
                var p = getposition($(id));
                $('calendar_' + id).style.left = p['x'] + 'px';
                $('calendar_' + id).style.top = (p['y'] + 16) + 'px';
                $('calendar_' + id).style.display = 'block';
            }
            function zerofill(s) {
                var s = parseFloat(s.toString().replace(/(^[\s0]+)|(\s+$)/g, ''));
                s = isNaN(s) ? 0 : s;
                return (s < 10 ? '0': '') + s.toString();
            }
            function checkSubmit(){
    			if(document.getElementById("subject").value == "") {
    			 	document.getElementById("subject").focus();
       				alert('���ⲻ����Ϊ�գ�����������');  
       				return   false;  
    			}  
    			if(document.getElementById("submitter").value == "") {
    			 	document.getElementById("submitter").focus();
       				alert('�ύ�˲�����Ϊ�գ�����������');  
       				return   false;  
    			}   
    			if(document.getElementById("owner").value == "") {
    			 	document.getElementById("owner").focus();
       				alert('�����˲�����Ϊ�գ�����������');  
       				return   false;  
    			} 
    			return true;
			}
            
            loadcalendar();
</script>

	</body>
</html>