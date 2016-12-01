<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<script src="js/jquery-1.8.3.js"></script>
<script src="js/pintuer.js"></script>
<script src="js/layer/layer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add" style="margin-left:30px;">
			<strong><span class="icon-pencil-square-o"></span>员工操作</strong>
			<h6><font color="red">${error }</font></h6>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="EmployeeAddServlet">
				<div class="form-group">
					<div class="label">
						<label>员工号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="number"
							data-validate="required:请输入员工号" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>姓名：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="name"
							data-validate="required:请输入姓名" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>手机号：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="phoneNumber"
							data-validate="required:请输入手机号" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>工资：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="money"
							data-validate="required:请输入工资" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>工作经验：</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value=""
							name="workExperience" data-validate="required:请输入工作经验" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>入职日期：</label>
					</div>
					<div class="field">
						<input type="date" name="startDate" data-validate="required:请选择日期"
							onfocus="WdatePicker({startDate:'1980-01-01',endDate:'2016-11-25',alwaysUseStartDate:true})"
							style="width:140px;height:39px;border:1px solid #dddddd;border-radius:5px;">
						<div class="tips"></div>
					</div>
				</div>
				<if condition="$iscid eq 1">
				<div class="form-group">
					<div class="label">
						<label>职位：</label>
					</div>
					<div class="field">
						<select name="sId" class="input w50">
							<c:forEach var="station" items="${stationList }">
								<option value="${station.id }">${station.sName }</option>
							</c:forEach>
						</select>
						<div class="tips"></div>
					</div>
				</div>
				</if>
				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<input id="suBtn" class="button bg-main" type="submit" value="提交"
							style="margin-left:50px;margin-right:50px;"><input
							class="button bg-main" type="reset">
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
</html>