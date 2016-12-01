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
	            版块设置</strong></div>
	        </div>
	        <div id="Title_End"></div>
	    </div>
	</div>

<!--显示表单内容-->
<div id="MainArea">


	<!-- 此处有修改，请检查form头部和if -->
    <form action="ForumOperateServlet" method="post" class="form-x" style="margin-top:15px;">
    	<c:if test="${forum.id!=null }"><!-- ?type=update --></c:if>
    	<input type="hidden" name="forumId" value="${forum.id }" />   	
        <div class="ItemBlock_Title1"><!-- 信息说明<DIV CLASS="ItemBlock_Title1">
        	<IMG BORDER="0" WIDTH="4" HEIGHT="7" SRC="${pageContext.request.contextPath}/style/blue/images/item_point.gif" /> 版块信息 </DIV>  -->
        </div>
        
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
         
                        <table border="0" cellspacing="1" cellpadding="1" width="100%"
						id="InputArea">
						<tr>
							<td class="InputAreaBg" height="30" width="50px"><div
									class="InputTitle" style="margin-left:30px;width:40px;"><strong>名称</strong></div>
							</td>
							<td ><div >
									<input name="name" id="name" 
										style="width:99%;height:40px;margin-bottom:20px;border:1px solid #dddddd;border-radius:4px;" value="${forum.name}" data-validate="required:请输入版块名称" " />
								</div></td>
						</tr>
						<tr>
							<td class="InputAreaBg" height="30" width="50px"><div
									class="InputTitle" style="margin-left:30px;width:40px;"><strong>描述</strong></div>
							</td>
							<td><div>
									<input name="description" id="description" 
										style="width:99%;height:40px;margin-bottom:20px;border:1px solid #dddddd;border-radius:4px;" data-validate="required:请输入版块描述" />
								</div></td>
						</tr>
					</table>
              
        </div>
        
        <div class="pagelist" style="margin-left:-420px;margin-top:25px">
            <a href="javascript:addForum(${forum.id })">确定</a>
            <a href="javascript:history.go(-1);">返回</a>
  	  </div>
    
    </form>
</div>
</div>
</body>

<script type="text/javascript">
	function addForum(forumId){
		var name=document.getElementById("name");
		var description=document.getElementById("description");
		if(typeof(forumId)!="undefined"){
			window.location.href="ForumOperateServlet?type=update&forumId="+forumId+"&name="+name+"&description="+description;
		}else{
			window.location.href="ForumOperateServlet?name="+name+"&description="+description;
		
		}
	}
</script>
</html>
