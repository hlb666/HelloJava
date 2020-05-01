<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<head>
	<base href="${pageContext.request.contextPath}/">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="favicon.ico">
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/style.css">
	<script src="js/modernizr-2.6.2.min.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/main.js"></script>
    <script src="js/jquery-1.7.2.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript">
	$(function(){
	     document.getElementById("btn").onclick = function () {
	        document.getElementsByTagName("img")[5].src =
	           "${pageContext.request.contextPath}"+"/userLoginController/yanzhengma?time=" + new Date().getTime();
	     };
	});
</script>
    <style type="text/css">
    .topdiv{
       width: 100%;
       height: 60px;
       background-color: #d6dfea;
    }
    .bootdiv{
       width: 100%;
       height: 25px;
       border-top:1px solid #d6dfea;
       background-color: #eff4fa;
       position: absolute;
       bottom: 8px;
       text-align: center;
    }
    .lunfantu{
       position: absolute;
       top:110px;
       left:150px;
       width: 600px;
       float: left;
    }
    .container1{
       position: absolute;
       top:50px;
       right: 60px;
     }
     .btns{
       width:90px;
       height:30px;
       padding-top:2px;
       margin-left: 10px;
     }
     .imgs{
     margin-left:50px;
     width: 150px;
     height: 60px;
     float: left;
     }
     .xinxi{
     width: 200px;
     height: 50px;
     float: left;
     margin-left:70%;
     padding-top: 15px;
     color: gray;
     }
    </style>
	</head>
<body class="style-3">
	<div class="topdiv">
	 <div class="imgs"><img alt="" width="100%" height="100%" src="images/55.png"> </div>
	 <div class="xinxi">基本版 | 邻约1.0</div>
	</div>
	<div class="lunfantu">
	 <div id="carousel-example-generic" class="carousel slide hlb-carousel" data-ride="carousel" data-interval="5000"> 
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<img src="images/one.jpg" >
		</div>
		<div class="item">
			<img src="images/two.jpg" >
		</div>
			<div class="item">
			<img src="images/three.jpg" >
		</div>
			<div class="item">
			<img src="images/four.jpg" >
		</div>
	</div>
</div>  
	</div>
	<div class="container container1">
		<div class="row">
			<div class="col-md-4 col-md-push-8">
				<form action="${pageContext.request.contextPath}/userLoginController/login" class="fh5co-form animate-box down"
					method="post" data-animate-effect="fadeInRight">			  
					<h2>登录</h2>
					<div class="form-group">
						<label for="username" class="sr-only">用户名</label>
						 <input type="text" class="form-control" name="username" id="username" placeholder="用户名" >
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">密码</label> 
						 <input type="password" class="form-control" name="password" id="password" placeholder="密码">
					</div>
					<div class="form-group">
					      <input type="text" class="form-control" name="image" placeholder="验证码">
						  <img src="${pageContext.request.contextPath}/userLoginController/yanzhengma">
                          <input type="button" class="btn btn-default btn-lg btns" value="换一张." id="btn">
                          <font color="red">${MSG3}</font>
					</div>
					<div class="form-group">
						<p>
						  没有账号? <a href="Regist.jsp">注册</a> | <a href="Retrieve.jsp">忘记密码</a>
						</p>
					</div>
					<div class="form-group">
						<input type="submit" value="登录" class="btn btn-primary">
					</div>
				</form>
				<!-- END Sign In Form -->
			</div>
		</div>
	</div>
	<div class="bootdiv">ftf.©1998 - 2018 恋志 Inc. All Rights Reserved.</div>
</body>
</html>

