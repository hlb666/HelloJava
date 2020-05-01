<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<head>
	<base href="${pageContext.request.contextPath}/">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>找回密码</title>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="js/modernizr-2.6.2.min.js"></script>
	<style type="text/css">
	 .beiying{
	  position: absolute;
      top:80px;
      left:180px;
	  width:450px;
	  height:550px;

	 }
	 .container2{
	   position: absolute;
       top:30px;
       right: 100px;
       
	 }
	</style>
	</head>
<body class="style-3">
    <div class="beiying">
     <img alt="" src="images/beiying.jpg">
    </div>
	<div class="container container2">
		<div class="row">
			<div class="col-md-4 col-md-push-8">
				<form action="${pageContext.request.contextPath}/userLoginController/findPassword" class="fh5co-form animate-box  zhucepage"
					data-animate-effect="fadeInRight">
					<h2>忘记密码</h2>
					<div class="form-group">
						<div class="alert alert-success" role="alert">请输入注册时的邮箱.<span style="color: red">${MSG1}<span></span></div>
					</div>
					<div class="form-group">
						<label for="email" class="sr-only">邮箱</label> 
						<input type="email"  class="form-control" name="email" id="email" placeholder="邮箱">
					</div>
					<div class="form-group">
						<p>
						 <a href="Login.jsp">登录</a> 或 <a href="Regist.jsp">注册</a>
						</p>
					</div>
					<div class="form-group">
						<input type="submit" value="发送" class="btn btn-primary">
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>

