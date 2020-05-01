<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/WEB-INF/pages">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首頁</title>
<link rel="stylesheet" href="../css/Cooldog.css">
<link rel="stylesheet" href="../css/iconfont.css">
 <link rel="stylesheet" href="../css/styles.css" >
 <script src="../js/jquery.min.js"></script>
 <link  rel="stylesheet" href="../css/bootstrap.min.css">  
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
border: 1px solid black;
overflow-y: scroll;
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
.suanfa{
  width: 90%;
  height: 39px;
  border-bottom: 2px solid #DDDDDD;
  margin-left:5%;
  margin-top: 5px;
  text-align:left;
  line-height: 39px;
}
.suanfb{
  width: 90%;
  height: 500px;
  border: 2px solid #DDDDDD;
  margin-left:5%;
  margin-top: 5px;
}
.suanfc{
  width: 90%;
  height: 39px;
  border-bottom: 2px solid #DDDDDD;
  margin-left:5%;
   margin-top: 5px;
  text-align:left;
  line-height: 39px;
}
.suanfd{
  width: 90%;
  height: 200px;
  border: 2px solid #DDDDDD;
  margin-left:5%;
  margin-top: 5px;
}
.suanfe{
  width: 90%;
  height: 39px;
  border-bottom: 2px solid #DDDDDD;
  margin-left:5%;
  margin-top: 5px;
  text-align:left;
  line-height: 39px;
}
.suanff{
  width: 90%;
  height: 100px;
  border: 2px solid #DDDDDD;
  margin-left:5%;  
  background-color:gray;
  margin-top: 5px;
}
.suanff  a{
color:white;
}
.suanfs{
  width: 90%;
  height: 30px;
  border: 2px solid #DDDDDD;
  margin-left:5%;
  margin-top: 5px;
  background-color: #337ab7;
}
.divcontent{
 width: 160px;
 height: 180px;
 border: 1px solid red;
}
.suanfd_one{
width: 310px;
height: 190px;
float: left;
margin-right: 15px;
margin-left: 8px;
}
.suanfd_one_img{
width: 310px;
height: 160px;
}
.suanfd_one_top{
width: 310px;
height: 30px;
color: black;
text-align: center;
}
.suanff_one{
width: 33.2%;
height: 100px;
border-right:1px solid white;
padding-left:5px;
float: left;

}
.lines{
margin-top:5px; 
width: 330px;
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
 ${user2name}
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
	<a href="${pageContext.request.contextPath}/userLoginController/main" style="background-color:white;"><span class="glyphicon glyphicon-home"></span>&emsp;首页</a>
	</li>
	<li>
	<a href="${pageContext.request.contextPath}/userLoginController/trysts"><span class="glyphicon glyphicon-road"></span>&emsp;约吧—邻约</a>
	</li>
	<li>
	<a href="${pageContext.request.contextPath}/userLoginController/daohang"><span class="glyphicon glyphicon-qrcode"></span>&emsp;导航信息</a>
	</li>
	<hr/>
	<li><a class="person" href="${pageContext.request.contextPath}/userLoginController/persons"><span class="glyphicon glyphicon-user"></span>&emsp;个人中心</a></li>
	<li><a class="person" href="${pageContext.request.contextPath}/userLoginController/tuling"><span class="glyphicon glyphicon-user"></span>&emsp;智能答疑</a></li>
	<hr/>
</ul>
</div>
<div class="content">
  <div class="lunfan">
    <!--轮播图 开始 -->
   <div class="Cooldog_container">
    <div class="Cooldog_content">
        <ul>
            <li class="p1">         
                    <img src="../images/1.png" alt="">         
            </li>
            <li class="p2">          
                    <img src="../images/2.png" alt="">
            </li>
            <li class="p3">            
                    <img src="../images/3.png" alt="">             
            </li>
            <li class="p4">            
                    <img src="../images/4.png" alt="">              
            </li>
            <li class="p5">             
                    <img src="../images/5.png" alt="">          
            </li>
            <li class="p5">              
                    <img src="../images/6.png" alt="">              
            </li>
            <li class="p5">            
                    <img src="../images/7.png" alt="">
            </li>
        </ul>
    </div>
    <a href="javascript:;" class="btn_left">
        <i class="iconfont icon-zuoyoujiantou"></i>
    </a>
    <a href="javascript:;" class="btn_right">
        <i class="iconfont icon-zuoyoujiantou-copy-copy"></i>
    </a>
    <div class="buttons clearfix">
        <a href="javascript:;" class="color"></a>
        <a href="javascript:;"></a>
        <a href="javascript:;"></a>
        <a href="javascript:;"></a>
        <a href="javascript:;"></a>
        <a href="javascript:;"></a>
        <a href="javascript:;"></a>
    </div>
</div>
    <!--轮播图 结束 -->
  </div>
      <div class="suanfa" >
                 推荐运动
     </div>
     <div class="suanfb">
     <c:forEach items="${lists }" var="list">
        <div class="col-lg-3 col-md-4 col-sm-6">
		    <div class="thumbnail">
		      <a href="${pageContext.request.contextPath}/pilotSecondController/teamc?id=${list.id }">
		      <img style="height: 160px"  src="${list.pic }" alt="">
		      </a>
		      <div class="caption">
		        <span class="text-center"style="color: black;font-size:10px;">${list.title }</span>	        
		      </div>
		    </div>
		  </div>
    </c:forEach>
     </div>
     <div class="suanfc">
                独家放送
     </div>
     <div class="suanfd">
     <div class="suanfd_one">
      <div class="suanfd_one_img">
      <img alt="" src="../images/four.jpg" width="100%" height="100%">    
      </div>
      <div class="suanfd_one_top">
                   第一个让你心动，铃木！
      </div>
     </div>
     <div class="suanfd_one">
       <div class="suanfd_one_img">
        <img alt="" src="../images/two.jpg" width="100%" height="100%">    
      </div>
      <div class="suanfd_one_top">
      天行健，君子以自强不息！
      </div>
     </div>
     <div class="suanfd_one">
       <div class="suanfd_one_img">
        <img alt="" src="../images/one.jpg" width="100%" height="100%">    
      </div>
      <div class="suanfd_one_top">
      哈网的柠檬
      </div>
     </div>
     </div>
          <div class="suanfd">
     <div class="suanfd_one">
      <div class="suanfd_one_img">
      <img alt="" src="../images/four.jpg" width="100%" height="100%">    
      </div>
      <div class="suanfd_one_top">
                   第一个让你心动，铃木！
      </div>
     </div>
     <div class="suanfd_one">
       <div class="suanfd_one_img">
        <img alt="" src="../images/two.jpg" width="100%" height="100%">    
      </div>
      <div class="suanfd_one_top">
      天行健，君子以自强不息！
      </div>
     </div>
     <div class="suanfd_one">
       <div class="suanfd_one_img">
        <img alt="" src="../images/one.jpg" width="100%" height="100%">    
      </div>
      <div class="suanfd_one_top">
      哈网的柠檬
      </div>
     </div>
     </div>
     <div class="suanfe" >
             友情链接
     </div>
     <div class="suanff">    
     <div class="suanff_one">    
        <div class="lines"><a>西西论坛</a></div>
        <div class="lines"><a >CSDN论坛</a></div>
        <div class="lines"><a href="https://www.cnblogs.com/zyguo/p/4705270.html">敏感词过滤的算法原理之 Aho-Corasick算法</a></div>         
     </div>
     <div class="suanff_one">
        <div class="lines"><a href="http://www.cnblogs.com/LBSer/p/3298057.html">Geohash距离估算</a></div>
        <div class="lines"><a href="https://blog.csdn.net/fjssharpsword/article/details/53693115?tdsourcetag=s_pcqq_aiomsg">Java实现余弦定理计算文本相似度</a></div>
        <div class="lines"><a href="https://www.cnblogs.com/softfair/p/distance_of_two_latitude_and_longitude_points.html">Great-circle distance</a></div> 
     </div>
     <div class="suanff_one">
        <div class="lines"><a href="https://blog.csdn.net/lchq1995/article/details/70212644">geohash算法及实现</a> </div>
        <div class="lines"><a href="https://www.cnblogs.com/LBSer/p/4471742.html">地理围栏算法解析（Geo-fencing）</a></div>
        <div class="lines"><a href="https://www.cnblogs.com/LBSer/p/3310455.html">GeoHash核心原理解析</a></div> 
     </div>      
     </div>
     
     <div class="suanfs">     
     </div>
    </div>
</div>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/Cooldog.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
</body>
</html>