<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>后台管理中心</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/layer/layer.js"></script>
</head>
<body style="background-color:#f2f9fd;" onload=startclock()>
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>后台管理中心</h1>
		</div>
		<a class="button button-little bg-green person_info" href="index.jsp"><span
			class="icon-user"></span>&nbsp;&nbsp;主页</a>
		<c:if test="${user.name!='admin' }">
			<!--  	<a class="button button-little bg-green person_info" href="javascript:onclick=showpe(${user.id})"><span
			class="icon-user"></span>&nbsp;&nbsp;个人中心</a>-->
		</c:if>

		<!-- 当前时间表单 -->
		<form name=clock style="position:absolute;top:25px;right:250px;">
			<input name=thetime
				style="font-size: 12pt;color:#000000;border:none;background:#8585a7;"
				size=12>
		</form>

		<div class="head-l">
			&nbsp;&nbsp;&nbsp;&nbsp;<a class="button button-little bg-red"
				href="login.jsp"><span class="icon-power-off"></span>
				&nbsp;&nbsp;退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="headimg_info">
			<div class="headimg">
				<c:choose>
					<c:when test="${user.name=='admin' }">
						<img src="admin/admin.png" class="radius-circle rotate-hover"
							style="margin-top:-10px" height="70" width="70" alt="" />
					</c:when>
					<c:otherwise>
						<img src="ImageShowServlet?image=${user.image }"
							class="radius-circle rotate-hover" height="70" width="70"
							style="margin-top:-10px" alt="" />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="head_info">
				<h5>欢迎您</h5>
				<c:choose>
					<c:when test="${user.name=='admin' }">
						<h4 size="8px">管理员</h4>
					</c:when>
					<c:otherwise>
						<h4>${user.name }</h4>
						<h5>${user.station.sName}</h5>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<h2>
			<span class="icon-user"></span>基本管理
		</h2>
		<ul style="display:block">
			<li><a href="EmployeeListServlet" target="right"><span
					class="icon-caret-right"></span>人事管理</a>
			</li>
			<li><a href="DepartmentServlet" target="right"><span
					class="icon-caret-right"></span>部门管理</a>
			</li>
			<li><a href="StationServlet" target="right"><span
					class="icon-caret-right"></span>岗位管理</a>
			</li>
			<li><a href="PerformanceServlet" target="right"><span
					class="icon-caret-right"></span>绩效管理</a>
			</li>
			<li><a href="CheckServlet" target="right"><span
					class="icon-caret-right"></span>考勤管理</a>
			</li>
		</ul>
		<h2>
			<span class="icon-user"></span>审批流转
		</h2>
		<ul style="display:block">
			<li><a href="LeaveListServlet" target="right"><span
					class="icon-caret-right"></span>审批流程管理</a>
			</li>
		</ul>
		<h2>
			<span class="icon-user"></span>网上交流
		</h2>
		<ul style="display:block">
			<li><a href="ForumServlet" target="right"><span
					class="icon-caret-right"></span>论坛管理</a>
			</li>
			<li><a href="ForumShowServlet" target="right"><span
					class="icon-caret-right"></span>论坛</a>
			</li>
		</ul>
	</div>
	<%-- 
		<c:forEach var="parent"
			items="${applicationScope.topPrivilegeList}">
			<c:if test="#session.user.hasPrivilegeByName(name)">
				<h2>
					<span class="icon-user"></span>${parent.name }
				</h2>
				<c:forEach var="child" items="${parent.children }">
					<c:if test="#session.user.hasPrivilegeByName(name)">
						<ul style="display:block">
							<li><a href="${ child.url}" target="right"><span
									class="icon-caret-right"></span>${child.name }</a>
							</li>
						</ul>
					</c:if>
				</c:forEach>
			</c:if>
		</c:forEach>--%>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			});
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			});

		});

		//动态显示当前时间，无需修改
		var timerID = null;
		var timerRunning = false;
		function stopclock() {
			if (timerRunning)
				clearTimeout(timerID);
			timerRunning = false;
		}
		function startclock() {
			stopclock();
			showtime();
		}
		function showtime() {
			var now = new Date();
			var hours = now.getHours();
			var minutes = now.getMinutes();
			var seconds = now.getSeconds()
			var timeValue = "" + ((hours >= 12) ? "下午 " : "上午 ")
			timeValue += ((hours > 12) ? hours - 12 : hours)
			timeValue += ((minutes < 10) ? ":0" : ":") + minutes
			timeValue += ((seconds < 10) ? ":0" : ":") + seconds
			document.clock.thetime.value = timeValue;
			timerID = setTimeout("showtime()", 1000);
			timerRunning = true;
		}
	</script>

	<!-- 这里是主页的内容显示区域 -->
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="container.jsp"
			name="right" width="100%" height="100%"></iframe>

	</div>
	<div style="text-align:center;"></div>
</body>
</html>