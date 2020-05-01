<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/WEB-INF/pages">
<meta http-equiv="Page-Enter" content="RevealTrans(duration=5,Transitionv=11)">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>约吧</title>
<link rel="stylesheet" href="../css/Cooldog.css">
<link rel="stylesheet" href="../css/iconfont.css">
 <link rel="stylesheet" href="../css/styles.css" >
 <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=8cc355b1d46538c64a75d9a0b57ea744"></script>   
 <script src="../js/jquery.min.js"></script>
 <link  rel="stylesheet" href="../css/bootstrap.min.css"> 
<script type="text/javascript">
$(function() {
	
    //使用iframe方式加载页面
    $('a').click(function(){
        var val = $(this).attr('name');
        $("#center").attr("src",val);
      });
    
    $('.dropdown').click(function(){
    	 var val = $(this).attr('id');
    	 if(val==1){
    		 $("#"+val).css("background","white"); 
    		 $("#2").css("background","#DDDDDD");
    	 }
    	 else if(val==2){
    		 $("#"+val).css("background","white"); 
    		 $("#1").css("background","#DDDDDD");
    	 }
    	
      });    
    
 //进行定位   
    var map, geolocation;
    //加载地图，调用浏览器定位服务
    map = new AMap.Map('container', {
        resizeEnable: true
    });
    map.plugin('AMap.Geolocation', function () {
        geolocation = new AMap.Geolocation({
            enableHighAccuracy: true,//是否使用高精度定位，默认:true
            timeout: 10000,          //超过10秒后停止定位，默认：无穷大
            buttonOffset: new AMap.Pixel(10, 20),//定位按钮与设置的停靠位置的偏移量，默认：Pixel(10, 20)
            zoomToAccuracy: false,      //定位区域
            buttonPosition: 'RB',
            convert: true,           //自动偏移坐标，偏移后的坐标为高德坐标，默认：true
            showMarker: true,        //定位成功后在定位到的位置显示点标记，默认：true
            showCircle: true,        //定位成功后用圆圈表示定位精度范围，默认：true
            panToLocation: true,     //定位成功后将定位到的位置作为地图中心点，默认：true
            zoomToAccuracy:true      //定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
        });
        map.addControl(geolocation);
        geolocation.getCurrentPosition();
        AMap.event.addListener(geolocation, 'complete', onComplete);//返回定位信息
        AMap.event.addListener(geolocation, 'error', onError);      //返回定位出错信息
    });
    
    map.plugin('AMap.MapType',function(){
        //地图类型切换
        var type= new AMap.MapType({
        defaultType:0 //使用2D地图
        });
        map.addControl(type);
    });
    	    
    //解析定位结果
    function onComplete(data) {
        var lng = data.position.getLng();
        var lat = data.position.getLat();         
    	$.ajax({
    		url:"${pageContext.request.contextPath}/pilotSecondController/ajax?lng="+lng+"&lat="+lat,
    		type:"get",
    		success:function(data){
    		  var num = eval(data);
    		}
    	});	
               
    }
    //解析定位错误信息
    function onError(data) {
        document.getElementById('tip').innerHTML = '定位失败';
    }
    
   
});

	function get() {
		var radius = $(".choice").val();
		var val = "${pageContext.request.contextPath}/pilotSecondController/sports?rads="+radius;
		$("#center").attr("src", val);
	}
</script>
 
  
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
padding-top:10px;
background-color:#DDDDDD;
width: 15%;
height:100%;
border-right: 1px solid black;
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
   padding-top10px;
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
  margin-top: 10px;
  border-top: 1p solid black;
}
.lunfan{
 overflow: hidden;
 width: 90%;
 height: 175px;
 border-bottom: 1px solid gray;
 margin-top: 10px;
 margin-left:5%;

}
.yue_btn>a{
text-decoration: none;
cursor: pointer;                                                                                                                                                                                                                             
}
.choice{
width: 40px;
height:22px;
margin-left: 20px;
margin-top:15px; 
line-height: 22px;
font-size: 12px;
}
.choice_btn{
width: 80px;
margin-top:12px; 
margin-left: 2px;
font-size: 10px;
}
</style>
</head>
<body>
<div class="wrap">
<div class="wrapl">
 <div class="logoct">
 <span class="wenben">心连心&emsp;邻约邻</span><br>	
 </div>
</div>
<div class="wrapr2">
 <div class="username">
 ${user2name }
 </div>
</div>
</div>
<div class="wrap3">
<div class="daohang">
<ul class="nav nav-pills nav-stacked">
	<li>
	<a href="${pageContext.request.contextPath}/userLoginController/searchs"><span class="glyphicon glyphicon-search"></span>&emsp;搜索</a>
	</li>
	<li>
	<a href="${pageContext.request.contextPath}/userLoginController/main"><span class="glyphicon glyphicon-home"></span>&emsp;首页</a>
	</li>
	<li>
	<a style="background-color:white;"><span class="glyphicon glyphicon-road"></span>&emsp;约吧—邻约</a>
	</li>
	<li>
	<a href="${pageContext.request.contextPath}/userLoginController/daohang" ><span class="glyphicon glyphicon-qrcode"></span>&emsp;导航信息</a>
	</li>
	<hr>
	<li><a href="${pageContext.request.contextPath}/userLoginController/persons"  class="person" ><span class="glyphicon glyphicon-user"></span>&emsp;个人中心</a></li>
    <li><a class="person" href="${pageContext.request.contextPath}/userLoginController/tuling"><span class="glyphicon glyphicon-user"></span>&emsp;智能答疑</a></li>
	<hr/>
</ul>
</div>
<div class="content">
 <div class="yue_nav">
  <nav class="navbar"  role="navigation">
        <div class="container-fluid" style="background-color: #DDDDDD; width: 99.5%;margin-right: 0.5%" >
            <ul class="nav navbar-nav navbar-left" style="width: 100%">
                <li id="1" class="dropdown" style="background-color: white;">
                   <a class="glyphicon glyphicon-send" name="${pageContext.request.contextPath}/pilotSecondController/sport?tid=1">&nbsp;运动</a>                                       
                </li>
                <li id="2" class="dropdown">
                     <a class="glyphicon glyphicon-flag" name="${pageContext.request.contextPath}/pilotSecondController/sport?tid=2"> 登山</a>                                           
                </li> 
                <li id="3" class="dropdown">
                    <a class="glyphicon glyphicon-pencil?tid=3">&nbsp;美术</a>
                </li>
                <li id="4" class="dropdown">
                    <a class="glyphicon glyphicon-headphones?tid=4">&nbsp;休闲</a>                              
                </li>   
                <li id="5">                
                  <select name="" class="choice">
                     <option>2</option>
                     <option>4</option>
                     <option>6</option>
                     <option>8</option>
                     <option>10</option>
                   </select>
                   <button class="choice_btn" onclick="get();">查询</button>
               </li>
                <div class="yue_btn" id="5" style="margin-left:90%; margin-top:5px;background-color: gray;border-radius:20px;width:7%;height:40px;padding-top:10px;padding-left: 15px;">                  
                    <a name="${pageContext.request.contextPath}/pilotSecondController/teamLaunch" class="glyphicon glyphicon-plus-sign dropdown" style="color: white;">发起</a>
                </div>                                 
            </ul>
        </div>
    </nav>
 </div>
 <div  class="yue_neirong"> 
  <iframe class="yue_ifram" width="100%" height="510px" id="center" src="${pageContext.request.contextPath}/pilotSecondController/sport?tid=1">
  </iframe> 
 </div>
</div>
</div>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/Cooldog.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
   
</body>
    

</html>