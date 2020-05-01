<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/WEB-INF/pages">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link  rel="stylesheet" href="../css/bootstrap.min.css"> 
  <link  rel="stylesheet" href="../css/TeamLaunch.css"> 
  <script src="../js/jquery.min.js"></script>
  <script type="text/javascript" src="../js/bootstrap.min.js"></script> 
  <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.config.js"></script>
  <script type="text/javascript" charset="utf-8" src="../ueditor/ueditor.all.js"></script>
  <link href="../ueditor/themes/default/css/ueditor.css" rel="stylesheet">
  <script type="text/javascript" charset="utf-8" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
 <script> 
$(document).ready(function(){
	
	$("#one").click(function(){
		 $("#collapseOne").slideToggle("slow");				
	});
	$("#two").click(function(){
		 $("#collapseTwo").slideToggle("slow");				
	});
	$("#three").click(function(){
		 $("#collapseThree").slideToggle("slow");				
	});
	$( "#datepicker" ).datepicker();
    $( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );

   $("#file0").change(function(){  
			 var objUrl = getObjectURL(this.files[0]) ;//获取文件信息  
			 console.log("objUrl = "+objUrl);  
			  if (objUrl) {  
			  $("#img0").attr("src", objUrl);  
			 }   
    	}) ;  
    function getObjectURL(file) {  
  			 var url = null;   
  			 if (window.createObjectURL!=undefined) {  
  			  url = window.createObjectURL(file) ;  
  			 } else if (window.URL!=undefined) { // mozilla(firefox)  
  			  url = window.URL.createObjectURL(file) ;  
  			 } else if (window.webkitURL!=undefined) { // webkit or chrome  
  			  url = window.webkitURL.createObjectURL(file) ;  
  			 }  
  			 return url ;  
  		}  
});
</script>
</head>
<body>
<div class="lun_all">

<div class="lun_head">
 <div id="lun_head_one">
 
 </div>
 <div id="lun_head_two">
          组建队伍
 </div>
</div>
<div class="lun_body">
<form class="cmxform" enctype="multipart/form-data" id="commentForm" method="post" action="${pageContext.request.contextPath}/teamController/teaminsert">
<div class="panel-group" id="accordion">
	<div class="panel">
		<div class="panel-heading">		       
			<div class="biaoti" id="one" >	
			  <span class="glyphicon glyphicon-align-center"></span>			
				基本信息
			  <span class="glyphicon glyphicon-align-center"></span>		
			</div>
		</div>
		<div id="collapseOne" >
		
			<div class="panel-body">
			 <div class="panel_one_wrap">
			   <div class="panel_one_left">
			    <div class="panel_one_left_img">
			    <img  src="../images/four.jpg" id="img0" style="width:100%;height:100%;">
			    </div>
			    <div class="panel_one_left_btn">
			     <label class="btnfile glyphicon glyphicon-edit" for="file0">上传队伍图片</label>          
                 <input type="file" name="file1" id="file0" style="position:absolute; clip:rect(0,0,0,0);">
			    </div>
			   </div>
			   <div class="panel_one_right">
			    <div class="panel_one_right_input">
			     <input type="text" name="teamname" value="" class="form-control" placeholder="队伍标题"></div>
			    <div class="panel_one_right_input">
			    <select name="type" class="form-control" placeholder="队伍类型">
		          <option>运动</option>
		          <option>登山</option>
		          <option>休闲</option>
		          <option>娱乐</option>
		        </select>
			    </div>
			    <div class="panel_one_right_input">
			     <input type="text" name="uname" value="" class="form-control" placeholder="创建者名字"></div>
			    <div class="panel_one_right_input">
			    <input type="text" name="date" value="" id="datepicker" class="form-control" placeholder="创建日期">
			    <input type="hidden" class="lng"  name="lng" value="">
			    <input type="hidden" class="lat"  name="lat" value="">	  
			    </div>		   
			   </div>
			 </div>
			</div>
		
		</div>
	</div>
	<div class="panel">
		<div class="panel-heading">
				<div class="biaoti" id="two">
			    <span class="glyphicon glyphicon-align-center"></span>			
				           队伍具体信息
				<span class="glyphicon glyphicon-align-center"></span>	
				</div>
		</div>
		<div id="collapseTwo">
			<div class="panel-body">
				<div class="laun_text"style="width: 100%;height: 500px;border: 1px solid gray">
					 <textarea id="editor" name="content"  type="text/plain" style="width:100%; height: 400px">
					    队伍具体信息
					 </textarea>			
				</div>
			</div>
		</div>
	</div>
	<div class="panel">
		<div class="panel-heading">
				<div class="biaoti" id="three">
			     <span class="glyphicon glyphicon-align-center"></span>			
				   参加
				 <span class="glyphicon glyphicon-align-center"></span>	
				</div>
		</div>
		<div id="collapseThree">
			<div class="panel-body">			
				<input class="btn btn-primary lun_submit" type="submit" value="确认发起">		
			</div>
		</div>
	</div>
</div>
</form>
</div>
</div>
</body>
  <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="jqueryui/style.css">
  
  
   <script type="text/javascript">
    UE.getEditor('editor');
   </script>
   
   
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