<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css" />
</head>
<body>
<img src="images/bgImg.jpg" class="bgImg" />
<div class="content">
<form action="${pageContext.request.contextPath}/userLoginController/backLogin" method="post">
	<div class="bidTitle">后台登录</div>
	<div class="logCon">
		<div class="line"><span>账号:</span>
		<input class="bt_input"  name="name" type="text" /></div>
		<div class="line"><span>密码:</span>
		<input class="bt_input" name="password" type="text" /></div>
		<button type="submit" class="logingBut">登录</button>
	 </div>
	</form>
</div>
</body>
</html>