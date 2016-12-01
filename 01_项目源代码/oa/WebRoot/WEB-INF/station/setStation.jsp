<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>配置权限</title>
<script language="javascript"
	src="${pageContext.request.contextPath}/jquery_treeview/jquery.treeview.js">
	
</script>
<script type="text/javascript">
	$(function() {
		$("[name=privilegeIds]").click(function() {

			$(this).siblings("ul").find("input").attr("checked", this.checked);
			if (this.checked == true) {
				$(this).parents("li").children("input").attr("checked", true);
			}
		});
	});
</script>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/style/blue/file.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/script/jquery_treeview/jquery.treeview.css" />
</head>
<body>

	<!-- 标题显示 -->
	<div id="Title_bar">
		<div id="Title_bar_Head">
			<div id="Title_Head"></div>
			<div id="Title">
				<!--页面标题-->
				<img border="0" width="13" height="13"
					src="${pageContext.request.contextPath}/style/images/title_arrow.gif" />
				配置权限
			</div>
			<div id="Title_End"></div>
		</div>
	</div>

	<!--显示表单内容-->
	<div id=MainArea>

		<form action="RoleSetPrivServlet" method="post">
			<input name="roleId" type="hidden" value="${role.id }"/>
			<div class="ItemBlock_Title1">
				<!-- 信息说明 -->
				<div class="ItemBlock_Title1">
					<img border="0" width="4" height="7"
						src="${pageContext.request.contextPath}/style/blue/images/item_point.gif" />
					正在为【${role.name}】配置权限
				</div>
			</div>

			<!-- 表单内容显示 -->
			<div class="ItemBlockBorder">
				<div class="ItemBlock">
					<table cellpadding="0" cellspacing="0" class="mainForm">
						<!--表头-->
						<thead>
							<tr align="LEFT" valign="MIDDLE" id="TableTitle">
								<td width="300px" style="padding-left: 7px;">
									<!-- 如果把全选元素的id指定为selectAll，并且有函数selectAll()，就会有错。因为有一种用法：可以直接用id引用元素 -->
									<input type="checkbox" id="cbSelectAll"
									onClick="$('[name=privilegeIds]').attr('checked', this.checked)" />
									<label for="cbSelectAll">全选</label></td>
							</tr>
						</thead>

						<!--显示数据列表-->
						<tbody id="TableData">
							<tr class="TableDetail1">
								<!-- 显示权限树 -->
								<td>
									<ul id="tree">
										<c:forEach var="parent"
											items="${application.topPrivilegeList}">
											<c:forEach var="privilege" items="${privileges }">
												<li><input type="checkbox" name="privilegeIds"
													value="${parent.id }" id="cb_${parent.id}"
													<c:if test="privilege.id==parent.id">checked</c:if> /> <label
													for="cb_${parent.id}"><span class="folder">${parent.name
															}</span> </label><br />
													<ul>
														<c:forEach var="children" items="${parent.children}">
															<li><input type="checkbox" name="privilegeIds"
																value="${children.id }" id="cb_${children.id}"
																} 
														 	<c:if test="privilege.id==children.id">checked</c:if> />
																<label for="cb_${children.id}"><span
																	class="folder">${children.name }</span> </label><br />
																<ul>
																	<c:forEach var="child" items="${children.children }">
																		<li><input type="checkbox" name="privilegeIds"
																			value="${child.id }" id="cb_${child.id}"
																			} 
															<c:if test="privilege.id==child.id">checked</c:if> />
																			<label for="cb_${child.id}"><span
																				class="folder">${child.name }</span> </label><br />
																		</li>
																	</c:forEach>
																</ul>
															</li>
														</c:forEach>
													</ul>
												</li>
											</c:forEach>
										</c:forEach>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<script language="javascript">
				$("#tree").treeview();
			</script>

			<!-- 表单操作 -->
			<div id="InputDetailBar">
				<input type="image"
					src="${pageContext.request.contextPath}/style/images/save.png" />
				<a href="javascript:history.go(-1);"><img
					src="${pageContext.request.contextPath}/style/images/goBack.png" />
				</a>
			</div>
		</form>
	</div>

	<div class="Description">
		说明：<br /> 1，选中一个权限时：<br /> &nbsp;&nbsp;&nbsp;&nbsp; a，应该选中他的所有直系上级。<br />
		&nbsp;&nbsp;&nbsp;&nbsp; b，应该选中他的所有直系下级。<br /> 2，取消选择一个权限时：<br />
		&nbsp;&nbsp;&nbsp;&nbsp; a，应该取消选择他的所有直系下级。<br />
		&nbsp;&nbsp;&nbsp;&nbsp; b，如果同级的权限都是未选择状态，就应该取消选中他的直接上级，并向上做这个操作。<br />

		3，全选/取消全选。<br /> 4，默认选中当前岗位已有的权限。<br />
	</div>

</body>
</html>
