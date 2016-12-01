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
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>新增员工岗位</strong><!-- a href="gangwei.html" style="float:right;margin-right:50px;font-weight:bold;"><strong>返回</strong></a> --></div>
	<h6 style="margin-left: 10px"><font color="red">${error }</font></h6>
  <div class="body-content">
    <form method="post" class="form-x" action="StationAddServlet">        
      <div class="form-group">
        <div class="label">
          <label>岗位名称：</label>
        </div>
        <div class="field">
        <input type="text" name="sName" class="input"  value="${station.sName }" style="width:180px;" data-validate="required:请输入岗位名称"/>
        </div>
      </div>       
      <div class="form-group">
        <div class="label">
          <label>岗位描述：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="description" value="${station.description}" data-validate="required:请输入岗位描述 "/>         
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>所属部门：</label>
        </div>
        <div class="field">
          <select style="width:180px;height:40px;border:1px solid #dddddd;border-radius:3px;" onchange="this.parentNode.nextSibling.value=this.value"  id="selecttype" name="dId">
          <c:forEach var="dept" items="${departmentList }">
          	<option value="${dept.id }">${dept.dName }</option>
          </c:forEach>
      </select>
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
</body>
</html>