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
  <form action="PerformanceUpdateFinishServlet?eId=${sessionScope.eId}" method="post" class="form-x">
      <div class="form-group">
        <div class="label">
          <label>员工号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="dName" value="${employee.number }"  readonly="readonly"/>
          <div class="tips"></div>
        </div>
      </div>        
      <div class="form-group">
        <div class="label">
          <label>员工姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="name" value="${employee.name}" readonly="readonly"/>         
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>设置开始日期：</label>
        </div>
        <div class="field">
          <input id="date" type ="date" name ="startDate" data-validate="required:请输入开始日期" onfocus="WdatePicker({startDate:'2016-11-25',alwaysUseStartDate:true})" style="width:140px;height:39px;border:1px solid #dddddd;border-radius:5px;">
          <div class="tips"></div>
     </div>
     </div>
      <div class="form-group">
        <div class="label">
          <label>设置结束日期：</label>
        </div>
        <div class="field">
          <input id="date" type ="date" name ="endDate" data-validate="required:请输入结束日期" onfocus="WdatePicker({startDate:'2016-11-25',alwaysUseStartDate:true})" style="width:140px;height:39px;border:1px solid #dddddd;border-radius:5px;">
          <div class="tips"></div>
     </div>
     </div>
      <div class="form-group">
        <div class="label">
          <label>设置期望值：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="expectNum"  data-validate="required:请输入期望值" />
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
