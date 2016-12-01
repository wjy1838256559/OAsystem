<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<title>发表新主题</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/script/pageCommon.js"
	charset="utf-8"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/script/PageUtils.js"
	charset="utf-8"></script>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/style/blue/forum.css" />
</head>
<body>
<div class="panel admin-panel">
	<!-- 标题显示 -->
	<div id="Title_bar">
		<div id="Title_bar_Head">
			<div id="Title_Head"></div>
			<div id="Title">
				<!--页面标题-->
				<img border="0" width="13" height="13"
					src="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
				<div class="panel-head" id="add" style="margin-left:20px;"><strong><span class="icon-pencil-square-o"></span>发表新主题</strong></div>
			</div>
			<div id="Title_End"></div>
		</div>
	</div>

	<!--显示表单内容-->
	<div id="MainArea">

		<form action="TopicSuccessServlet" method="post" style="margin-top:15px; padding: 0;">
			<input type="hidden" name="forumId" value="${forum.id }"/>
			<div id="PageHead"></div>
			<center>
				<div class="ItemBlock_Title1">
					<div width=85% style="float:left;margin-left:30px;margin-bottom:20px;">
						<font class="MenuPoint"> <strong>&gt; </strong></font>
						<a href="ForumShowServlet"><strong>论坛</strong></a>
						<font class="MenuPoint"><strong> &gt;</strong> </font>
						<a href="TopicServlet?forumId=${forum.id }"><strong>${forum.name}</strong></a>
						<font class="MenuPoint"> <strong>&gt;</strong> </font> <strong>发表新主题</strong>
					</div>
				</div>

				<div class="ItemBlockBorder">
					<table border="0" cellspacing="1" cellpadding="1" width="100%"
						id="InputArea">
						<tr>
							<td class="InputAreaBg" height="30" width="50px"><div
									 style="margin-left:30px;width:40px;"><strong>标题</strong></div>
							</td>
							<td class="InputAreaBg">
								<div class="InputContent">
									<input name="title"  id="title"
										style="width:80%;height:40px;margin-bottom:20px;border:1px solid #dddddd;border-radius:4px;" />
								</div>
							</td>
						</tr>
						<tr>
							<td class="InputAreaBg" height="30" width="50px"><div
									 style="margin-left:30px;width:40px;"><strong>内容</strong></div>
							</td>
							<td class="InputAreaBg">
								<div class="InputContent">
									<input name="content"  id="content"
										style="width:80%;height:40px;margin-bottom:20px;border:1px solid #dddddd;border-radius:4px;" />
								</div>
							</td>
						</tr>
					</table>
					<div class="pagelist" style="margin-left:-200px;margin-top:25px">
            					<a href="javascript:add(${forum.id })">添加</a>
            					<a href="javascript:history.go(-1);">返回</a>
  						  </div>
				</div>
			</center>
		</form>
	</div>
</div>
</body>
<script type="text/javascript">
	function add(forumId){
		var title=document.getElementById("title").value;
		var content=document.getElementById("content");
		window.location.href="TopicSuccessServlet?forumId="+forumId+"&title="+title+"&content="+content;
	}
</script>
</html>
