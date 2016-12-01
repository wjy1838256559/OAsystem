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
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>设置绩效期望值</strong></div>
  <div class="body-content">
  <form action="UserLeaveAddServlet" method="post" class="form-x">
      
     
      <div class="form-group">
        <div class="label">
          <label>填写请假日期：</label>
        </div>
        <div class="field">
          <input id="date" type ="date" name ="date" onfocus="WdatePicker({startDate:'1980-01-01',alwaysUseStartDate:true})" style="width:140px;height:39px;border:1px solid #dddddd;border-radius:5px;">
          <div class="tips"></div>
     </div>
     </div>
      <div class="form-group">
        <div class="label">
          <label>填写请假原因：</label>
        </div>
        <div class="field">
        <textarea rows="15px" cols="40px" name="reason"></textarea>
          <div class="tips"></div>
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
