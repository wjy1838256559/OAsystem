<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>登录</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
    <script src="js/drag.js"></script>
    <script type="text/javascript">
    	$(function(){
			document.forms[0].userName.focus();
		});
    </script>
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form action="LoginServlet" method="post" id="form1">
                <!-- 登录主界面 -->
            <div class="panel loginbox" id="loginbox">
                <div class="text-center margin-big padding-big-top"><h1>后台管理中心</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                    	<h6><font color="red">${error}</font></h6>
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" name="userName" value="${userName}" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small">
                            </span>
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="userPwd" value="${userPwd}" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                           <img src="RandomServlet" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?time='+new Date()">  
                        </div>
                    </div>
                    <div class="form-group" style="margin-left:10px;margin-top:20px;">
                        <div class="field">
                           <input type="radio" value="admin" id="admin" name="role" checked><label for="admin">管理员</label> 
                           <input type="radio" value="user" id="user" name="role"><label for="user">普通用户 </label> 
                        </div>
                    </div>
                </div>
                <div style="padding:30px;margin-top:-10px;"><input type="submit" class="button button-block bg-main text-big input-big" value="登录"></div>
            </div>
        </form>
        </div>
    </div>
</div>
</body>
</html>

