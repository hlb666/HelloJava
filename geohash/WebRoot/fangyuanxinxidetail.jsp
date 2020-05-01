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
<script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&ak=mK55PnxMQ79ff5TAzWNdvQufGSTiy5n1&services=&t=20171014112628"></script>
<LINK type="text/css" rel=stylesheet href="qtimages/style.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/arrow.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
</head>
<script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'在线评论',550,250) ;
}
</script> 
<%
	String id=request.getParameter("id");	
%>
<body>
<jsp:include page="qttop.jsp"></jsp:include>
<div class="section">
  <div class="kcBox clear-fix">
    <div class="knowList3 clear-fix">
      <div class="Ttitle">房源信息 <span>Details</span>
        <div class="Tmore">  </div>
      </div>
      <!-- end Ttitle-->
      <ul class="knowListUl2">
	  <font color="#000000">	
<!------------------------------------ 详细信息区域 ------------------------------->   	  						  
   <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse;color:#333333;font-size:14"  class="newsline">  
      <tr>
		 <td width='11%' height=44>房源编号：</td><td width='39%'>${fangyuanxinxi.fangyuanbianhao}</td>
		 <td  rowspan=12 >
		   <a href=${fangyuanxinxi.fangwuzhaopian} target=_blank>
		   <img src=${fangyuanxinxi.fangwuzhaopian}  width=228 height=215 border=0 style="margin-left:210px;"></a>	 
		   <div style="border: 1px solid #F0F0F0; width:300px;height:215px;margin-left:176px;margin-top: 30px;">
		    <div id="allmap" style="width:100%;height: 100%;"></div>
			  <div id="r-result">
			   <input id="longitude" type="hidden" value="${fangyuanxinxi.lng }" style="width:100px; margin-right:10px;" />
			   <input id="latitude" type="hidden" value="${fangyuanxinxi.lat}" style="width:100px; margin-right:10px;" />			
			  </div>
		   </div>
		 </td>
		
	  </tr>
	  <tr>
         <td width='11%' height=44>房源名称：</td><td width='39%'>${fangyuanxinxi.fangyuanmingcheng}</td></tr><tr>         
         <td width='11%' height=44>所在楼层：</td><td width='39%'>${fangyuanxinxi.suozailouceng}</td></tr><tr>
         <td width='11%' height=44>总楼层：</td><td width='39%'>${fangyuanxinxi.zonglouceng}</td></tr><tr>
         <td width='11%' height=44>户型结构：</td><td width='39%'>${fangyuanxinxi.huxingjiegou}</td></tr><tr>
         <td width='11%' height=44>建筑面积：</td><td width='39%'>${fangyuanxinxi.jianzhumianji}</td></tr><tr>
         <td width='11%' height=44>建成年份：</td><td width='39%'>${fangyuanxinxi.jianchengnianfen}</td></tr><tr>
         <td width='11%' height=44>所在位置：</td><td width='39%'>${fangyuanxinxi.suozaiweizhi}</td></tr><tr>
         <td width='11%' height=44>配套设施：</td><td width='39%'>${fangyuanxinxi.peitaosheshi}</td></tr><tr>
         <td width='11%' height=44>月租金：</td><td width='39%'>${fangyuanxinxi.yuezujin}</td></tr><tr>
         <td width='11%' height=44>房源状态：</td><td width='39%'>${fangyuanxinxi.fangyuanzhuangtai}</td></tr><tr>        
         <td width='11%' height=44>发布人：</td><td width='39%'>${fangyuanxinxi.faburen}</td></tr><tr>
         <td width='11%' height=100  >详情描述：</td><td width='39%' colspan=2 height=100 >${fangyuanxinxi.faburen}</td></tr><tr>							 
         <td colspan="3"><table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse;color:#333333;font-size:14" class="newsline">
      <tr>
         <td width="30" align="center" bgcolor="CCFFFF">序号</td>
         <td width="471" bgcolor='#CCFFFF'>评价内容</td>
         <td width="88" bgcolor='#CCFFFF'>评分</td>
         <td width="88" bgcolor='#CCFFFF'>评论人</td>
         <td width="138" align="center" bgcolor="CCFFFF">评论时间</td>
      </tr>
		<%@page import="com.util.db"%>
<%
	int pli=0;
    for(HashMap map:new db().getpinglun("shangpinxinxi",id)){
	pli=pli+1;
%>
         <tr>
             <td width="30" align="center" bgcolor='#CCFF99'><%=pli%></td>
             <td width="471" bgcolor='#CCFF99'><%=map.get("pinglunneirong") %></td>
             <td width="88" bgcolor='#CCFF99'><%=map.get("pingfen") %></td>
             <td width="88" bgcolor='#CCFF99'><%=map.get("pinglunren") %></td>
             <td width="138" align="center" bgcolor="CCFF99"><%=map.get("addtime") %></td>
         </tr>
<%								 
	}
%>
<!------------------------------------ 打印区域 ------------------------------->   
    </table>
      </td>
       </tr><tr>
      <td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />
        <input type=button name=Submit52 value=打印 onClick="javascript:window.print()" /> <!--jixaaxnnxiu-->
        <input type=button name=Submit53 value=评论 onClick="javascript:hsgpinglun('fangyuanxinxi','<%=id%>')"/>
        <input type=button name=Submit52 value=收藏 onClick="javascript:location.href='jrsc.jsp?id=<%=id%>&biao=fangyuanxinxi&ziduan=fangyuanmingcheng';" />
        <input type=button name=Submit52 value=租房 onClick="javascript:location.href='zufangjiluadd.jsp?id=<%=id%>';" />
        </td></tr>   
   </table>							  
 </font>
 <!------------------------------------ 底部区域 ------------------------------->   
    </ul>
      <!-- end knowListUl-->
     </div>
    <!-- end knowList-->
    <div class="contact">
      <div class="numTel">400-0000-000</div>
      <dl>
        <dt>手&nbsp;&nbsp;&nbsp;机：</dt>
        <dd>12312312312</dd>
      </dl>
      <dl>
        <dt>电&nbsp;&nbsp;&nbsp;话：</dt>
        <dd>0000-00000000</dd>
      </dl>
      <dl>
        <dt>邮&nbsp;&nbsp;&nbsp;箱：</dt>
        <dd>aaaaaaaa@aa.com</dd>
      </dl>
      <dl>
        <dt>地&nbsp;&nbsp;&nbsp;址：</dt>
        <dd>xxxxxxxxxxxxxxxxxxxx</dd>
      </dl>
	  <dl>
        <dt>联系人：</dt>
        <dd>何总</dd>
      </dl>
      <div class="conMore"><a href="">更多 +</a></div>
    </div>
    <!-- end contact-->
  </div>
  <!-- end kcBox-->
</div>
<jsp:include page="qtdown.jsp"></jsp:include>
</body>
<script type="text/javascript">  
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(116.331398,39.897445),21);
    map.enableScrollWheelZoom(true);   
    // 用经纬度设置地图中心点
        if(document.getElementById("longitude").value != "" && document.getElementById("latitude").value != ""){
            map.clearOverlays(); 
            var new_point = new BMap.Point(document.getElementById("longitude").value,document.getElementById("latitude").value);
            var marker = new BMap.Marker(new_point);  // 创建标注
            map.addOverlay(marker);              // 将标注添加到地图中
            map.panTo(new_point);      
        }  
</script>
</html>
