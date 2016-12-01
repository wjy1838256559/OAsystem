<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>版块列表</title>
    <style type="text/css">
    	.disabled{
    		color:gray;
    		cursor:pointer;
    	}
    </style>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
<%-- <script language="javascript"
	src="${pageContext.request.contextPath}/script/pageCommon.js"
	charset="utf-8"></script>
<script language="javascript"
	src="${pageContext.request.contextPath}/script/PageUtils.js"
	charset="utf-8"></script> --%>
<%-- <link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/style/blue/pageCommon.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/style/blue/forum.css" /> --%>
</head>
<body>

<div class="panel admin-panel">
<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
        	<div class="panel-head" id="add" style="">
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/>
             <strong><span class="icon-pencil-square-o"></span>版块管理</strong><!-- <a href="" style="float:right;margin-right:50px;font-weight:bold;"><strong>返回</strong></a> --></div>
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle" width="100%" class="table">
       
        <!-- 表头-->
        <!-- <thead> -->
            <tr align="center" valign="MIDDLE" id="TableTitle" style="height:40px;line-height:40px;border-bottom:1px solid #dddddd;">
            	<td width="33%">版块名称</td>
                <td width="33%">版块说明</td>
                <td width="33%">相关操作</td>
            </tr>
        <!-- </thead> -->

		<!--显示数据列表-->
        <!-- <tbody id="TableData" class="dataContainer"> -->
        
        <c:forEach var="forum" items="${pageBean.recordList }" varStatus="status">
			<tr class="TableDetail1 template" align="center" style="height:40px;line-height:40px;border-bottom:1px solid #dddddd;">
				<td>${forum.name}&nbsp;</td>
				<td>${forum.description}&nbsp;</td>
				<td>
					<a href="javascript:delConfirm(${forum.id})">删除</a>
					<a href="ForumOperateServlet?type=show&forumId=${forum.id }">修改</a>
				</td>
			</tr>
        </c:forEach>
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
										<a href="javascript:onclick=search(${num})">${num}</a>
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
    </table>
    
    
    <!-- <!-- 新建按钮 -->
    其他功能超链接
    <div class="pagelist" style="margin-left:-920px;margin-top:-50px">
            <a href="ForumOperateServlet?type=add">新建</a>
    </div> -->
</div>

<div class="Description" style="margin-left:30px;">
	<strong>说明：</strong><br />
	<p>1，显示的列表按其位置排列。<br />
	2，可以通过上移与下移功能调整顺序。最上面的不能上移，最下面的不能下移。<br /></p>
	
</div>

</div>


<script type="text/javascript">
	function delConfirm(id){
		layer.confirm("您确定要删除吗?", {
			  btn: ["确定","取消"] //按钮
			}, function(){
			  window.location.href="ForumOperateServlet?type=delete&forumId="+id;
			});
	}
	
	function search(pageIndex) {
		window.location.href = "ForumServlet?pageIndex=" + pageIndex;
	}

	function preFun(pageIndex) {
		if (pageIndex <= 1) {
			layer.msg("已经是第一页了");
		} else {
			window.location.href = "ForumServlet?pageIndex="
					+ (pageIndex - 1);
		}
	}

	function nextFun(pageIndex, pageCount) {
		if (pageIndex >= pageCount) {
			layer.msg("已经是最后一页了");
		} else {
			window.location.href = "ForumServlet?pageIndex="
					+ (pageIndex + 1);
		}
	}
</script>
</body>
</html>
