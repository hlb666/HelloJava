<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>异清轩博客</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/nprogress.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/styleo.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="<%=basePath%>/images/icon/icon.png">
<link rel="shortcut icon" href="<%=basePath%>/images/icon/favicon.ico">
<script src="<%=basePath%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=basePath%>/js/nprogress.js"></script>
<script src="<%=basePath%>/js/jquery.lazyload.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="<%=basePath%>/js/jquery-ui.js"></script>
  <script src="<%=basePath%>/js/jquery-ui.min.js"></script>
<script type="text/javascript">
function load(){
	var result = $("#judge").val();	
	var name = $("#user").text();
	if(name===''){	
	}else{	
		//$('#logins').css("visible", "none");
		document.getElementById("logins").style.visibility="hidden";
	}
	if (result===''){
	}else{
		alert(result);
	}
}
$(function(){
	var clock = document.getElementById("clock");
	setInterval(function() {
		var d = new Date();
		var year = d.getFullYear();
		var month = d.getMonth() + 1;
		var date = d.getDate();
		var days = new Array("日","一","二","三","四","五","六");
		var day = d.getDay();
		var hour = (d.getHours() < 10) ? ("0" + d.getHours()) : d.getHours();
		var min = (d.getMinutes() < 10) ? ("0" + d.getMinutes()) : d.getMinutes();
		var sec = (d.getSeconds() < 10) ? ("0" + d.getSeconds()) : d.getSeconds();
		var now = year + "年" + month + "月" + date + "日星期" + days[day]+ hour + ":" + min + ":" + sec;
		clock.innerHTML =  now;
	}, 1000);
});

<%--
$( function() {	  
	  $.ajax({
			url:"${pageContext.request.contextPath}/preOperateController/autoComplete",
			type:"get",
			scriptCharset:"UTF-8",
			success:function(data){
			  var availableTags = eval(data);
			  alert(availableTags);
			  $("#tags").autocomplete({
			      source: availableTags
			    });
			}	
		});			       
  });
  --%>
$( function() {
	  $.get("${pageContext.request.contextPath}/preOperateController/autoComplete",function(data,status){
       var availableTags =eval(data);   //eval()  把数据进行 取值
	   $( "#test" ).autocomplete({
	      source: availableTags
	    });
			});       
	  } );
</script>
</head>
<body class="user-select" onload="load()">
<header class="header">
  <nav class="navbar navbar-default" id="navbar">
    <div class="container">
      <div class="header-topbar hidden-xs link-border">
        <ul class="site-nav topmenu">
          <li><a href="${pageContext.request.contextPath}/fileDownController/fieDown">资源下载</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/toreaders" rel="nofollow">读者墙</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tolinks" rel="nofollow">友情链接</a></li>
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" rel="nofollow">关注本站 <span class="caret"></span></a>
            <ul class="dropdown-menu header-topbar-dropdown-menu">
              <li><a data-toggle="modal" data-target="#WeChat" rel="nofollow"><i class="fa fa-weixin"></i> 微信</a></li>
              <li><a href="#" rel="nofollow"><i class="fa fa-weibo"></i> 微博</a></li>
              <li><a data-toggle="modal" data-target="#areDeveloping" rel="nofollow"><i class="fa fa-rss"></i> RSS</a></li>
            </ul>
          </li>
        </ul>
       <div id="logins" >
        <a style="color: #6A5ACD;" data-toggle="modal" data-target="#loginModal" class="login" rel="nofollow">Hi,请登录</a>
          &nbsp;&nbsp;
        <a style="color: #6A5ACD;" href="${pageContext.request.contextPath}/backController/login" class="register" rel="nofollow">后台管理</a>
          &nbsp;&nbsp;
  
        </div>
       </div>
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <h1 class="logo hvr-bounce-in"><a href="" title=""><img src="../images/logo.png" alt=""></a></h1>
      </div>
      <div class="collapse navbar-collapse" id="header-navbar">
        <ul class="nav navbar-nav navbar-right">
          <li class="hidden-index active">
          <a data-cont="异清轩首页" href="${pageContext.request.contextPath}/mainController/tomain">异清轩首页</a>
          </li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=1">前端技术</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=2">后端程序</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=3">管理系统</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=4">授人以渔</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=5">程序人生</a></li>
          <li><a name="lianjie" id="user"><img alt="" style="width: 40px;height: 40px;border:1px solid;border-radius:20px" src="${pic}">${name}</a></li>
        </ul>
        <input type="hidden" id="judge" value="${MSG}">
        
  <!-- -----------------------------------搜索框区-------------------------------- -->      
       <!--   <form class="navbar-form visible-xs" action="/Search" method="post">
          <div class="input-group">
            <input  id="tags" name="search" class="form-control">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>-->
                
      </div>
    </div>
  </nav>
