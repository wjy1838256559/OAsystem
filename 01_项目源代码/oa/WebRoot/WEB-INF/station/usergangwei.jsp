<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 岗位管理 -->
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel" style="margin-top:20px">

		<table class="table table-hover text-center">
			<tr>
				<th width="10%">员工号</th>
				<th width="10%">岗位名称</th>
				<th width="15%">所属部门</th>
				<th width="10%">岗位描述</th>
			</tr>
			<tr>
				<td>${user.number}</td>
				<td>${user.station.sName}</td>
				<td>${user.station.department.dName}</td>
				<td>${user.station.description}</td>
			</tr>
		</table>
	</div>
	<div class="pagelist"></div>
	<script type="text/javascript">
function deleteFun(id){
	if(confirm("您确定要删除吗?")){			
	window.location.href="StationDeleteServlet?id="+id;
	}else{
		window.back(-1);
	}
}
function preFun(pageIndex){
  		if(pageIndex<=1){
  			alert("已经是第一页了");
  		}else{
  			window.location.href="StationServlet?pageIndex="+(pageIndex-1);
  		}
  	}
function nextFun(pageIndex,countPage){
  		if(pageIndex>= countPage){
  			alert("已经是尾页了");
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