<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container_wrap{
  pdding-right: 10%;
}
.jumbotron{
padding-left: 2%;
}

.thumbnail img {
    width:95%;
	opacity:1;
	-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
	transition: opacity 0.35s, transform 0.35s;
	-webkit-transform: scale3d(1.05,1.05,1);
	transform: scale3d(1.05,1.05,1);
}
.thumbnail:hover img {
	opacity:1;
	-webkit-transform: scale3d(1,1,1);
	transform: scale3d(1,1,1);
}
.caption{
    width:95%;
	opacity:1;
	-webkit-transition: opacity 0.35s, -webkit-transform 0.35s;
	transition: opacity 0.35s, transform 0.35s;
	-webkit-transform: scale3d(1.05,1.05,1);
	transform: scale3d(1.00,1.00,1);
}
.caption:hover{
	opacity: 1;
	-webkit-transform: scale3d(1,1,1);
	transform: scale3d(1,1,1);
}
.sport_all{
margin-top: 20px;
}
</style>
</head>
<body>
 <div class="container_wrap">
	   <div class="row sport_all">
	    <c:forEach items="${teams}" var="list">
		  <div class="col-lg-2 col-md-2 col-sm-6">
		    <div class="thumbnail">
		      <a href="${pageContext.request.contextPath}/pilotSecondController/teamc?id=${list.id}">
		      <img style="height: 130px" src="${list.pic }" alt="">
		      </a>
		      <div class="caption">
		        <span >${list.title }</span><br>	        
		        <span>距离您：${dis}千米</span>
		      </div>
		    </div>
		  </div>
		</c:forEach>
	  </div>
</body>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</html>