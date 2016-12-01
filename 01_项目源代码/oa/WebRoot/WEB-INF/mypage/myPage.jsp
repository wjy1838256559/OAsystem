<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>

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
<script src="js/jquery-1.8.3.js"></script>
<script src="js/pintuer.js"></script>  
<script src="js/layer/layer.js"></script>
<style>
	p{padding-top: 6px;}
</style>
</head>
<body>
<div class="panel admin-panel">
	<div></div>
  <div class="panel-head" id="add" style="margin-left:30px;"><strong><span class="icon-pencil-square-o"></span>个人资料</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="MyPageUpdateServlet">
    <input type="hidden" name="userId" value="${employee.id }"> 
    <div class="form-group">
        <div class="label">
          <label>头像&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</label>
        </div>
        <div class="field">
          <div id="image-wrap">
          	<img src="ImageShowServlet?image=${user.image }"
							class="radius-circle rotate-hover" height="90" name="image" width="90" style="margin-top:10px" alt="" />
          </div>
          <div class="tipss"><!-- 图片尺寸：500*500 --></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>员工号&nbsp;&nbsp;&nbsp;&nbsp;：</label>
        </div>
        <div class="field">
        <p>${employee.number}</p>
          <div class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>姓名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</label>
        </div>
        <div class="field">
       <p>${employee.name}</p>
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>密码&nbsp;&nbsp;&nbsp;&nbsp;：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" value="${employee.pwd }" name="pwd" data-validate="required:请输入密码" />
          <div class="tips"></div>
        </div>
      </div> 
        
      <div class="form-group">
        <div class="label">
          <label>手机号&nbsp;&nbsp;&nbsp;&nbsp;：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50" value="${employee.phoneNumber }" name="phoneNumber" data-validate="required:请输入手机号" />
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>工作经验：&nbsp;</label>
        </div>
        <div class="field">
          <p>${employee.workExperience }年</p>
          <div class="tips"></div>
        </div>
      </div> 
      
        <div class="form-group">
        <div class="label">
          <label>职位&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;：</label>
        </div>
        <div class="field">
          <p>${employee.station.sName }</p>
          <div class="tips"></div>
        </div>
      </div>
       
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <input class="button bg-main" type="submit" value="保存" style="margin-left:20px;margin-right:20px;"><input class="button bg-main" type="reset" style="margin-left:20px;margin-right:20px;"><input type="button" class="button bg-main" style="margin-left:20px;margin-right:20px;" value="返回" onclick="javascript:history.go(-1)">
        </div>
      </div>
    </form>
  </div>
</div>
<script>
    //图片显示插件
    (function($) {       
    $.imageFileVisible = function(options) {     
         // 默认选项
    var defaults = {    
    //包裹图片的元素
    wrapSelector: null,    
    //<input type=file />元素
      fileSelector:  null ,
      width : '100%',
      height: 'auto',
      errorMessage: "不是图片"
     };    
     // Extend our default options with those provided.    
     var opts = $.extend(defaults, options);     
     $(opts.fileSelector).on("change",function(){
    var file = this.files[0];
    var imageType = /image.*/;
    if (file.type.match(imageType)) {
    var reader = new FileReader();
    reader.onload = function(){
    var img = new Image();
    img.src = reader.result;
    $(img).width( opts.width);
    $(img).height( opts.height);
    $( opts.wrapSelector ).append(img);
    };
    reader.readAsDataURL(file);
    }else{
    alert(opts.errorMessage);
    }
    });
    };     
    })(jQuery); 
  </script>
  <script>
    $(document).ready(function(){
    //图片显示插件
    $.imageFileVisible({wrapSelector: "#image-wrap",   
    fileSelector: "#file",
    width: 100,
    height: 100
    });
    });
  </script>
</body></html>
