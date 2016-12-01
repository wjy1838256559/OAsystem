<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
<script src="js/jquery-1.8.3.js"></script>
<script src="js/pintuer.js"></script>
<script src="js/layer/layer.js"></script>

</head>
<body>
	<!-- 这是搜索框 -->
	<div class="searchbox" style="margin-top:20px;margin-bottom:30px;">
		绩效起始日期 <input id="date" type="date" name="startDate"
			onfocus="WdatePicker({startDate:'1980-01-01',alwaysUseStartDate:true})"
			style="width:140px;height:39px;border:1px solid #dddddd;border-radius:5px;">
		<a href="javascript:postDate(${user.id})"
			class="button border-main icon-search" onclick="changesearch()">
			搜索</a>
	</div>




	<!-- 搜索框结束 -->

	<table class="table table-hover text-center">
		<tr>
			<th width="120">员工号</th>
			<th>员工姓名</th>
			<th>绩效起始日期</th>
			<th>当月期望值</th>
			<th>当月完成值</th>
			<th>完成进度</th>
			<th>审批状态</th>
			<th>提醒内容</th>
		</tr>
		<c:forEach var="performance" items="${list}">
			<tr>
				<td>${performance.employee.number}</td>
				<td>${performance.employee.name}</td>
				<td>${performance.startDate}</td>
				<td>${performance.expectNum}</td>
				<td>${performance.finishNum}</td>
				<td>${performance.finishNum}/${performance.expectNum}</td>
				<td><c:choose>
						<c:when test="${performance.state==0}">
           <span style="color: red">未被审批</span>	
           </c:when>
						<c:otherwise>
						 <span style="color: blue">已被审批</span>	
           </c:otherwise>
					</c:choose></td>
				<td><c:choose>
						<c:when test="${performance.repState==0}">
                        工作进度完成的不错
           </c:when>
						<c:otherwise>
                        需要加快工作进度了
           </c:otherwise>
					</c:choose></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8"><div class="pagelist">
					<a href="javascript:first('${requestScope.startDate}',${user.id})">首页</a><a
						href="javascript:preFun(${pageBean.pageIndex},'${requestScope.startDate}',${user.id})">上一页</a>
					<c:forEach begin="${pageBean.beginPageIndex}"
						end="${pageBean.endPageIndex }" var="num">
						<c:choose>
							<c:when test="${pageBean.pageIndex==num }">
								<span class="current">${num}</span>
							</c:when>
							<c:otherwise>
								<a
									href="PerformanceServlet?pageIndex=${num}&startDate=${requestScope.startDate}&userId=${user.id}">${num}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<a
						href="javascript:onclick=nextFun(${pageBean.pageIndex},${pageBean.countPage},'${requestScope.startDate}',${user.id})">下一页</a><a
						href="javascript:onclick=last(${pageBean.countPage},'${requestScope.startDate}',${user.id})">尾页</a>
				</div></td>
		</tr>
	</table>

	<script type="text/javascript">
function preFun(pageIndex,startDate,userId){

		if(pageIndex<=1){
			layer.msg("已经是第一页了");
		}
		else{
		
			location.href="UserPerformanceServlet?pageIndex="+(pageIndex-1)+"&startDate="+startDate+"&userId="+userId;
		}
}
	
	function nextFun(pageIndex,pageCounts,startDate,userId){
	
		if(pageIndex>=pageCounts){
			layer.msg("已经是最后一页了");
		}
		else{
			window.location.href="UserPerformanceServlet?pageIndex="+(pageIndex+1)+"&startDate="+startDate+"&userId="+userId;
		}
}
	
	function first(startDate,userId){
		window.location.href="UserPerformanceServlet?pageIndex=1"+"&startDate="+startDate+"&userId="+userId;
}
	
	function last(pageCounts,startDate,userId){
		window.location.href="UserPerformanceServlet?pageIndex="+pageCounts+"&startDate="+startDate+"&userId="+userId;
}

function postDate(userId){
	var startDate=document.getElementById("date").value;
	if(startDate!=null){
	window.location.href="UserPerformanceServlet?startDate="+startDate+"&userId="+userId;
	}
	else{
		layer.msg("请输入关键字");
	}
}




// 提醒
$(".tixing").on('click',function(){
	//提示层
layer.msg('提醒成功！');

})



//设置期望值
$(".shezhi").on('click',function(){

	layer.config({
                extend: 'extend/layer.ext.js'
            });
		  layer.prompt({
		  formType: 0,
		  value: '',
		  title: '请输入期望值'
		}, function(value, index, elem){
		  
		  layer.close(index);
		});

})



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