</header>
<section class="container">
  <div class="content-wrap">
    <div class="content"> 
<!-- -----------------------------------公告区区-------------------------------- -->
      <div class="jumbotron">
        <h1>欢迎访问异清轩博客</h1>
        <p>在这里可以看到前端技术，后端程序，网站内容管理系统等文章，还有我的程序人生！</p>
      </div>
      
      
 <!-- -----------------------------------轮番图区-------------------------------- -->
      <div id="focusslide" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#focusslide" data-slide-to="0" class="active"></li>
          <li data-target="#focusslide" data-slide-to="1"></li>
          <li data-target="#focusslide" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active"> <a href="" target="_blank"><img src="../images/banner/banner_01.jpg" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
          <div class="item"> <a href="" target="_blank"><img src="../images/banner/banner_02.jpg" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
          <div class="item"> <a href="" target="_blank"><img src="../images/banner/banner_03.jpg" alt="" class="img-responsive"></a> 
            <!--<div class="carousel-caption"> </div>--> 
          </div>
        </div>
        
        <a class="left carousel-control" href="#focusslide" role="button" data-slide="prev" rel="nofollow"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">上一个</span> </a> <a class="right carousel-control" href="#focusslide" role="button" data-slide="next" rel="nofollow"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">下一个</span> </a> </div>
  <!-- -----------------------------------今日推荐区-------------------------------- -->
      <article class="excerpt-minic excerpt-minic-index">
        <h2><span class="red">【今日推荐】</span><a href="" title="">从下载看我们该如何做事</a></h2>
        <p class="note">一次我下载几部电影，发现如果同时下载多部要等上几个小时，然后我把最想看的做个先后排序，去设置同时只能下载一部，结果是不到一杯茶功夫我就能看到最想看的电影。 这就像我们一段时间内想干成很多事情，是同时干还是有选择有顺序的干，结果很不一样。同时...</p>
      </article>
      
  <!-- -----------------------------------最新发布区-------------------------------- -->
      
      <div class="title">
        <h3>最新发布</h3>
        <div class="more"><a href="">PHP</a><a href="">JavaScript</a><a href="">EmpireCMS</a><a href="">Apache</a><a href="">MySQL</a></div>
      </div>
 <!-- -----------------------------------文章区-------------------------------- -->     
     
      <tbody>
      <c:forEach items="${list}" var="lists">  
       <!-- 头部标签以及跳转  -->
      <article class="excerpt excerpt-1"><a class="focus" href="${pageContext.request.contextPath}/mainController/toarticle" title=""><img class="thumb" data-original="${lists.images }" src="${lists.images }" alt=""></a>     
        <!-- 头部标签以及跳转  -->
        <header><a class="cat" href="program">${lists.type}<i></i></a>
          <h2><a href="${pageContext.request.contextPath}/preOperateController/prelookArticle?id=${lists.id}" title="">${lists.title }</a></h2>
        </header>      
        <p class="meta">
          <time class="time"><i class="glyphicon glyphicon-time"></i> ${lists.date}</time>
          <span class="views"><i class="glyphicon glyphicon-eye-open"></i>${lists.numpeople }</span> <a class="comment" href="${pageContext.request.contextPath}/mainController/toarticle">
          <i class="glyphicon glyphicon-comment"></i> ${lists.numpeople }</a></p>
        <p class="note">${lists.description}</p>
      </article>
       </c:forEach> 
       </tbody>
      
      
    <nav class="pagination" style="display: none;">
        <ul>
          <li class="prev-page"></li>
          <li class="active"><span>1</span></li>
          <li><a href="?<%=basePath%>page=2">2</a></li>
          <li class="next-page"><a href="?<%=basePath%>page=2">下一页</a></li>
          <li><span>共 2 页</span></li>
        </ul>
      </nav>
      
      
    </div>
  </div>
  
  
  <aside class="sidebar">
  
