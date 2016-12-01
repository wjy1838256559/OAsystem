<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
    <script src="js/jquery-1.8.3.js"></script>
    <script src="js/pintuer.js"></script>  
    <script src="js/layer/layer.js"></script>
  <!--  <styel type="text/css">
   	table tr{height:40px;}
   </styel> -->
</head>
<body>
	 <!-- 这是搜索框 -->
    <div class="searchbox" style="margin-top:20px;margin-bottom:30px;">
    	<select id="sel" style="width:80px;height:39px;margin-left:8px;margin-top:10px;margin-right:-40px;border:1px solid #dddddd;border-radius:5px;" onchange="this.parentNode.nextSibling.value=this.value"  >
           <option value="userId">员工号</option>
           <option value="userName">员工姓名</option>
           
  		</select>

  		<input id="keyword" type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block;margin-left:30px;border-left:none;" />
  		<input id="date" type ="date" name ="checkDate" onfocus="WdatePicker({checkDate:'1980-01-01',alwaysUseStartDate:true})" style="width:140px;height:39px;border:1px solid #dddddd;border-radius:5px;">
          <a href="javascript:postDate()" class="button border-main icon-search" onclick="changesearch()" > 搜索</a>
    </div>
 
	

   
	<!-- 搜索框结束 -->
 
 	
<form method="post" action="">
	
  <div class="panel admin-panel">
   
	<!-- 搜索框结束 -->

    <table class="table table-hover text-center">
      <tr style="height:30px;line-height:30px">
        <th width="33%">员工ID</th>
        <th width="33%">员工姓名</th>     
        <th width="33%">考勤日期</th>  
      </tr> 
        <c:forEach var="check" items="${list}">
        <tr style="height:50px;">
          <td>${check.employee.number}</td>
          <td>${check.employee.name}</td>
          <td>${check.checkDate}</td>
        </tr>
	</c:forEach>
       
      <tr>
        <td colspan="8"><div class="pagelist"> <a href="javascript:first('${requestScope.select}','${requestScope.keywords}','${requestScope.checkDate}')">首页</a><a href="javascript:preFun(${pageBean.pageIndex},'${requestScope.select}','${requestScope.keywords}','${requestScope.checkDate}')">上一页</a> 
        <c:forEach begin="${pageBean.beginPageIndex}" end="${pageBean.endPageIndex }" var="num">
        	 <c:choose>
        	 	<c:when test="${pageBean.pageIndex==num }">
        	 		<span class="current">${num}</span>
        	 	</c:when>
        	 	<c:otherwise>
        	 		<a href="CheckServlet?pageIndex=${num}&select=${requestScope.select}&keywords=${requestScope.keywords}&checkDate=${requestScope.checkDate}">${num}</a>
        	 	</c:otherwise>
        	 </c:choose>
        </c:forEach> 
        <a  href="javascript:onclick=nextFun(${pageBean.pageIndex},${pageBean.countPage},'${requestScope.select}','${requestScope.keywords}','${requestScope.checkDate}')" >下一页</a><a href="javascript:onclick=last(${pageBean.countPage},'${requestScope.select}','${requestScope.keywords}','${requestScope.checkDate}')">尾页</a> </div></td>
      </tr>

    </table>

  </div>
</form>
<script type="text/javascript">
function preFun(pageIndex,select,keywords,checkDate){

		if(pageIndex<=1){
			layer.msg("已经是第一页了");
		}
		else{
		
			location.href="CheckServlet?pageIndex="+(pageIndex-1)+"&select="+select+"&keywords="+keywords+"&checkDate="+checkDate;
		}
}
	
	function nextFun(pageIndex,pageCounts,select,keywords,checkDate){
	
		if(pageIndex>=pageCounts){
			layer.msg("已经是最后一页了");
		}
		else{
			window.location.href="CheckServlet?pageIndex="+(pageIndex+1)+"&select="+select+"&keywords="+keywords+"&checkDate="+checkDate;
		}
}
	
	function first(select,keywords,checkDate){
		window.location.href="CheckServlet?pageIndex=1"+"&select="+select+"&keywords="+keywords+"&checkDate="+checkDate;
}
	
	function last(pageCounts,select,keywords,checkDate){
		window.location.href="CheckServlet?pageIndex="+pageCounts+"&select="+select+"&keywords="+keywords+"&checkDate="+checkDate;
}

function postDate(){
	var checkDate=document.getElementById("date").value;
	var keywords=document.getElementById("keyword").value;
	var select=document.getElementById("sel").value;
	if(checkDate!=null||keywords!=null||select!=null){
	window.location.href="CheckServlet?checkDate="+checkDate+"&keywords="+keywords+"&select="+select;
		
	}
	else{
		layer.msg("请输入关键字");
	}
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
</body></html>
