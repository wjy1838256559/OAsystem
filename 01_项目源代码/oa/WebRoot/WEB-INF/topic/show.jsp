<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
<title>查看主题：${topic.title}</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
    <style>
    	.zhutie{border: 1px solid #dddddd;}
		.zhutie tr{
			border: 1px solid #dddddd;
			/*margin-bottom: 20px;*/
			/*margin-top: 30px;*/
		}
    </style>
</head>
<body>
<div class="panel admin-panel">
			<div id="Title">
				<!--页面标题-->
				<div class="panel-head" id="add" style="">
				<img border="0" width="13" height="13"
					src="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
					<strong><span class="icon-pencil-square-o"></span>
				查看主题</strong><!-- <a href="" style="float:right;margin-right:50px;font-weight:bold;"><strong>返回</strong></a> --></div>
			</div>

			<div class="ItemBlock_Title1" style="float:left;margin-left:30px;margin-top:15px;margin-bottom:15px;">
				<font class="MenuPoint"> <strong>&gt;</strong> </font>
				<a href="ForumShowServlet"><strong>论坛</strong></a>
				<font class="MenuPoint"><strong>&gt;</strong>  </font>
				<a href="TopicServlet?forumId=${sessionScope.forumId}"><strong>${topic.title}</strong></a>
				<font class="MenuPoint"><strong>&gt; </strong> </font> <strong>帖子阅读 </strong>
			</div>


				<!--显示主题标题等-->
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-top:1px solid #dddddd;">
					<tr valign="bottom" style="height:40px;border-bottom:1px solid #dddddd;"  valign="middle">
						<td width="35" class="ForumPageTableTitleLeft">&nbsp;</td>
						<td class="ForumPageTableTitle" valign="middle"><b><strong>本帖主题：${topic.title}</strong></b>
						</td>
						<td class="ForumPageTableTitle" valign="middle" align="right"
							style="padding-right:12px;">
						<c:if test="${user.name!='admin' }">
							<a class="detail" href="ReplyAddServlet?topicId=${topic.id }">
								<strong>回复</strong>
							</a> 
						</c:if>
						<c:if test="${user.name=='admin' }">
							<a href="TopicUpdateServlet?type=1&topicId=${topic.id }" onClick="return confirm('要把本主题设为精华吗？')"><img
								border="0"
								src="${pageContext.request.contextPath}/style/images/topicType_1.gif" /><strong>精华</strong></a>
							<a href="TopicUpdateServlet?type=2&topicId=${topic.id }" onClick="return confirm('要把本主题设为置顶吗？')"><img
								border="0"
								src="${pageContext.request.contextPath}/style/images/topicType_2.gif" /><strong>置顶</strong></a>
							<a href="TopicUpdateServlet?type=0&topicId=${topic.id }" onClick="return confirm('要把本主题设为普通吗？')"><img
								border="0"
								src="${pageContext.request.contextPath}/style/images/topicType_0.gif" /><strong>普通</strong></a>
						</c:if>
						</td>
						<td width="3" class="ForumPageTableTitleRight">&nbsp;</td>
					</tr>
					<tr height="1" class="ForumPageTableTitleLine">
						<td colspan="4"></td>
					</tr>
				</table>

				<!-- ~~~~~~~~~~~~~~~ 显示主帖（主帖只在第1页显示） ~~~~~~~~~~~~~~~ -->
				<c:if test="${pageBean.pageIndex==1 } ">
					<!-- <div class="ListArea"> -->
						<table border="0" cellpadding="0" cellspacing="1" width="100%" class="zhutie">
							<tr>
								<td rowspan="3" width="130" class="PhotoArea" align="center"
									>
									<!--作者头像-->
									<div class="AuthorPhoto">
										<img border="0" width="110" height="110"
											src="ImageShowServlet?img=${topic.empoyee.img }"
											onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/style/images/defaultAvatar.gif';" />
									</div> <!--作者名称-->
									<div class="AuthorName" style=""><strong>${topic.empoyee.name}</strong></div></td>
								<td>
									<ul class="TopicFunc">
										<!-- 文章的标题 -->
										<li class="TopicSubject" style="height:30px;border-bottom:1px solid #dddddd;"><strong>${topic.title}</strong>
									<div style="float:right;margin-right:15px;">
										<a class="detail" href="ReplyDeleteServlet?replyId=${reply.id }"
											onClick="return confirm('确定要删除本帖吗？')" style="display:block;"><img border="0"
												src="${pageContext.request.contextPath}/style/images/delete.gif" style="display:block"/><strong>删除</strong></a><br />
									</div>
										</li>
										<li><div class="Content" style="height:auto;margin-top:10px;">${topic.content}</div></li>
									</ul>
									
								</td>
							</tr>
							<tr>
								<!--显示楼层等信息-->
								<td class="Footer" height="28" align="center" valign="bottom">
									<ul style="margin-top:20px; width: 98%;">
										<li style="float: left; line-height:18px;"><font
											color=#C30000>[楼主]</font> ${topic.postTime}</li>
										<li style=""><a
											href="javascript:scroll(0,0)"> <img border="0"
												src="${pageContext.request.contextPath}/style/images/top.gif" />
										</a></li>
									</ul>
								</td>
							</tr>
						</table>
					<!-- </div> -->
				</c:if>
				<!-- ~~~~~~~~~~~~~~~ 显示主帖结束 ~~~~~~~~~~~~~~~ -->


				<!-- ~~~~~~~~~~~~~~~ 显示回复列表 ~~~~~~~~~~~~~~~ -->
					<!-- <div class="ListArea template"> -->
					<c:forEach var="reply" items="${pageBean.recordList }" varStatus="status">
			<table border="0" cellpadding="0" cellspacing="1" width="100%" class="zhutie" style="margin-top:10px;">
							<tr>
								<td rowspan="3" width="130" class="PhotoArea" align="center"
									valign="top">
									<!--作者头像-->
									<div class="AuthorPhoto">
										<img border="0" width="110" height="110"
											src="ImageShowServlet?image=${reply.employee.image }"
											onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/style/images/defaultAvatar.gif';" />
									</div>
									<div class="AuthorName" style="text-align:center;"><strong>${reply.employee.name}</strong></div>
									 <!--作者名称-->
									</td>
								<td>
									<ul class="TopicFunc">
										<!-- 文章表情与标题 -->
										<li class="TopicSubject" style="height:30px;line-height:30px;border-bottom:1px solid #dddddd;">
											
											<strong>${reply.title}</strong>
											<c:if test="${user.name=='admin' }">
												<div style="float:right;margin-right:15px;">
													<a class="detail" href="ReplyDeleteServlet?replyId=${reply.id }"
												onClick="return confirm('确定要删除本帖吗？')">删除</a>
												</div>
											</c:if>
										</li>
										<li>
											<div class="Content" style="height:auto;margin-top:10px;">${reply.content}</div>
										</li>
									</ul>
								</td>
							</tr>
							<tr>
								<!--显示楼层等信息-->
								<td class="Footer" height="28" align="left" valign="">
									<ul style="margin: 0px; width: 98%;">
										<li style=" line-height:18px;"><font
											color=#C30000>[${(pageBean.pageIndex-1)*(pageBean.pageSize)+status.count}楼]</font>
											${reply.postTime}</li>
									</ul>
								</td>
							</tr>
				
				</table>
				</c:forEach>
				
				
				
				<center>
				<table style="">
					<tr>
					<td colspan="8">
					<div class="pagelist">
							<a href="javascript:search(1,${topic.id })">首页</a> <a
								href="javascript:preFun(${pageBean.pageIndex},${topic.id })"><strong>上一页</strong></a>
							<c:forEach begin="${pageBean.beginPageIndex}"
								end="${pageBean.endPageIndex }" var="num">
								<c:choose>
									<c:when test="${pageBean.pageIndex==num }">
										<span class="current"><strong>${num}</strong></span>
									</c:when>
									<c:otherwise>
										<a href="javascript:search(${num},${topic.id })"><strong>${num}</strong></a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<a
								href="javascript:nextFun(${pageBean.pageIndex},${pageBean.countPage},${topic.id })">下一页</a><a
								href="javascript:search(${pageBean.countPage },${topic.id })">尾页</a>
						</div>
					</td>
				</tr>
						</table></center>
					<!-- </div> -->
				<!-- ~~~~~~~~~~~~~~~ 显示回复列表结束 ~~~~~~~~~~~~~~~ -->
			<!-- </div> -->
	
<!-- </div> -->

	<div class="Description" style="margin-left:30px;">
		<strong>说明：</strong><br /> <p>1，主帖只在第一页显示。<br />
		2，只有是管理员才可以进行“删除”、“精华”、“置顶”的操作。<br /></p>
	</div>
</div>
<script type="text/javascript">
function search(pageIndex,topicId){
	window.location.href="ReplyListServlet?topicId="+topicId+"&pageIndex="+pageIndex;
}

function preFun(pageIndex,topicId){
		if(pageIndex<=1){
			layer.msg("已经是第一页了");
		}
		else{
			window.location.href="ReplyListServlet?topicId="+topicId+"&pageIndex="+(pageIndex-1);
	}
}
	
function nextFun(pageIndex,pageCount,topicId){
		if(pageIndex>=pageCount){
			layer.msg("已经是最后一页了");
		}
		else{
			window.location.href="ReplyListServlet?topicId="+topicId+"&pageIndex="+(pageIndex+1);
		}
	}
	
</script>
</body>

</html>
