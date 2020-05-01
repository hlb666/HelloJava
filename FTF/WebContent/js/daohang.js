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

t = setTimeout(time,1000);

}



//我所在位置119.98186101,31.77139674
// 百度地图API功能
var map = new BMap.Map("allmap");    // 创建Map实例
map.centerAndZoom(new BMap.Point(119.9818, 31.7713), 11);  // 初始化地图,设置中心点坐标和地图级别
map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
map.setCurrentCity("常州");          // 设置地图显示的城市 此项是必须设置的
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
	
	
