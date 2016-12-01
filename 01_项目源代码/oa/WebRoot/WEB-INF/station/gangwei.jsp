<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 岗位管理 -->
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
      <th width="10%">岗位名称</th>
      <th width="15%">所属部门</th>
      <th width="10%">岗位描述</th>
      <th width="10%">操作</th>
    </tr>
    <c:forEach var="station" items="${pageBean.recordList}">
	    <tr>
	      <td>${station.sName}</td>
	      <td>${station.department.dName}</td>
	      <td>${station.description}</td>
	      <td><div class="button-group"> <a class="button border-main" href="javascript:updateFun(${station.id})"><span class="icon-edit"></span>修改</a> <a class="button border-red" href="javascript:deleteFun(${station.id})" ><span class="icon-trash-o"></span>删除</a> </div></td>
	    </tr>
     </c:forEach>
  </table>
</div>
<div class="panel-head" id="add"><strong><a href="StationShowServlet"><span class="icon-pencil-square-o" style="margin-left:30px;"></span>添加岗位</a></strong></div>
  <div class="pagelist">
  <table class="table table-hover text-center">
  	<tr>
        <td colspan="8"><div class="pagelist"><a href="StationServlet?pageIndex=1">首页</a> <a href="javascript:preFun(${pageBean.pageIndex})">上一页</a>
        <c:forEach begin="${pageBean.beginPageIndex}" end="${pageBean.endPageIndex }" var="num">
        	 <c:choose>
        	 	<c:when test="${pageBean.pageIndex==num }">
        	 		<span class="current">${num}</span>
        	 	</c:when>
        	 	<c:otherwise>
        	 		<a href="StationServlet?pageIndex=${num}">${num}</a>
        	 	</c:otherwise>
        	 </c:choose>
        </c:forEach>
         <a href="javascript:nextFun(${pageBean.pageIndex},${pageBean.countPage})">下一页</a><a href="StationServlet?pageIndex=${pageBean.countPage }">尾页</a> </div></td>
 	</tr>
 </table>
  </div>
<script type="text/javascript">
function deleteFun(id){
	layer.confirm("您确定要删除吗?", {
		  btn: ["确定","取消"] //按钮
		}, function(){			
		window.location.href="StationDeleteServlet?id="+id;
	});
}
function preFun(pageIndex){
  		if(pageIndex<=1){
  			layer.msg("已经是第一页了");
  		}else{
  			window.location.href="StationServlet?pageIndex="+(pageIndex-1);
  		}
  	}
function nextFun(pageIndex,countPage){
  		if(pageIndex>= countPage){
  			layer.msg("已经是尾页了");
  		}else{
  			window.location.href="StationServlet?pageIndex="+(pageIndex+1);
  		}
  	}
  	function updateFun(id){
  	        window.location.href="StationUpdateServlet?id="+id;
  	}
  
</script>
</div>
</body>
