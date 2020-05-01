<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>注册</title>
	<link rel="shortcut icon" href="favicon.ico">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
	<script src="js/modernizr-2.6.2.min.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/main.js"></script>
<script type="text/javascript">
$.validator.setDefaults({
    submitHandler: function() {
      alert("提交事件!");
    }
});
$().ready(function() {
    $("#commentForm").validate();
});		
function checkLogin()
  {
    var myName=document.getElementById("cname").value;
    if(myName==""){
    }else{
	var xmlhttp;
	if (window.XMLHttpRequest)
	{
		xmlhttp=new XMLHttpRequest();
	}
	else
	{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=function()
	{
		if (xmlhttp.readyState==4 && xmlhttp.status==200)
		{
			document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
		}
	}
	xmlhttp.open("GET","userLoginController/toAjax?username="+myName,true); //open(get/post,url,true)
	xmlhttp.send();   
	}
  }

</script>
	<style type="text/css">
	.container {
		padding-right: 15px;
		padding-left: 15px;
		margin-right: auto;
		margin-left: auto;
		margin-top: -25px;
		line-height: 0.4;
    }
    .left{
     position:absolute;
     left:150px;
     top:60px;
     width: 600px;
     height: 500px;
    }
    .textleft{
     width: 250px;
     height: 500px;
     float: left;
     margin-left: 40px;

    }
    .picright{
     width: 30px;
     height: 500px;
     float: left;
     border: 2px solid #d6dfea;
     margin-right: 5px;
     font-size: 20px;
     text-align: center;
    }
    .topic{ 
      margin-top:70px;  
      font-size: 24px;
    }
     .wenben{
      font-family:"楷体";
      font-size: 18px;
    } 
    .myDiv{
      padding-top: 5px;
    }
	</style>
</head>
	<body class="style-3">
	    <div class="left">
	    <div class="picright"></div>
	    <div class="picright"></div>
	    <div class="picright"></div>
	    <div class="picright"></div>
	    <div class="picright"></div>
	    <div class="picright"></div>
        <div class="textleft">
	     <p class="topic">邻约，常运动！</p>
	     <p class="wenben">我们一起看月亮爬上来</p>
	     <p class="wenben">傻傻傻傻的等待</p>
	     <p class="wenben">无人街角无声拥抱</p>
	     <p class="wenben">可能不舍得不是你而是昨天</p>
	    </div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-push-8">	
					<!-- Start Sign In Form -->
					<form action="${pageContext.request.contextPath}/userLoginController/add" method="post" class="fh5co-form animate-box" id="commentForm">
						<h2>注册</h2>
						<div class="form-group">
							<div class="alert alert-success" role="alert">你的信息将会被保存.<span style="color: red">${MSG}</span></div>
						</div>
						<div class="form-group">
							<label for="cname" class="sr-only">用户名</label>
							<input type="text" class="form-control" name="username" id="cname" placeholder="用户名" onblur="checkLogin()" minlength="2" required>
						    <div id="myDiv" class="myDiv"></div>
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码</label>
							<input type="password" class="form-control" name="password" id="password" placeholder="密码" minlength="6" required>
						</div>
						<div class="form-group">
							<label for="cemail" class="sr-only">邮箱</label>
							<input type="email" class="form-control" name="email" id="cemail" placeholder="邮箱" required>
						</div>
						<div class="form-group">
							<p>已有账号? <a href="Login.jsp">登录</a></p>
						</div>
						<div class="form-group">
							<input type="submit" value="注册" class="btn btn-primary">
						</div>
					</form>
				</div>
			</div>		
		</div>
	</body>
</html>