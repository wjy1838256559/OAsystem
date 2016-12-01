<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>论坛</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/style/blue/forum.css" />
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
</head>
<body>
	<div id="Title_bar">
		<div id="Title_bar_Head">
			<div id="Title_Head"></div>
			<div id="Title">
				<!--页面标题-->
				<img border="0" width="13" height="13"
					src="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
				论坛
			</div>
			<div id="Title_End"></div>
		</div>
	</div>
	<div id="MainArea">
		<center>
			<div class="ForumPageTableBorder" style="margin-top: 25px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<!--表头-->
					<tr align="center" valign="middle">
						<td colspan="3" class="ForumPageTableTitleLeft">版块</td>
						<td width="80" class="ForumPageTableTitle">主题数</td>
						<td width="80" class="ForumPageTableTitle">文章数</td>
						<td width="270" class="ForumPageTableTitle">最后发表的主题</td>
					</tr>
					<tr height="1" class="ForumPageTableTitleLine">
						<td colspan="9"></td>
					</tr>
					<tr height="3">
						<td colspan="9"></td>
					</tr>

					<!--版面列表-->
					<tbody class="dataContainer">

						<c:forEach var="forum" items="${pageBean.recordList }">
							<tr height="78" align="center" class="template">
								<td width="3"></td>
								<td width="75" class="ForumPageTableDataLine"><img
									src="${pageContext.request.contextPath}/style/images/forumpage3.gif" />
								</td>
								<td class="ForumPageTableDataLine">
									<ul class="ForumPageTopicUl">
										<li class="ForumPageTopic"><a class="ForumPageTopic"
											href="ForumServlet?forumId=${forum.id }">${forum.name}</a>
										</li>
										<li class="ForumPageTopicMemo">${forum.description}</li>
									</ul></td>
								<td class="ForumPageTableDataLine"><b>${forum.topicCount}</b>
								</td>
								<td class="ForumPageTableDataLine"><b>${forum.articleCount}</b>
								</td>
							</tr>
						</c:forEach>
						<!--显示数据列表-->
						<tr>
							<td colspan="8"><div class="pagelist">
									<a href="javascript:search(1)">首页</a> <a
										href="javascript:preFun(${pageBean.pageIndex})">上一页</a>
									<c:forEach begin="${pageBean.beginPageIndex}"
										end="${pageBean.endPageIndex }" var="num">
										<c:choose>
											<c:when test="${pageBean.pageIndex==num }">
												<span class="current">${num}</span>
											</c:when>
											<c:otherwise>
												<a href="javascript:search(${num})">${num}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<a
										href="javascript:nextFun(${pageBean.pageIndex},${pageBean.countPage})">下一页</a><a
										href="javascript:search(${pageBean.countPage })">尾页</a>
								</div>
							</td>
						</tr>
					</tbody>
					<!-- 版面列表结束 -->

					<tr height="3">
						<td colspan="9"></td>
					</tr>
				</table>
			</div>

		</center>
	</div>
</body>
</html>

<script type="text/javascript">
	function search(pageIndex) {
		window.location.href = "ForumShowServlet?pageIndex=" + pageIndex;
	}

	function preFun(pageIndex) {
		if (pageIndex <= 1) {
			layer.msg("已经是第一页了");
		} else {
			window.location.href = "ForumShowServlet?pageIndex="
					+ (pageIndex - 1);
		}
	}

	function nextFun(pageIndex, pageCount) {
		if (pageIndex >= pageCount) {
			layer.msg("已经是最后一页了");
		} else {
			window.location.href = "ForumShowServlet?pageIndex="
					+ (pageIndex + 1);
		}
	}
</script>
</body>
</html>
