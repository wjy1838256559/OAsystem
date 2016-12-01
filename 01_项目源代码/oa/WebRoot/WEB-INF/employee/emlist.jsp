<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
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
<style type="text/css">
select {
      /*Chrome和Firefox里面的边框是不一样的，所以复写了一下*/
      border: solid 1px #000;
      /*很关键：将默认的select选择框样式清除*/
      appearance:none;
      -moz-appearance:none;
      -webkit-appearance:none;

      /*加padding防止文字覆盖*/
      padding-right: 14px;
      }
      /*清除ie的默认选择框样式清除，隐藏下拉箭头*/
    select::-ms-expand { display: none; }
</style>
<script type="text/javascript">

	function search(pageIndex){
		var val=document.getElementById("selecttype").value;
		var key=document.getElementById("keywords").value;
		if(val=="all" || key=="" || key==null){
			window.location.href="EmployeeListServlet?pageIndex="+pageIndex;
		}else{
			if(val=="number" && key!=""){
				window.location.href="EmployeeListServlet?type=number&key="+key+"&pageIndex="+pageIndex;
			}else if(val=="name" && key!=""){
				window.location.href="EmployeeListServlet?type=name&key="+key+"&pageIndex="+pageIndex;
			}else if(val=="sName" && key!=""){
				window.location.href="EmployeeListServlet?type=sName&key="+key+"&pageIndex="+pageIndex;
			}else{
				layer.msg("请输入搜索关键字");
				return;
			}
		}
		
	}
	
	function preFun(pageIndex){
		var val=document.getElementById("selecttype").value;
		var key=document.getElementById("keywords").value;
		if(pageIndex<=1){
			layer.msg("已经是第一页了");
			return;
		}else{
			if(val=="all" || key=="" || key==null){
				window.location.href="EmployeeListServlet?pageIndex="+(pageIndex-1);
			}else{
				if(val=="number" && key!=""){
					window.location.href="EmployeeListServlet?type=number&key="+key+"&pageIndex="+(pageIndex-1);
				}else if(val=="name" && key!=""){
					window.location.href="EmployeeListServlet?type=name&key="+key+"&pageIndex="+(pageIndex-1);
				}else if(val=="sName" && key!=""){
					window.location.href="EmployeeListServlet?type=sName&key="+key+"&pageIndex="+(pageIndex-1);
				}else{
					layer.msg("请输入搜索关键字");
					return;
				}
		}
	}
}
	
	function nextFun(pageIndex,countPage){
		var val=document.getElementById("selecttype").value;
		var key=document.getElementById("keywords").value;
		if(pageIndex>=countPage){
			layer.msg("已经是尾页了");
			return;
		}else{
			if(val=="all" || key=="" || key==null){
			window.location.href="EmployeeListServlet?pageIndex="+(pageIndex+1);
			}else{
				if(val=="number" && key!=""){
					window.location.href="EmployeeListServlet?type='number'&key="+"''"+key+"''"+"&pageIndex="+(pageIndex+1);
				}else if(val=="name" && key!=""){
					window.location.href="EmployeeListServlet?type=name&key="+key+"&pageIndex="+(pageIndex+1);
				}else if(val=="sName" && key!=""){
					window.location.href="EmployeeListServlet?type=sName&key="+key+"&pageIndex="+(pageIndex+1);
				}else{
					layer.msg("请输入搜索关键字");
					return;
				}
		}
	}
}
	
	function del(id){
		layer.confirm("您确定要删除吗?", {
			  btn: ["确定","取消"] //按钮
			}, function(){
			  window.location.href="EmployeeDeleteServlet?id="+id;
			});
	}
	
	function init(id){
		layer.confirm("您确定要初始化密码吗?", {
			  btn: ["确定","取消"] //按钮
			}, function(){
				window.location.href="InitPwdServlet?id="+id;
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
</head>
<body>
	<!-- 这是搜索框 -->
	<div class="searchbox" style="margin-top:20px;margin-bottom:30px;">
		<select
			style="width:90px;height:39px;margin-left:8px;margin-top:10px;margin-right:-40px;border:1px solid #dddddd;border-radius:5px;"
			onchange="this.parentNode.nextSibling.value=this.value"
			id="selecttype">
			<option value="all" selected>所有</option>
			<option value="number"
				<c:if test="${type=='number' }">selected</c:if>>员工号</option>
			<option value="name" <c:if test="${type=='name' }">selected</c:if>>员工姓名</option>
			<option value="sName" <c:if test="${type=='sName' }">selected</c:if>>岗位名称</option>
		</select> <input type="text" id="keywords" placeholder="请输入搜索关键字"
			value="${key }" name="keywords" class="input"
			style="width:250px; line-height:17px;display:inline-block;margin-left:30px;border-left:none;" />
		<a href="javascript:search(1)" class="button border-main icon-search">
			搜索</a>
	</div>

	<form method="post" action="">

		<div class="panel admin-panel">

			<!-- 搜索框结束 -->

			<table class="table table-hover text-center">
				<tr>
					<th width="120">ID</th>
					<th>姓名</th>
					<th>员工号</th>
					<th>电话</th>
					<th>职位</th>
					<th>入职时间</th>
					<th>操作</th>
				</tr>
				<c:forEach var="em" items="${pageBean.recordList}">
					<tr>
						<td>${em.id }</td>
						<td>${em.name }</td>
						<td>${em.number }</td>
						<td>${em.phoneNumber }</td>
						<td>${em.station.sName }</td>
						<td>${em.startDate }</td>
						<td><div class="button-group">
								<a class="button border-main"
									href="EmployeeShowServlet?id=${em.id }"><span
									class="icon-edit"></span> 更新</a> <a class="button border-green"
									href="javascript:void(0)" onclick="return init(${em.id})"><span
									class="icon-trash-o"></span> 初始化密码</a><a class="button border-red"
									href="javascript:void(0)" onclick="return del(${em.id})"><span
									class="icon-trash-o"></span> 删除</a>
							</div>
						</td>
					</tr>
				</c:forEach>
				
				
			</table>
		</div>
		<div class="panel-head" id="add" style="float:left;"><strong><a href="EmployeeShowServlet"><span class="icon-pencil-square-o" style="margin-left:30px;"></span>添加员工</a></strong></div>
	<div class="pagelist">
  <table class="table table-hover text-center">
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
 </table>
  </div>
		
	</form>
</body>
</html>