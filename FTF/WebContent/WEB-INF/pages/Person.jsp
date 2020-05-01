<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/WEB-INF/pages">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>个人中心</title>
<link rel="stylesheet" href="../css/person.css">
<link rel="stylesheet" href="../css/Cooldog.css">
<link rel="stylesheet" href="../css/iconfont.css">
 <link rel="stylesheet" href="../css/styles.css" >
 <script src="../js/jquery.min.js"></script>
 <link  rel="stylesheet" href="../css/bootstrap.min.css">  
<style type="text/css">
html,body{
margin: 0px;
width: 100%;
height: 100%;
}
.wrap{
width: 100%;
height: 6%;
background-color: #337ab7;
}
.wrapl{
margin-left:10px;
width: 45%;
height: 99%;
border: 1px solid black;
float: left;
border-radius: 40px;
}
.wrap2{
margin-left:30px;
width: 45%;
height: 11.9%;
border: 1px solid red;
float: left;
border-radius: 30px;
}
.wrap3{
width: 100%;
height: 94%;

}
.daohang{
color:black;
padding-top:10px;
background-color:#DDDDDD;
width: 15%;
height:100%;

float: left;
}
.content{
position:absolute;
left:17%;
width:83%;
height:94%;

}
.logo{
 width: 100px;
 height:70px;
 padding-left: 25px;
 padding-top: 2px;
 border-radius: 40px;
 float: left;
}
.logoimg{
 width: 100%;
 height: 100%;
 border-radius: 40px;
}
.logoct{
 margin-top:10px;
 margin-left:30px;
 width: 180px;
 height:60px;
 float: left;
 padding-top:2px;
}
.wenben{
   padding-top:10px;
   color: white;
   font-size: 15px;
}
.offset{
 margin-left:25px;
}
.username{
  padding-left:1.8%;
  padding-top:0.05%;
  color:white;
  position:absolute;
  top:7px;
  margin-left:80%;
  width: 100px;
  height: 20px;
}
a{
color: black;
font-size: 15px;
text-decoration: none;
}
.person{
  margin-top: 10%;
  border-top: 1p solid black;
}
</style>
</head>
<body>
<div class="wrap">
<div class="wrapl">
 <div class="logoct">
 <span class="wenben">心连心&emsp;邻约邻</span>
 </div>
</div>
<div class="wrapr2">
 <div class="username">
 ${user2name}
 </div>
</div>
</div>
<div class="wrap3">
<div class="daohang">
<ul class="nav nav-pills nav-stacked">
	<li>
	<a style="color: black;" href="${pageContext.request.contextPath}/userLoginController/searchs"><span class="glyphicon glyphicon-search"></span>&emsp;搜索</a>
	</li>
	<li>
	<a style="color: black;" href="${pageContext.request.contextPath}/userLoginController/main"><span class="glyphicon glyphicon-home"></span>&emsp;首页</a>
	</li>
	<li>
	<a style="color: black;" href="${pageContext.request.contextPath}/userLoginController/trysts"><span class="glyphicon glyphicon-road"></span>&emsp;约吧—邻约</a>
	</li>
	<li>
	<a style="color: black;" href="${pageContext.request.contextPath}/userLoginController/daohang" ><span class="glyphicon glyphicon-qrcode"></span>&emsp;导航信息</a>
	</li>
	<hr>
	<li style="color: black;"><a  class="person" style="background-color:white;"><span class="glyphicon glyphicon-user"></span>&emsp;个人中心</a></li>
    <li><a class="person" href="${pageContext.request.contextPath}/userLoginController/tuling"><span class="glyphicon glyphicon-user"></span>&emsp;智能答疑</a></li>
	<hr/>
</ul>
</div>
<div class="content">
<div class="twodaohang">
<ul class="nav nav-tabs">
	<li class="${class1}"><a href="${pageContext.request.contextPath}/userLoginController/persons">个人资料</a></li>
	<li class="${class2}"><a href="${pageContext.request.contextPath}/pilotSecondController/two">参与的队伍</a></li>
	<li class="${class3}"><a href="${pageContext.request.contextPath}/pilotSecondController/three">发起的队伍</a></li>
</ul>
</div>
  <div class="showAll">
  <c:import url="${msg}"></c:import> 
  </div>
</div>
</div>
<script>
</script>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/Cooldog.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
</body>
</html>