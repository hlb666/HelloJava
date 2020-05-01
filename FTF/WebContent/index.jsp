<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/Login.jsp"></span> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="ThemeStarz">
<link href="assets/fonts/font-awesome.css" rel="stylesheet" type="text/css">
<link href="assets/fonts/elegant-fonts.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="assets/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="assets/css/style.css" type="text/css">
<title>Home</title>
<style>
	body { background-color: #f3f3f3; }
</style>
<script>
	var colors = ['255,103,103', '97,223,255', '255,232,88', '141,255,139'];
</script>
</head>
<body>
<div class="page-wrapper">
<header>
	<div class="brand animate"><a href=""><img src="assets/img/logo.png" alt=""></a></div>

</header>
<div class="content-wrapper">
	<div class="content-main animate">
		<div class="container">
			<h1 class="font-size-90">邻 约!</h1>
			<h2 class="opacity-60">Something Awesome is Coming Soon</h2>
		</div>
		<!--end container-->
	</div>
	<!--end content-main-->
	<div class="background-wrapper">
		<canvas id="background-content"></canvas>
	</div>
	<!--end background-wrapper-->
</div>
<!--end content-wrapper-->
<footer>
	<div class="social-icons animate">
		<a href="#"><i class="fa fa-twitter"></i></a>
		<a href="#"><i class="fa fa-facebook"></i></a>
		<a href="#"><i class="fa fa-youtube"></i></a>
		<a href="#"><i class="fa fa-instagram"></i></a>
		<a href="#"><i class="fa fa-pinterest"></i></a>
		<a href="#"><i class="fa fa-google-plus"></i></a>
	</div>
	<!--end social-icons-->
</footer>
</div>
<!--end page-wrapper-->
<script  src="assets/js/jquery-2.2.1.min.js"></script>
<script  src="assets/bootstrap/js/bootstrap.min.js"></script>
<script  src="assets/js/jquery.validate.min.js"></script>
<script  src="assets/js/jquery.magnific-popup.min.js"></script>
<script  src="assets/js/TweenLite.min.js"></script>
<script  src="assets/js/EasePack.min.js"></script>
<script  src="assets/js/exploding-triangles.js"></script>
<script  src="assets/js/custom.js"></script>
<script>
var latitude = 34.038405;
var longitude = -117.946944;
var markerImage = "assets/img/map-marker.png";
var mapTheme = "light";
var mapElement = "map";
$(".modal").on("shown.bs.modal", function (e) {
	google.maps.event.addDomListener(window, 'load', simpleMap(latitude, longitude, markerImage, mapTheme, mapElement));
});
</script>
</body>
</html>