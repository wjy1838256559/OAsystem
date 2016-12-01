<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
	<title>帖子回复</title>
	<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
</head>
<body>

<div class="panel admin-panel">
	<!-- 标题显示 -->
	<div id="Title_bar">
		<div id="Title_bar_Head">
			<div id="Title_Head"></div>
			<div id="Title">
				<!--页面标题-->
				
			</div>
			<div id="Title_End"></div>
		</div>
	</div>

	<!--显示表单内容-->
	<div id="MainArea">

		<form action="ReplySuccessServlet" method="post" style="margin-top:15px; padding: 0;">
			<input tpye="hidden" name="topicId" value="${topic.id }"/>
			<div id="PageHead"></div>
			<center>
				<div class="ItemBlock_Title1">
					<div width=85% style="float:left;margin-left:30px;margin-bottom:20px;">
						<font class="MenuPoint"> <strong>&gt; </strong></font>
						<a href="ForumShowServlet"><strong>论坛</strong></a>
					</div><br />
					<div style="float:left;margin-left:-250px;margin-top:20px;margin-bottom:20px;"><strong>帖子主题</strong>
						<strong>${topic.title}</strong></div>
			
				</div>

					<table border="0" cellspacing="1" cellpadding="1" width="100%"
						id="InputArea">
						<tr>
							<td class="InputAreaBg" height="30" width="50px"><div
									class="InputTitle" style="margin-left:30px;width:40px;"><strong>标题</strong></div>
							</td>
							<td class="InputAreaBg"><div class="InputContent">
									<input name="title" class="InputStyle"
										style="width:99%;height:40px;margin-bottom:20px;border:1px solid #dddddd;border-radius:4px;" value="回复：${topic.title}" data-validate="required:请输入回复说明"  onclick="this.value=''" />
								</div></td>
						</tr>
						<tr height="240">
							<td class="InputAreaBg" valign="top"><div class="InputTitle" style="margin-left:30px;width:40px;"><strong>内容</strong></div>
							</td>
							<td class="InputAreaBg">
								<div class="InputContent">
									<textarea name="content" style="width:99%;height:600px;border-radius:4px;" data-validate="required:请输入回复内容" ></textarea>
								</div></td>

						</tr>
					</table>
				</div>
	</div>
			</center>
		</form>

	</div>

	
</div>
</div>
</body>
</html>
