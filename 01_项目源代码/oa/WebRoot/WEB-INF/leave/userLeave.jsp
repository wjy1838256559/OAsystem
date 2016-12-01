<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 假条管理 -->
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
</head>
<body>
<div class="panel admin-panel" style="margin-top:20px">
  <table class="table table-hover text-center">
    <tr>
      <th width="10%">假条时间</th>
      <th width="15%">假条内容</th>
      <th width="10%">假条状态</th>
      <th width="10%">操作</th>
    </tr>
    <c:forEach var="Leave" items="${list}">
	    <tr>
	      <td>${Leave.date}</td>
	      <td>${Leave.reason}</td>
	      <td>
	      <c:if test="${Leave.state==1}">待审批</c:if>
	      <c:if test="${Leave.state==2}">审批成功</c:if>
	      <c:if test="${Leave.state==3}">已拒绝</c:if>
	      <c:if test="${Leave.state==4}">已过期</c:if>
	      </td>
	      <td><a class="button border-red" href="javascript:userdelete(${Leave.id})" ><span class="icon-trash-o"></span>忽略</a></td>
	    </tr>
     </c:forEach>
     <div class="panel-head" id="add"><strong><a href="UserLeaveShowServlet"><span class="icon-pencil-square-o" style="margin-left:30px;"></span>添加新假条</a></strong></div>
  </div>
  <tr>
        <td colspan="8"><div class="pagelist"> <a href="javascript:first()">首页</a><a href="javascript:preFun(${pageBean.pageIndex})">上一页</a> 
        <c:forEach begin="${pageBean.beginPageIndex}" end="${pageBean.endPageIndex }" var="num">
        	 <c:choose>
        	 	<c:when test="${pageBean.pageIndex==num }">
        	 		<span class="current">${num}</span>
        	 	</c:when>
        	 	<c:otherwise>
        	 		<a href="UserLeaveServlet?pageIndex=${num}">${num}</a>
        	 	</c:otherwise>
        	 </c:choose>
        </c:forEach> 
        <a  href="javascript:onclick=nextFun(${pageBean.pageIndex},${pageBean.countPage})" >下一页</a><a href="javascript:onclick=last(${pageBean.countPage})">尾页</a> </div></td>
      </tr>
  </table>
</div>

<script type="text/javascript">
function preFun(pageIndex){

		if(pageIndex<=1){
			layer.msg("已经是第一页了");
		}
		else{
		
			location.href="UserLeaveServlet?pageIndex="+(pageIndex-1);
		}
}
	
	function nextFun(pageIndex,pageCounts){
	
		if(pageIndex>=pageCounts){
			layer.msg("已经是最后一页了");
		}
		else{
			window.location.href="UserLeaveServlet?pageIndex="+(pageIndex+1);
		}
}
	
	function first(){
		window.location.href="UserLeaveServlet?pageIndex=1";
}
	
	function last(pageCounts){
		window.location.href="UserLeaveServlet?pageIndex="+pageCounts;
}


function userdelete(id){
	layer.confirm("您确定要忽略吗?", {
		  btn: ["确定","取消"] //按钮
		}, function(){		
	window.location.href="UserLeaveDeleteServlet?id="+id;
	});
}
</script>
</div>
</body>
