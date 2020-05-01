<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <title>全局信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="js/jquery.min.js"></script>
    <script src="js/latlon-geohash.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=rTftA1rhmp7dbId0B2j3qTd2"></script>    
    <style type="text/css">
        body,
        html {
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }
        #allmap {
            height: 900px;
            width: 100%;
        }
        #control {
            width: 100%;
        }
    </style>
</head>
<body>
    <input type="hidden" name="" class="all_geohash"  size="200" value="">       
    <input type="button" value="点击--查看信息" id="search" style="width: 100%;color: #977C00	">
    <div id="allmap"></div>
    
    
    
    <script type="text/javascript">   
	
 	var availableTags ;
  	
  	$.get("local.do",function(data,status){
	  	   availableTags =eval(data);   //eval()  把数据进行 取值
	  	 $(".all_geohash").attr('value',availableTags); 
			}); 
        var map = new BMap.Map("allmap");
        var bp_arr = new Array();
        // 根据点的数组自动调整缩放级别
        function set_zoom(bp_arr) {    	
            var view = map.getViewport(eval(bp_arr));
            var mapZoom = view.zoom;
            var centerPoint = view.center;
            map.centerAndZoom(centerPoint, mapZoom);
        }
        /**
         * 经纬度数组，会连成一条线
         * */
        function add_ploygon(p_arr) {
            var point_arr = p_arr.map(function (item, index) {
                var bp = new BMap.Point(item.longitude, item.latitude);
                bp_arr.push(bp);
                var marker = new BMap.Marker(bp);  // 创建标注
	            map.addOverlay(marker);              // 将标注添加到地图中
                var label = new BMap.Label(item.geohash,{offset:new BMap.Size(10,-10)});
                marker.setLabel(label);
                return bp;
            });
            // var polygon = new BMap.Polygon(point_arr, { strokeColor: "blue", strokeWeight: 2, strokeOpacity: 0.5 });  //创建多边形
            // map.addOverlay(polygon);   //增加多边形  
            
        }       
        function calculate_geohash(){     	
            var all_geo_str = $(".all_geohash").val();
            var all_arr = all_geo_str.split(",");
            console.log(all_arr);
            var points = all_arr.map(geohash_str => {
                geohash_str = $.trim(geohash_str);
                var decoded_gps = Geohash.decode(geohash_str);
                var cur_geo = {
                    longitude: decoded_gps.lon,
                    latitude: decoded_gps.lat,
                    geohash: geohash_str
                    
                };
                return cur_geo;
            });

            return points;
        }
       
    </script>   
<script>
        $(function () {
            $("#search").click(init);
        });
        function init(){
            // 百度地图API功能
            map = new BMap.Map("allmap");
            map.centerAndZoom(new BMap.Point(117.2264660000, 31.8514780000), 5);
            map.enableScrollWheelZoom();
            bp_arr = new Array();
            all_p = calculate_geohash();
            add_ploygon(all_p);
            set_zoom(bp_arr);          
        }
        init();
    </script>
</body>
</html>
<!-- 
    var availableTags ;
    	$.get("local.do",function(data,status){
	  	   availableTags =eval(data);   //eval()  把数据进行 取值
	  	   alert(availableTags); 	   
			});  -->