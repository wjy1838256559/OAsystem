<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
<title>【${forum.name}】中的主题列表</title>
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
			<div class="panel-head" id="add" style="margin-left:20px;">
				<img border="0" width="13" height="13"
					src="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
					<strong><span class="icon-pencil-square-o"></span>
				【${forum.name}】中的主题列表
			</div>
			<div id="Title_End"></div>
		</div>
	</div>

	<div id="MainArea">
		<div id="PageHead"></div>
		<center>
			<div class="ItemBlock_Title1" style="float:left;margin-left:30px;margin-bottom:15px;margin-top:15px;">
				<font class="MenuPoint"> <strong>&gt;</strong> </font> <a href="ForumShowServlet"><strong>论坛</strong></a>
				<font class="MenuPoint"> <strong>&gt;</strong> </font> <strong>${forum.name}
			</div>

			<div class="ForumPageTableBorder table table-hover text-center" style="">
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-top:1px solid #dddddd;">
					<!--表头-->
					<tr align="center" valign="middle">
						<th class="ForumPageTableTitle" width="300"><strong>主题</strong></th>
						<th width="300" class="ForumPageTableTitle"><strong>作者</strong></th>
						<th width="300" class="ForumPageTableTitle"><strong>回复数</strong></th>
						<th width="3" class="ForumPageTableTitleRight"><img
							border="0" width="1" height="1"
							src="${pageContext.request.contextPath}/style/images/blank.gif" />
						</th>
					</tr>

					<!--主题列表-->
					<!-- <tbody class="dataContainer"> -->

						<c:forEach var="topic" items="${pageBean.recordList}">
							<tr height="35" id="d0" class="template">
								
								<td class="ForumTopicPageDataLine Topic" align="center">
									<img src="${pageContext.request.contextPath}/style/images/topicType_${topic.type}.gif" />
									<a class="Default"
									href="ReplyListServlet?topicId=${topic.id }"><strong>${topic.title}</strong></a>
								</td>
								<!-- <td class="Topic"><a class="Default"
									href="ReplyListServlet?topicId=${topic.id }"><strong>${topic.title}</strong></a></td> -->
								<td class="ForumTopicPageDataLine">
									<ul class="ForumPageTopicUl">
										<li class="Author"><strong>${topic.employee.name}</strong></li>
										<li class="CreateTime"><strong>${topic.postTime}</strong></li>
									</ul></td>
								<td class="ForumTopicPageDataLine Reply" align="center"><b><strong>${topic.replyCount}</strong></b>
								</td>
							</tr>
						</c:forEach>
					<tr>
					<td colspan="8"><div class="pagelist">
							<a href="javascript:search(1,${forum.id })">首页</a> <a
								href="javascript:preFun(${pageBean.pageIndex},${forum.id })"><strong>上一页</strong></a>
							<c:forEach begin="${pageBean.beginPageIndex}"
								end="${pageBean.endPageIndex }" var="num">
								<c:choose>
									<c:when test="${pageBean.pageIndex==num }">
										<span class="current"><strong>${num}</strong></span>
									</c:when>
									<c:otherwise>
										<a href="javascript:search(${num},${forum.id })"><strong>${num}</strong></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<a
								href="javascript:nextFun(${pageBean.pageIndex},${pageBean.countPage},${forum.id })">下一页</a><a
								href="javascript:search(${pageBean.countPage },${forum.id })">尾页</a>
						</div>
					</td>
				</tr>
					<!-- </tbody> -->
					<!--主题列表结束-->
				</table>
				<c:if test="${user.name!='admin' }">
					<div class="pagelist" style="margin-left:-920px;margin-top:-50px">
           				 <a href="TopicAddServlet?forumId=${forum.id }">发表主题</a>
  	 		 		</div>
  	 		 	</c:if>	
			</div>
		</center>
	</div>

	<div class="Description" style="margin-left:30px;">
		<strong>说明：</strong><br /> <p>1，主题默认按最后更新的时间降序排列。最后更新时间是指主题最后回复的时间，如果没有回复，就是主题发表的时间。<br />
		2，帖子有普通、置顶、精华之分。置顶贴始终显示在最上面，精华贴用不同的图标标示。</p>
	</div>
</div>
</body>
<script type="text/javascript">

function search(pageIndex,forumId){
	window.location.href="TopicServlet?forumId="+forumId+"&pageIndex="+pageIndex;
}

function preFun(pageIndex,forumId){
		if(pageIndex<=1){
			layer.msg("已经是第一页了");
		}
		else{
			window.location.href="TopicServlet?forumId="+forumId+"&pageIndex="+(pageIndex-1);
	}
}
	
function nextFun(pageIndex,pageCount,forumId){
		if(pageIndex>=pageCount){
			layer.msg("已经是最后一页了");
		}
		else{
			window.location.href="TopicServlet?forumId="+forumId+"&pageIndex="+(pageIndex+1);
		}
	}
	
</script>
</html>
