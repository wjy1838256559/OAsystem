<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script type="text/javascript" src="js/layer/layer.js"></script>
	<title>版块设置</title>
	<style>
		input{width: 150px;height: 38px;}
	</style>
</head>
<body>
<div class="panel admin-panel">
<!-- 标题显示 -->
	<div id="Title_bar">
	    <div id="Title_bar_Head">
	        <div id="Title_Head"></div>
	        <div id="Title"><!--页面标题-->
	        	<div class="panel-head" id="add" style="">
	            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/style/images/title_arrow.gif"/> 
				<strong><span class="icon-pencil-square-o"></span>
	            版块设置</strong><a href="" style="float:right;margin-right:50px;font-weight:bold;"><strong>返回</strong></a></div>
	        </div>
	        <div id="Title_End"></div>
	    </div>
	</div>

<!--显示表单内容-->
<div id="MainArea">

<center>
	<!-- 此处有修改，请检查form头部和if -->
    <form action="ForumOperateServlet" method="post" class="form-x" style="margin-top:15px;">
    	<c:if test="${forum.id!=null }"><!-- ?type=update --></c:if>
    	<input type="hidden" name="forumId" value="${forum.id }" />   	
    	<h6><font color="red">${error }</font></h6>
        <div class="ItemBlock_Title1"><!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 版块信息 </DIV>  -->
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
         
                        <div class="form-group">
	                        <div class="label">
				          		<label>版块名称&nbsp;&nbsp;&nbsp;&nbsp;：</label>
				        	</div>
                        	<input name="name" class="InputStyle input w50" value="${forum.name }" data-validate="required:请输入版块名称"/>
                        </div> 
                 
                        <div class="form-group">
	                        <div class="label">
				          		<label>版块说明&nbsp;&nbsp;&nbsp;&nbsp;：</label>
				        	</div>
                        	<textarea name="description" class="TextareaStyle input w50" data-validate="required:请输入版块说明">${forum.description}</textarea>
                        </div>
              
        </div>
        
        <div class="pagelist">
			<a href="javascript:search(1)">保存</a> 
			<a href="javascript:history.go(-1)">返回</a>
		</div>

    </form>

</div>
</center>
</div>

</body>
</html>