<!-- -----------------------------------右边公告会员联系站长区-------------------------------- -->     
    <div class="fixed">
      <div class="widget widget-tabs">
      
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="" aria-controls="notice" role="tab" data-toggle="tab">网站公告</a></li>
          <li role="presentation"><a href="#centre" aria-controls="centre" role="tab" data-toggle="tab">会员中心</a></li>
          <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">联系站长</a></li>
        </ul>
        
        <div class="tab-content">
          <div role="tabpanel" class="tab-pane notice active" id="notice">
            <ul>
                <tbody>
                <c:forEach items="${affiche}" var="affiche">
                <li>
                <time datetime="2019-01-04">${affiche.date}</time>
                <a href="" target="_blank">${affiche.content}</a>
                </li>
                 </c:forEach> 
                 </tbody>
             
            </ul>
          </div>
          <div role="tabpanel" class="tab-pane centre" id="centre">
            <h4>需要登录才能进入会员中心</h4>
            <p> <a data-toggle="modal" data-target="#loginModal" class="btn btn-primary">立即登录</a> <a href="javascript:;" class="btn btn-default">现在注册</a> </p>
          </div>
          <div role="tabpanel" class="tab-pane contact" id="contact">
            <h2>Email:<br />
              <a href="mailto:admin@ylsat.com" data-toggle="tooltip" data-placement="bottom" title="admin@ylsat.com">admin@ylsat.com</a></h2>
          </div>
        </div>
      </div>
  <!-- -----------------------------------搜索区-------------------------------- -->     
      <div class="widget widget_search">
        <form class="navbar-form" action="${pageContext.request.contextPath}/preOperateController/search" method="post">
          <div class="input-group">
            <input type="text"  name="search" id="test" class="form-control" size="35" >
            <span class="input-group-btn">
            <button  class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
 <!-- -----------------------------------时间日期与每日一句-------------------------------- -->     
    <div class="widget widget_sentence">
      <h3>每日一句</h3>
      <div class="widget-sentence-content">
        <h4><div id="clock"></div></h4>
        <p>Do not let what you cannot do interfere with what you can do.<br />
          别让你不能做的事妨碍到你能做的事。（John Wooden）</p>
      </div>
    </div>
    
 <!-- -----------------------------------热门文章推荐区-------------------------------- -->     
    <div class="widget widget_hot">
      <h3>热门文章</h3>
 
      <ul>
      <c:forEach items="${listfive}" var="listfive">    
        <li>
       
       <a href="${pageContext.request.contextPath}/preOperateController/prelookArticle?id=${listfive.id}">
         <span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="${listfive.images}" alt="">
         </span>
         <span class="text">${listfive.title}</span>
         <span class="muted"><i class="glyphicon glyphicon-time">
         </i> ${listfive.date} </span><span class="muted">
         <i class="glyphicon glyphicon-eye-open"></i>${listfive.numpeople}</span></a>
        </li>
        </c:forEach>
      </ul> 
    </div>
  </aside>
</section>


<footer class="footer">
  <div class="container">
    <p>&copy; 2016 <a href="">ylsat.com</a> &nbsp; <a href="#" target="_blank" rel="nofollow">豫ICP备20151109-1</a> &nbsp; &nbsp; <a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
  </div>
  <div id="gotop"><a class="gotop"></a></div>
</footer>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <img src="../images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--该功能正在日以继夜的开发中-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <img src="../images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--登录注册模态框-->
<div class="modal fade user-select" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="${pageContext.request.contextPath}/preLoginController/login" method="post">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="loginModalLabel">登录</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="loginModalUserNmae">用户名</label>
            <input type="text" name="username" class="form-control" id="loginModalUserNmae" placeholder="请输入用户名" autofocus maxlength="15" autocomplete="off" required>
          </div>
          <div class="form-group">
            <label for="loginModalUserPwd">密码</label>
            <input type="password" name="password" class="form-control" id="loginModalUserPwd" placeholder="请输入密码" maxlength="18" autocomplete="off" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="submit" class="btn btn-primary">登录</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!--右键菜单列表-->
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问异清轩博客</li>
    <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10 </li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script src="<%=basePath%>/js/bootstrap.min.js"></script> 
<script src="<%=basePath%>/js/jquery.ias.js"></script> 
<script src="<%=basePath%>/js/scripts.js"></script>

</body>
</html>