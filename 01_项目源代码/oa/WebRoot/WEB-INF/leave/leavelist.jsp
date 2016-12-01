	<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 假条审批界面，代码上下均有修改，还有引用文件 -->
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
<script src="js/layer/layer.js"></script>

</head>
<body>
<div class="panel admin-panel">
  <table class="table table-hover text-center" style="margin-top:30px;">
    <tr>
      <th width="10%">员工号</th>
      <th width="10%">员工姓名</th>
      <th width="10%">请假日期</th>
      <th width="10%">状态</th>
      <!-- 状态有四种，待审批，通过，拒绝，过期 -->
      <th width="10%">操作</th>
    </tr>
    <c:forEach var="leave" items="${pageBean.recordList}">
    <tr>
      <td style="display:none">${leave.id}</td>
      <td>${leave.employee.number}</td>
      <td>${leave.employee.name}</td>
      <td>${leave.date}</td>
      <td>${leave.stateName}</td>
      <td><div class="button-group"> <a class="button border-main look" href="javascript:onclick=show(${leave.id})" >
      <span class="icon-eye"></span> 查看</a>
      <c:if test="${leave.state==1 }">
	      <a class="button border-red delete" href="javascript:onclick=tan(${leave.id})" style="margin-left:3px">
     	 <span class="icon-trash-o"></span>忽略</a> 
      </c:if> 
      </div>
      </td>
    </tr>
    </c:forEach>
  </table>

</div>

  <div class="pagelist"> <a href="LeaveListServlet?pageIndex=1">首页</a><a href="javascript:preFun(${pageBean.pageIndex})">上一页</a>
  
  <c:forEach begin="${pageBean.beginPageIndex}" end="${pageBean.endPageIndex }" var="num">
        	 <c:choose>
        	 	<c:when test="${pageBean.pageIndex==num }">
        	 		<span class="current">${num}</span>
        	 	</c:when>
        	 	<c:otherwise>
        	 		<a href="LeaveListServlet?pageIndex=${num}">${num}</a>
        	 	</c:otherwise>
        	 </c:choose>
        </c:forEach>
  
  <a href="javascript:nextFun(${pageBean.pageIndex},${pageBean.countPage})">下一页</a><a href="LeaveListServlet?pageIndex=${pageBean.countPage}">尾页</a> </div>

<script type="text/javascript">

function tan(id)
{
	layer.confirm('您确定要忽略吗？', {
  	btn: ['忽略','点错了'] //按钮
}, function(){
  location.href="LeaveListUpdateServlet?id="+id;
});
}
// 查看
function show(id){
 layer.open({
 				type:2,
				title : '请假条内容:',
				shadeClose : true,
				shade : 0.8,
				area : [ '800px', '60%' ],
				content : 'ShowReasonServlet?id=' +id,
			});

}
   
    // 忽略
        $('.delete').on('click',function(){
              //页面层
      //询问框
        layer.confirm('您确定忽略？', {
          
          btn: ['忽略','点错了'] //按钮
        }, function(){
          layer.msg('已忽略', {icon: 1});
        });
    })










function preFun(pageIndex){
      if(pageIndex<=1){
        layer.msg("已经是第一页了");
      }else{
        window.location.href="LeaveListServlet?pageIndex="+(pageIndex-1);
      }
    }
function nextFun(pageIndex,countPage){
      if(pageIndex>=countPage){
       layer.msg("已经是尾页了");
      }else{
        window.location.href="LeaveListServlet?pageIndex="+(pageIndex+1);
      }
    }
    
function updateFun(id){
  	        window.location.href="LeaveListUpdateServlet?id="+id;
  	}
</script>
<div class="panel admin-panel margin-top">

</div>
</body>
</html>