<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/WEB-INF/pages">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>导航信息</title>
    <link rel="stylesheet" href="../css/daohang.css">
    <link href="../css/bootstrap.min.css" rel="stylesheet">  
	<script src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/daohang.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&ak=mK55PnxMQ79ff5TAzWNdvQufGSTiy5n1&services=&t=20171014112628"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<style type="text/css">
html,body{
background:#FAFAFA;
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
height: 99%;
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
overflow:scroll; 
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
	<a href="${pageContext.request.contextPath}/userLoginController/trysts"><span class="glyphicon glyphicon-road"></span>&emsp;约吧—邻约</a>
	</li>
	<li>
	<a href="${pageContext.request.contextPath}/userLoginController/daohang" style="background-color:white;"><span class="glyphicon glyphicon-qrcode"></span>&emsp;导航信息</a>
	</li>
	<hr>	
	<li><a  class="person" href="${pageContext.request.contextPath}/userLoginController/persons"><span class="glyphicon glyphicon-user"></span>&emsp;个人中心</a></li>
    <li><a class="person" href="${pageContext.request.contextPath}/userLoginController/tuling"><span class="glyphicon glyphicon-user"></span>&emsp;智能答疑</a></li>
	<hr/>
</ul>
</div>
<div class="content">
<div class="heads">
 <div id="left">
  <iframe id="fancybox-frame" name="fancybox-frame1521513593400"
		frameborder="0" scrolling="no" hspace="0"
		src="http://i.tianqi.com/index.php?c=code&a=getcode&id=34&h=25&w=280"
		style="height: 50px"> 
  </iframe>
 </div>
 <div id="timeShow" class="time1"></div>
 </div>
 <div class="baoguo">
 <div id="r-result" class="aa">
	<input type="text" class="form-control qq" id="startId" size="20" placeholder="起始位置。。。" style="width: 300px;" /> 
    <input type="text" class="form-control qqq" id="destinationId" size="20" placeholder="目的地位置。。。" style="width: 300px;"/>
 </div>
  <div id="driving_way"  class="aaa">
	<select class="selectpicker selects">
		<option value="0" class="b">最少时间</option>
		<option value="1" class="bb">最短距离</option>
		<option value="2" class="bbb">避开高速</option>
	</select> 
	<input type="button" class="btn btn-primary" style="width:50;height:30px;" id="result" value="查询" />
 </div> 
 </div>
 
 <br>
 <div id="resultstep"
	style="width: 200px; height: 500px; overflow: auto; margin-top: 115px; display: none; z-index: 2; position: absolute;">
 </div>
 <div id="searchResultPanel"
	style="border: 1px solid #C0C0C0; width: 150px; height: auto; display: none;">
 </div>
 <div id="allmap"
	style="width: 100%; height:; overflow: auto; z-index: 1; position: abosolute;top:70px; right:15px;">
 </div>
 </div>
</div>
</body>
<script type="text/javascript">
window.onload=function(){
$('.selectpicker').selectpicker(); 
};
</script>
<script type="text/javascript">

    //我所在位置119.98186101,31.77139674
	// 百度地图API功能
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(118.35668, 31.28525), 11);  // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	map.setCurrentCity("芜湖");          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	
	function G(id) {
		return document.getElementById(id);
	}
	
	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
			{"input" : "startId","location" : map});

	var bc = new BMap.Autocomplete(    //建立一个自动完成的对象
			{"input" : "destinationId","location" : map});
	
		ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
		var str = "";
			var _value = e.fromitem.value;
			var value = "";
			if (e.fromitem.index > -1) {
				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			}    
			str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
			
			value = "";
			if (e.toitem.index > -1) {
				_value = e.toitem.value;
				value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			}    
			str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
			G("searchResultPanel").innerHTML = str;
		});

		bc.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
			var str = "";
				var _value = e.fromitem.value;
				var value = "";
				if (e.fromitem.index > -1) {
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
				
				value = "";
				if (e.toitem.index > -1) {
					_value = e.toitem.value;
					value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
				}    
				str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
				G("searchResultPanel").innerHTML = str;
			});
		
		var myValue;
		ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
		var _value = e.item.value;
			myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
			
			setPlace();
		});

		var myValue;
		bc.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
		var _value = e.item.value;
			myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
			G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
			
			setPlace();
		});
		
		function setPlace(){
			map.clearOverlays();    //清除地图上所有覆盖物
			function myFun(){
				var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
				map.centerAndZoom(pp, 18);
				map.addOverlay(new BMap.Marker(pp));    //添加标注
			}
			var local = new BMap.LocalSearch(map, { //智能搜索
			  onSearchComplete: myFun
			});
			local.search(myValue);
		}

		//三种驾车策略：最少时间，最短距离，避开高速
		var routePolicy = [BMAP_DRIVING_POLICY_LEAST_TIME,BMAP_DRIVING_POLICY_LEAST_DISTANCE,BMAP_DRIVING_POLICY_AVOID_HIGHWAYS];
		$("#result").click(function(){
			$("#resultstep").css("display","block");
			var start = $("#startId").val();
			var end = $("#destinationId").val();
			//alert(start+"--"+end);
			map.clearOverlays(); 
			var i=$("#driving_way select").val();
			search(start,end,routePolicy[i]); 
			function search(start,end,route){ 
				var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true},policy: route});
				driving.search(start,end);
			}
			
			//驾车计算时间和距离
			var output = "从"+start+"到"+end+"驾车需要";
			var searchComplete = function (results){
				if (transit.getStatus() != BMAP_STATUS_SUCCESS){
					return ;
				}
				var plan = results.getPlan(0);
				output += plan.getDuration(true) + "\n";                //获取时间
				output += "总路程为：" ;
				output += plan.getDistance(true) + "\n";             //获取距离
			}
			var transit = new BMap.DrivingRoute(map, {renderOptions: {map: map},
				onSearchComplete: searchComplete,
				onPolylinesSet: function(){        
					setTimeout(function(){
						
					},"1000");
					//$("#resultCount").html(output);
			}});
			transit.search(start, end);		
			//驾车步骤
	 		var transit = new BMap.DrivingRoute(map, {
				renderOptions: {
				map: map,
				panel: "resultstep",
				enableDragging : true //起终点可进行拖拽
				},  
			});
			transit.search(start,end);
		});
		
		//比例尺控件
		var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
		var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
		var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
		/*缩放控件type有四种类型:
		BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
		//默认加载地图add比例尺控件
		map.addControl(top_left_control);        
		map.addControl(top_left_navigation);     
		
</script>
</html>