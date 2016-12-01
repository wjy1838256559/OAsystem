<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 这是人事管理的人事修改页面，进行员工信息的修改 -->
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
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>编辑部门信息</strong></div>
  <h6 style="margin-left:50px"><font color="red">${error }</font></h6>
  <div class="body-content">
  <form action="<c:choose><c:when test="${sessionScope.id==null }">DepartmentAddServlet</c:when><c:otherwise>DepartmentUpdateFinishServlet</c:otherwise></c:choose>" method="post" class="form-x">
      <div class="form-group">
        <div class="label">
          <label>部门名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="dName" value="${department.dName}" maxlength="20" data-validate="required:请输入部门名称"/>
          <div class="tips"></div>
        </div>
      </div>        
      <div class="form-group">
        <div class="label">
          <label>部门描述：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="description" value="${department.description}" data-validate="required:请输入部门描述"/>         
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>
