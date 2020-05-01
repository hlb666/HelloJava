	<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<!DOCTYPE html>
<html>
<head>

<title>房源信息</title>

<LINK type="text/css" rel=stylesheet href="qtimages/style.css">

<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/arrow.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
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
    	        $.ajax({
    	    		url:"${pageContext.request.contextPath}/ajax.do?lng="+lng+"&lat="+lat,
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
   </script>




<style type="text/css">
.knowList3{
width:100%;
}
.fangyuanimg{
width: 100%;
height: 100%; 
border: 1px solid red;
box-shadow: 10px 10px 10px #999999;
border-radius: 30px;
overflow: hidden;
}
.daohang{
width: 100%;
height: 700px;
border: 10px soild balck;

}
</style>

</head>

<%

%>

<body>
<jsp:include page="qttop.jsp"></jsp:include>
<div class="section">
  <div class="kcBox clear-fix">
    <div class="knowList3 clear-fix">
      <div class="Ttitle">房源信息 <span>Details</span>
        <div class="Tmore"></div>
      </div>
      <!-- end Ttitle-->
      <ul class="knowListUl2">
	  <font color="#000000">
	                          							  
<form action="fyxxList.do" name="myform" method="post" style="width: 100%;">
<table>
 <tr>
   <td>房源名称：</td><td><input name="fangyuanmingcheng"  class="form-control" type="text" id="fangyuanmingcheng"  style="border:solid 1px #000000; color:#666666;height: 22px;width: 100px"/> </td>
   <td>所在楼层：</td><td><input name="suozailouceng" class="form-control" type="text" id="suozailouceng" style="border:solid 1px #000000; color:#666666;height: 22px;width: 100px" /></td>
   <td>户型结构：</td><td><input name="huxingjiegou" class="form-control" type="text" id="huxingjiegou" style="border:solid 1px #000000; color:#666666;height: 22px;width: 100px" /></td>
   <td>建筑面积：</td><td><input name="jianzhumianji" class="form-control" type="text" id="jianzhumianji" style="border:solid 1px #000000; color:#666666;height: 22px;width: 100px"/></td>
   <td>建成年份：</td><td><input name="jianchengnianfen1" class="form-control" type="text" id="jianchengnianfen1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' /></td>
   <td>-</td><td><input name="jianchengnianfen2"  class="form-control" type="text" id="jianchengnianfen2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' /></td>
 </tr>
 <tr>
   <td>所在位置：</td><td><input  name="suozaiweizhi" class="form-control" type="text" id="suozaiweizhi" style='border:solid 1px #000000; color:#666666' size="12" /></td>
   <td>月租金：</td><td><input name="yuezujin" class="form-control" type="text" id="yuezujin" style='border:solid 1px #000000; color:#666666' size="12" /></td>
   <td>房源状态：</td>  
   <td>  
    <select name='fangyuanzhuangtai' id='fangyuanzhuangtai' style='border:solid 1px #000000; color:#666666;'>
	   <option value="">
	                     所有
	   </option>
	   <option value="空闲">
	                     空闲
	   </option>
	   <option value="已租">
	                     已租
	   </option>
    </select>
   </td>
   <td>房源范围(KM)：</td>  
   <td>  
    <select name="radius" class="choice" >
       <option value="2">5</option>
       <option value="4">10</option>
       <option value="6">15</option>
       <option value="8">20</option>
       <option value="10">25</option>
    </select>
   </td>
   <td> <input type="submit" value="查询" /> </td>
 </tr>
</table>	 
</form>	
     <br/>
      <table width="100%" height="12%" border="0" align="center" cellpadding="0" cellspacing="0" >
              <tr>
                <%
					int i=0;
				%>
				<c:forEach items="${list}" var="u">
				<%
					i++;
				%>
                  <td align="center"><table width="150" height="153" border="0" cellpadding="0" cellspacing="0" style="color:#333333">
                <tr>
                   <td height="126px" align="center">
                     <div class="fangyuanimg" >
                      <a href="fyxxDetail.do?id=${u.id}">
                       <img src="${u.fangwuzhaopian}" width="100%" height="100%" border="0" />
                      </a>
                      </div>
                   </td>
                </tr>
                <tr>
                   <td height="26" align="center">${u.fangyuanmingcheng}.${u.code }</td>
                </tr>
             </table></td>
		   <%
				if (i==4)
			{
			i=0;
			out.print("</tr><tr>");
			}

		   %>
		</c:forEach>                 
        </tr>
      </table>
     <br>
        <p align="center"> <c:if test="${sessionScope.p==1}">
		 <c:if test="${page.page>1}">
            <a href="fyxxList.do?page=1" >首页</a>
            <a href="fyxxList.do?page=${page.page-1}"> 上一页</a>             </c:if>
    	    <c:if test="${page.page<page.totalPage}">
			<a href="fyxxList.do?page=${page.page+1}">下一页</a>
			<a href="fyxxList.do?page=${page.totalPage}">末页</a>		    </c:if>		
	      </c:if>
	    </p>
   </font>    
</ul>
    </div>
  </div>
</div>
<div class="daohang">
  <iframe id="wrapdaohang" src="daohang.jsp" width="100%" height="100%">
  </iframe>
</div>
<jsp:include page="qtdown.jsp"></jsp:include>

</body>
</html>
