<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<% %>
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
<script type="text/javascript">
	
	function showpe(id){
 		layer.open({
 				type:2,
				shadeClose : true,
				shade : 0.8,
				area : [ '60%', '70%' ],
				content : 'MyPageServlet?id='+id
			});

		}
	
		/* $(function() {
		
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			});
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			}); */

			$(function(){
				  $(".leftnav h2").click(function(){
					  $(this).next().slideToggle(200);	
					  $(this).toggleClass("on"); 
				  })
				  $(".leftnav ul li a").click(function(){
					    $("#a_leader_txt").text($(this).text());
				  		$(".leftnav ul li a").removeClass("on");
						$(this).addClass("on");
				  })
				  
			});
			
			//动态显示当前时间，无需修改
	        var timerID = null;
	        var timerRunning = false;
	        function stopclock (){
	        if(timerRunning)
	        clearTimeout(timerID);
	        timerRunning = false;}
	        function startclock () {
	        stopclock();
	        showtime();}
	        function showtime () {
	        var now = new Date();
	        var hours = now.getHours();
	        var minutes = now.getMinutes();
	        var seconds = now.getSeconds()
	        var timeValue = "" +((hours >= 12) ? "下午 " : "上午 " )
	        timeValue += ((hours >12) ? hours -12 :hours)
	        timeValue += ((minutes < 10) ? ":0" : ":") + minutes
	        timeValue += ((seconds < 10) ? ":0" : ":") + seconds
	        document.clock.thetime.value = timeValue;
	        timerID = setTimeout("showtime()",1000);
	        timerRunning = true;
	        }


	</script>
</head>
<body style="background-color:#f2f9fd;" onload=startclock()>
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>后台管理中心</h1>
		</div>
		<a class="button button-little bg-green person_info" href="MyPageServlet?userId=${user.id }"><span
			class="icon-user"></span>&nbsp;&nbsp;个人中心</a>
		<div class="head-l">
			&nbsp;&nbsp;&nbsp;&nbsp;<a class="button button-little bg-red"
				href="OutLoginServlet"><span class="icon-power-off"></span>
				&nbsp;&nbsp;退出登录</a>
		</div>
	</div>
	<div class="leftnav">
		<div class="headimg_info">
			<div class="headimg">
				<c:choose>
					<c:when test="${user.name=='admin' }">
						<img src="img/admin.png" class="radius-circle rotate-hover"
							style="margin-top:-10px" height="70" width="70" alt="" />
					</c:when>
					<c:otherwise>
						<img src="ImageShowServlet?image=${user.image }"
							class="radius-circle rotate-hover" height="70" width="70" style="margin-left:10px" alt="" />
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
			<li><a href="UserStationServlet" target="right"><span
					class="icon-caret-right"></span>我的岗位</a></li>
			<li><a href="UserPerformanceServlet?userId=${user.id}"
				target="right"><span class="icon-caret-right"></span>我的绩效</a></li>
			<li><a href="UserCheckServlet?userId=${user.id}" target="right"><span
					class="icon-caret-right"></span>我的考勤</a></li>
		</ul>
		<h2>
			<span class="icon-user"></span>审批流转
		</h2>
			<ul style="display:block">
			<li><a href="UserLeaveServlet" target="right"><span
					class="icon-caret-right"></span>我的假条</a></li>
					</ul>
		
		<h2>
			<span class="icon-user"></span>网上交流
		</h2>
		<ul style="display:block">
			<li><a href="ForumShowServlet" target="right"><span
					class="icon-caret-right"></span>论坛</a></li>
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
	function check(userId){
        alert("hhhh");
        Date date=new Date();
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		DateFormat dateFor=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String str_1=dateFormat.format(date);
		String str_2="08-00-00";
		String str=str_1+"-"+str_2;
		Date oldDate=dateFor.parse(str);
		
	if(date.getTime()<oldDate.getTime()){
		window.location.href="SignServlet?userId="+userId;
	}
	else{
		layer.msg("已经超过签到时间了");
	}
}
	
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})

		});
	</script>

	<!-- 这里是主页的内容显示区域 -->
	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="container.jsp"
			name="right" width="100%" height="100%"></iframe>

	</div>
	<div style="text-align:center;"></div>
</body>
</html>