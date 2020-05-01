<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
	<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	
	
	<style type="text/css">
	body, html,#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin:0;
	font-family:"微软雅黑";
	}
	</style>
		<style>
			#left{
				width:50%; 
				height:50px; 
				background:#F0F0F0; 
				line-height:50px; 
				text-align:centre;
				float:left;
			
			
			}
    		.time1{
			   width:50%; 
			   height:50px; 
			   background:#F0F0F0; 
			   line-height:50px; 
			   text-align:right;
			   float:right;
						
			}
			.qq{			    
			    outline:0;
			    border-radius:20px;
			    color:#986655;
			    height:2em; 
			}
			.qqq{
			    outline:0;
			    border-radius:20px;
			    color:#986655;
			    height:2em; 
			}
			.div1{
			    text-align:center;
			     background-color: #F0F0F0;
			}
			.div2{
			    text-align:center;
			    background-color: #F0F0F0;
			}
			.selectop{
			   outline:0;
			   border-radius:20px;
			   color:#986655;
			}
			

  		</style>
		 <script language="javascript">
     			var t = null;
    			t = setTimeout(time,1000);//开始执行
    			function time()
    			{
      				clearTimeout(t);//清除定时器
       				dt = new Date();
				var y=dt.getYear()+1900;

				var mm=dt.getMonth()+1;

				var d=dt.getDate();

				var weekday=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];

				var day=dt.getDay();

        			var h=dt.getHours();

        			var m=dt.getMinutes();

        			var s=dt.getSeconds();

				if(h<10){h="0"+h;}

				if(m<10){m="0"+m;}

				if(s<10){s="0"+s;}

        			document.getElementById("timeShow").innerHTML =  "现在时间："+y+"年"+mm+"月"+d+"日"+weekday[day]+" "+h+":"+m+":"+s+"";

        			t = setTimeout(time,1000); //设定定时器，循环执行           

   			 }

  		</script>
	<script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&ak=mK55PnxMQ79ff5TAzWNdvQufGSTiy5n1&services=&t=20171014112628"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
<title>导航</title>
</head>
<body>		
	<div id="left">
	  <iframe id="fancybox-frame" 
		     name="fancybox-frame1521513593400" frameborder="0" scrolling="no" hspace="0"  					src="http://i.tianqi.com/index.php?c=code&a=getcode&id=34&h=25&w=280" style="height:50px">
      </iframe>
	</div>
		<div id="timeShow" class="time1"></div>
    
	<div id="r-result" class="div1" >
		出发地:<input type="text" class="qq"  id="startId" size="20" placeholder=" 起始位置。。。" style="width:300px;" />
		目的地:<input type="text" class="qqq"  id="destinationId" size="20" placeholder=" 目的地位置。。。" style="width:300px;" />
	</div>
	<div id="driving_way" class="div2" >
		<select style="height: 35px" class="selectop">
			<option value="0" class="b">最少时间</option>
			<option value="1" class="bb">最短距离</option>
			<option value="2" class="bbb">避开高速</option>
		</select>
		<input type="button" class="btn btn-danger" id="result" value="查询"/>
	</div>

	<div id="resultstep" style="width:200px;height:500px;overflow:auto;margin-top: 20px;display: none;z-index:2;position: absolute;"></div>
	<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
	<div id="allmap" style="width:100%;height:;overflow:auto;z-index:1;position:abosolute;"></div>
</body>
<script type="text/javascript">

    //我所在位置119.98186101,31.77139674
	// 百度地图API功能
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(117.22456, 31.84758), 11);  // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	map.setCurrentCity("合肥");          // 设置地图显示的城市 此项是必须设置的
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
		map.addControl(top_right_navigation); 
		
		
</script>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/> 
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=8cc355b1d46538c64a75d9a0b57ea744"></script>   
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <script type="text/javascript">
     $(function(){
    	 var map, geolocation;
    	    //加载地图，调用浏览器定位服务
    	    map = new AMap.Map('container', {
    	        resizeEnable: true
    	    });
    	    map.plugin('AMap.Geolocation', function () {
    	        geolocation = new AMap.Geolocation({
    	            enableHighAccuracy: true,//是否使用高精度定位，默认:true
    	            timeout: 100000,          //超过10秒后停止定位，默认：无穷大
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
    	        $(".lng").attr("value",lng);
    	        $(".lat").attr("value",lat);
    	    }
    	    //解析定位错误信息
    	    function onError(data) {
    	        document.getElementById('tip').innerHTML = '定位失败';
    	    }
    	 
     });
   </script>
</html>