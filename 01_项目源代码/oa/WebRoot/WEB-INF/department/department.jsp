<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<script type="text/javascript" src="js/layer/layer.js"></script>
</head>
<body>
	<!-- 这是搜索框 -->
	<div class="searchbox" style="margin-top:20px;margin-bottom:30px;">
		<label style="margin-left: 10px">部门名称:</label> <input type="text"
			id="keywords" placeholder="请输入搜索关键字" value="${key}" name="keywords"
			class="input"
			style="width:250px; line-height:17px;display:inline-block;margin-left:30px;" />
		<a href="javascript:search(1)" class="button border-main icon-search">
			搜索</a>
	</div>

	<form method="post" action="DepartmentServlet">

		<div class="panel admin-panel">

			<!-- 搜索框结束 -->

			<table class="table table-hover text-center">
				<tr>
					<th>部门ID</th>
					<th>部门名称</th>
					<th>部门描述</th>
					<th>操作</th>
				</tr>
				<c:forEach var="depart" items="${pageBean.recordList}">
					<tr>
						<td>${depart.id}</td>
						<td>${depart.dName}</td>
						<td>${depart.description}</td>
						<td><div class="button-group">
								<a class="button border-main"
									href="DepartmentUpdateServlet?id=${depart.id}"><span
									class="icon-edit"></span> 更新</a>
							</div></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="12">
					<div class="panel-head" id="add" style="float:left;"><strong><a href="DepartmentShowServlet"><span class="icon-pencil-square-o" style="margin-left:30px;"></span>添加部门</a></strong></div></td>
				</tr>
				<tr>
					<td colspan="8">
					<div class="pagelist">
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
						</div></td>
				</tr>
				</tr>
			</table>
		</div>
		
		
	</form>
	<script type="text/javascript">

function search(pageIndex){
	var key=document.getElementById("keywords").value;
	if(key==""){
		window.location.href="DepartmentServlet?pageIndex="+pageIndex;
	}else{
		window.location.href="DepartmentServlet?type=dName&key="+key+"&pageIndex"+pageIndex;
	}
}

function preFun(pageIndex){
		if(pageIndex<=1){
			layer.msg("已经是第一页了");
		}
		else{
			var key=document.getElementById("keywords").value;
			if(key==""){
				window.location.href="DepartmentServlet?pageIndex="+(pageIndex-1);
			}else{
				window.location.href="DepartmentServlet?type=dName&key="+key+"&pageIndex="+(pageIndex-1);
		}
	}
	}
	
function nextFun(pageIndex,pageCount){
		if(pageIndex>=pageCount){
			layer.msg("已经是最后一页了");
		}
		else{
			var key=document.getElementById("keywords").value;
			if(key==""){
				window.location.href="DepartmentServlet?pageIndex="+(pageIndex+1);
			}else{
				window.location.href="DepartmentServlet?type=dName&key="+key+"&pageIndex="+(pageIndex+1);
			}
		}
	}
	
function del(id){
	layer.confirm("您确定要删除吗?", {
			  btn: ["确定","取消"] //按钮
			}, function(){
			  window.location.href="DepartmentDeleteServlet?id="+id;
			});
}

$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false; 		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}
</script>
</body>
</html>
