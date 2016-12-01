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
</head>
<body>

	 <!-- 这是搜索框 -->
    <div class="searchbox" style="margin-top:20px;margin-bottom:30px;">
    	<select id="sel" style="width:80px;height:39px;margin-left:8px;margin-top:10px;margin-right:-40px;border:1px solid #dddddd;border-radius:5px;" onchange="this.parentNode.nextSibling.value=this.value"  >
           <option value="userId">员工号</option>
           <option value="userName">员工姓名</option>
           
  		</select>

  		<input id="keyword" type="text" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block;margin-left:30px;border-left:none;" />
  		
  		<input id="date" type ="date" name ="startDate" onfocus="WdatePicker({startDate:'1980-01-01',alwaysUseStartDate:true})" style="width:140px;height:39px;border:1px solid #dddddd;border-radius:5px;">
  		
          <a href="javascript:postDate()" class="button border-main icon-search" onclick="changesearch()" > 搜索</a>
    </div>
 
	

 <div class="panel admin-panel" style="margin-top:20px">  
	<!-- 搜索框结束 -->

    <table class="table table-hover text-center">
      <tr>
        <th width="120">员工号</th>
        <th>员工姓名</th>
	    <th>绩效起始日期</th>       
        <th>当月期望值</th>
        <th>当月完成值</th>
        <th>完成进度</th>
        <th>操作</th>       
      </tr>      
        <c:forEach var="performance" items="${list}">
          <tr>
           <td>${performance.employee.number}</td>
          <td>${performance.employee.name}</td>
	      <td>${performance.startDate}</td>
          <td>${performance.expectNum}</td>
          <td>${performance.finishNum}</td>  
           <td>${performance.finishNum}/${performance.expectNum}</td>        
        
           <td><div class="button-group"> 
           <c:choose>
           <c:when test="${performance.state==0}">
           <a class="button border-main shenpi" href="PerformanceApproveServlet?id=${performance.id}" onclick=""><span class="icon-eye"></span> 审批</a>
           </c:when>
           <c:otherwise>
           <a class="button border-main shenpi" onclick="" style="disabled"><span class="icon-eye"></span> 已审批</a>
           </c:otherwise>
           </c:choose>
           <a class="button border-green shezhi" href="PerformanceUpdateServlet?eId=${performance.employee.id}" onclick=""><span class="icon-edit"></span> 设置期望值</a> 
           
           <c:choose>
           <c:when test="${performance.repState==0}">
           <a class="button border-red tixing" href="PerformanceReplyServlet?id=${performance.id}" onclick=""><span class="icon-send"></span> 提醒</a>
           </c:when>
           <c:otherwise>
           <a class="button border-red tixing" onclick="" style="disabled"><span class="icon-send"></span> 已提醒</a>
           </c:otherwise>
           </c:choose>
             </div></td>
        </tr>
        </c:forEach>
        <tr>
        <td colspan="8"><div class="pagelist"> <a href="javascript:first('${requestScope.select}','${requestScope.keywords}','${requestScope.startDate}')">首页</a><a href="javascript:preFun(${pageBean.pageIndex},'${requestScope.select}','${requestScope.keywords}','${requestScope.startDate}')">上一页</a> 
        <c:forEach begin="${pageBean.beginPageIndex}" end="${pageBean.endPageIndex }" var="num">
        	 <c:choose>
        	 	<c:when test="${pageBean.pageIndex==num }">
        	 		<span class="current">${num}</span>
        	 	</c:when>
        	 	<c:otherwise>
        	 		<a href="PerformanceServlet?pageIndex=${num}&select=${requestScope.select}&keywords=${requestScope.keywords}&startDate=${requestScope.startDate}">${num}</a>
        	 	</c:otherwise>
        	 </c:choose>
        </c:forEach> 
        <a  href="javascript:onclick=nextFun(${pageBean.pageIndex},${pageBean.countPage},'${requestScope.select}','${requestScope.keywords}','${requestScope.startDate}')" >下一页</a><a href="javascript:onclick=last(${pageBean.countPage},'${requestScope.select}','${requestScope.keywords}','${requestScope.startDate}')">尾页</a> </div></td>
      </tr>
    </table>
</div>
 <script type="text/javascript">
function preFun(pageIndex,select,keywords,startDate){

		if(pageIndex<=1){
			layer.msg("已经是第一页了");
		}
		else{
		
			location.href="PerformanceServlet?pageIndex="+(pageIndex-1)+"&select="+select+"&keywords="+keywords+"&startDate="+startDate;
		}
}
	
	function nextFun(pageIndex,pageCounts,select,keywords,startDate){
	
		if(pageIndex>=pageCounts){
			layer.msg("已经是最后一页了");
		}
		else{
			window.location.href="PerformanceServlet?pageIndex="+(pageIndex+1)+"&select="+select+"&keywords="+keywords+"&startDate="+startDate;
		}
}
	
	function first(select,keywords,startDate){
		window.location.href="PerformanceServlet?pageIndex=1"+"&select="+select+"&keywords="+keywords+"&startDate="+startDate;
}
	
	function last(pageCounts,select,keywords,startDate){
		window.location.href="PerformanceServlet?pageIndex="+pageCounts+"&select="+select+"&keywords="+keywords+"&startDate="+startDate;
}

function postDate(){
	var startDate=document.getElementById("date").value;
	var keywords=document.getElementById("keyword").value;
	var select=document.getElementById("sel").value;
	if(startDate!=null||keywords!=null||select!=null){
	window.location.href="PerformanceServlet?startDate="+startDate+"&keywords="+keywords

+"&select="+select;
		
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
		layer.msg("请选择您要删除的内容!");
		return false;
	}
}



</script>
</body></html>
