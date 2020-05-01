<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script type="text/javascript" src="../js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<style type="text/css">
.container_wrap {
	pdding-right: 10%;
}
.container_jumbotron {
	width: 98%;
	margin-left: 1%;
}
.jumbotron {
	padding-left: 2%;
	height: 20px;
}
.thumbnail img {
	width: 95%;
	opacity: 1;
	-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
	transition: opacity 0.35s, transform 0.35s;
	-webkit-transform: scale3d(1.05, 1.05, 1);
	transform: scale3d(1.05, 1.05, 1);
}
.thumbnail:hover img {
	opacity: 0.8;
	-webkit-transform: scale3d(1, 1, 1);
	transform: scale3d(1, 1, 1);
}
.caption {
	width: 95%;
	opacity: 1;
	-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
	transition: opacity 0.35s, transform 0.35s;
	-webkit-transform: scale3d(1.05, 1.05, 1);
	transform: scale3d(1.05, 1.05, 1);
}
.caption:hover {
	opacity: 0.8;
	-webkit-transform: scale3d(1, 1, 1);
	transform: scale3d(1, 1, 1);
}
.
.wrapper {
	overflow-y: auto;
}
.black_overlay {
	display: none;
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 88);
}
.white_content {
display: none;
position: absolute;
top: 8%;
left: 13%;
width: 75%;
height: 75%;
padding: 20px;
border: 10px solid orange;
background-color: white;
z-index: 1002;
overflow-y: auto;
}
.tan_one{
width: 100%;
height: 202px;
border: 1px solid red;
}
.tan_one_img{
width: 20%;
height: 150px;
margin-top: 20px;
margin-left: 20px;
border: 1px solid red;
float: left;
}
.tan_one_new{
width: 70%;
height: 150px;
margin-top: 20px;
margin-left: 20px;
border: 1px solid red;
float: left;
}
.tan_two{
width: 100%;
height: 202px;
border: 1px solid red;
margin-top: 10px;
}
.tan_three{
width: 100%;
height: 202px;
border: 1px solid red;
margin-top: 10px;
}
.tan_four{
width: 100%;
height: 50px;
border: 1px solid red;
margin-top: 10px;
}
tr{
margin-top: 5px;
}
</style>
</head>
<body>
 <div class="container_wrap">
	  <div class="container_jumbotron">
			<div class="jumbotron">
			  在这里是你发起的队伍，你可以在这里查看你组队的信息哦！
			</div>			
		</div>
		
	   <div class="row">
	   <c:forEach items="${list}" var="lists">
		  <div class="col-lg-3 col-md-4 col-sm-6">
		    <div class="thumbnail">
		     <a href="${pageContext.request.contextPath}/pilotSecondController/threeContent?id=${lists.id}">
		      <img   id="imas" style="height: 120px;" src="${lists.pic }">
		     </a> 
		      <div class="caption">
		        <p>${lists.title}</p>
		      </div>
		    </div>
		  </div>
		 </c:forEach>
		</div>		
	  </div>
</body>

</html>