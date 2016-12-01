<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="js/jquery.js"></script>
<script src="js/layer/layer.js"></script>
<style type="text/css">
#container{
/* border:1px dashed #ccc; */
height:100%;
padding:5px 5px;
}


.right {
	float: left;
	width: 97%;
	height: 70%;
	margin-top:20px;
	overflow: auto;
}
.right ul{
margin:0px;
}
.right ul li {
   	margin:0px;
	list-style: none;
	float: left;
	border-bottom: 1px dashed #ccc;
	padding: 0px 5px 5px 5px;
	width: 100%;
	font: normal normal 12px/28px '微软雅黑';
}
.reason_button a{
	/* position:absolute;
	bottom:10px;
	right:5px; */
	float:right;
	margin:10px;
	width:50px;
	height:25px;
	background:#fff;
	border:1px solid #37b0fe;
	border-radius:4px;
	text-decoration: none;
	color: black;
	text-align: center;
	line-height: 25px;
}
.reason_button a:hover{
	background:#37b0fe;
}
</style>


</head>

<body>
	<div id="container">
		<div class="right">
			<ul>
			    <li>员工号：${leaveList.employee.number}</li>
			    <li>姓名：${leaveList.employee.name}</li>
				<li>原因：${leaveList.reason}</li>
				<li>日期：${leaveList.date}</li>
			</ul>
			
		</div>
		<c:if test="${leaveList.state==1 }">
			<div class="reason_button">
			<a id="" href="javascript:onclick=pizhunFun(${id});" >批准</a>
			<a id="" href="javascript:onclick=jujueFun(${id});">拒绝</a>
		</div>
		</c:if>
		
		<script type="text/javascript">
function pizhunFun(id){
			//询问框
			layer.confirm('您确定批准?', {
			  btn: ['批准','取消'] //按钮
			}, function(){
			location.href="LeaveListUpdateTServlet?id="+id;
			});
			}

			function jujueFun(id){
			//询问框
			layer.confirm('您确定拒绝?', {
			  btn: ['拒绝','取消'] //按钮
			}, function(){
			location.href="LeaveListUpdateJServlet?id="+id;
			});
			}
		</script>
	</div>
</body>
</html>