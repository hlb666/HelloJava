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
<title>异清轩博客文章页面</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/nprogress.css">
<link rel="stylesheet" type="text/css" href="../css/styleo.css">
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="../images/icon/icon.png">
<link rel="shortcut icon" href="../images/icon/favicon.ico">
<script src="../js/jquery-2.1.4.min.js"></script>
<script src="../js/nprogress.js"></script>
<script src="../js/jquery.lazyload.min.js"></script>
<script type="text/javascript">
function load(){	
}
$(function(){
	var name = $("#user").text();
	if(name===''){	
	}else{	
		document.getElementById("logins").style.visibility="hidden";
	}
	
});

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
</script>
</head>
<body class="user-select single">
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
       <div id="logins">
        <a data-toggle="modal" data-target="#loginModal" class="login" rel="nofollow">Hi,请登录</a>
          &nbsp;&nbsp;
        <a href="javascript:;" class="register" rel="nofollow">我要注册</a>
          &nbsp;&nbsp;
        <a href="" rel="nofollow">找回密码</a> 
       </div>
      </div>
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
        <h1 class="logo hvr-bounce-in"><a href="" title=""><img src="../images/logo.png" alt=""></a></h1>
      </div>
      <div class="collapse navbar-collapse" id="header-navbar">
        <ul class="nav navbar-nav navbar-right">
          <li class="hidden-index active"><a data-cont="异清轩首页" href="${pageContext.request.contextPath}/mainController/tomain">异清轩首页</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=1">前端技术</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=2">后端程序</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=3">管理系统</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=4">授人以渔</a></li>
          <li><a href="${pageContext.request.contextPath}/mainController/tocategory?identy=5">程序人生</a></li>
          <li><a name="lianjie" id="user"><img alt="" style="width: 40px;height: 40px;border:1px solid;border-radius:20px" src="${pic}">${name}</a></li>
        </ul>
        <form class="navbar-form visible-xs" action="/Search" method="post">
          <div class="input-group">
            <input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
  </nav>
</header>


<section class="container">
  <div class="content-wrap">
    <div class="content">
     
      <header class="article-header">  
        <h1 class="article-title"><a href="${pageContext.request.contextPath}/mainController/toarticle">${article.title}</a></h1>
        <div class="article-meta"> <span class="item article-meta-time">
          <time class="time" data-toggle="tooltip" data-placement="bottom" title="时间：2016-1-4 10:29:39"><i class="glyphicon glyphicon-time"></i>${article.date}</time>
          </span> <span class="item article-meta-source" data-toggle="tooltip" data-placement="bottom" title="来源：第一PHP社区"><i class="glyphicon glyphicon-globe"></i> ${article.lable}</span> <span class="item article-meta-category" data-toggle="tooltip" data-placement="bottom" title="栏目：后端程序"><i class="glyphicon glyphicon-list"></i> 
          <a href="program" title="">${article.type}</a></span> <span class="item article-meta-views" data-toggle="tooltip" data-placement="bottom" title="查看：120"><i class="glyphicon glyphicon-eye-open"></i> ${article.numpeople}</span> <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="评论：0"><i class="glyphicon glyphicon-comment"></i></span> </div>   
      </header>
       
      <article class="article-content">
        <p><img data-original="${article.images }" src="${article.images }" alt="" /></p>
${article.content}
 <p class="article-copyright hidden-xs">未经允许不得转载：<a href="">异清轩博客</a> » <a href="${pageContext.request.contextPath}/mainController/article.jsp">php如何判断一个日期的格式是否正确</a></p>
      </article>
      <div class="article-tags">标签：<a href="" rel="tag">${article.lable}</a></div>

      <div class="title" id="comment">
        <h3>评论 <small>抢沙发</small></h3>
      </div>
      <!--<div id="respond">
        <div class="comment-signarea">
          <h3 class="text-muted">评论前必须登录！</h3>
          <p> <a href="javascript:;" class="btn btn-primary login" rel="nofollow">立即登录</a> &nbsp; <a href="javascript:;" class="btn btn-default register" rel="nofollow">注册</a> </p>
          <h3 class="text-muted">当前文章禁止评论</h3>
        </div>
      </div>-->
      <div id="respond">
        <form action="${pageContext.request.contextPath}/preOperateController/insertComment?bid=${article.id}" method="post" id="comment-form">
          <div class="comment">
            <div class="comment-title"><img class="avatar" src="../images/icon/icon.png" alt="" /></div>
            <div class="comment-box">
              
              
              <textarea placeholder="您的评论可以一针见血" name="comment" id="comment-textarea" cols="100%" rows="3" tabindex="1" ></textarea>
              
              
              <div class="comment-ctrl"> <span class="emotion"><img src="${pageContext.request.contextPath}/images/face/5.png" width="20" height="20" alt="" />表情</span>
                
                <div class="comment-prompt"> 
                 <i class="fa fa-spin fa-circle-o-notch"></i>
                 <span class="comment-prompt-text"></span> 
                </div>
                
                <input type="hidden" value="1" class="articleid" />
                
                <input style="margin-left: 91%" type="submit" class="btn btn-primary" value="评论">
                
              </div>
              
            </div>
          </div>
        </form>
      </div>
      <div id="postcomments">
        <ol class="commentlist">
          <li class="comment-content"><span class="comment-f">#1</span>
            <div class="comment-avatar"><img class="avatar" src="../images/icon/icon.png" alt="" /></div>
            <div class="comment-main">
            <c:forEach items="${comments }" var="comments">
              <p>来自<span class="address">宇宙无敌的</span>${comments.uid }<span class="time">*****</span><br />
               ${comments.content }</p>
            </c:forEach>
            </div>
          </li>
        </ol>      
        <div class="quotes"><span class="disabled">首页</span><span class="disabled">上一页</span><a class="current">1</a><a href="">2</a><span class="disabled">下一页</span><span class="disabled">尾页</span></div>
      </div>
    </div>
  </div>
  <aside class="sidebar">
    <div class="fixed">
      <div class="widget widget-tabs">
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab">网站公告</a></li>
          <li role="presentation"><a href="#centre" aria-controls="centre" role="tab" data-toggle="tab">会员中心</a></li>
          <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab">联系站长</a></li>
        </ul>
        <div class="tab-content">
              <tbody>
                <c:forEach items="${affiche}" var="affiche">
                <li>
                <time datetime="2019-01-04">${affiche.date}</time>
                <a href="" target="_blank">${affiche.content}</a>
                </li>
                 </c:forEach> 
                 </tbody>
          <div role="tabpanel" class="tab-pane centre" id="centre">
            <h4>需要登录才能进入会员中心</h4>
            <p> <a href="javascript:;" class="btn btn-primary">立即登录</a> <a href="javascript:;" class="btn btn-default">现在注册</a> </p>
          </div>
          <div role="tabpanel" class="tab-pane contact" id="contact">
            <h2>Email:<br />
              <a href="mailto:admin@ylsat.com" data-toggle="tooltip" data-placement="bottom" title="admin@ylsat.com">admin@ylsat.com</a></h2>
          </div>
        </div>
      </div>
      <div class="widget widget_search">
        <form class="navbar-form" action="/Search" method="post">
          <div class="input-group">
            <input type="text" name="keyword" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
            <span class="input-group-btn">
            <button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
            </span> </div>
        </form>
      </div>
    </div>
    <div class="widget widget_sentence">
      <h3>每日一句</h3>
      <div class="widget-sentence-content">
        <h4><div id="clock"></div></h4>
        <p>Do not let what you cannot do interfere with what you can do.<br />
          别让你不能做的事妨碍到你能做的事。（John Wooden）</p>
      </div>
    </div>
    <div class="widget widget_hot">
      <h3>热门文章</h3>
      
      <ul>
      <c:forEach items="${listfive}" var="listfive">    
        <li>
      <a href="${pageContext.request.contextPath}/preOperateController/prelookArticle?id=${listfive.id}">
         <span class="thumbnail"><img class="thumb" data-original="images/excerpt.jpg" src="../images/excerpt.jpg" alt="">
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
  <div class="modal-dialog" role="document" style="margin-top:120px;width:280px;">
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
<div id="rightClickMenu">
  <ul class="list-group rightClickMenuList">
    <li class="list-group-item disabled">欢迎访问异清轩博客</li>
    <li class="list-group-item"><span>IP：</span>172.16.10.129</li>
    <li class="list-group-item"><span>地址：</span>河南省郑州市</li>
    <li class="list-group-item"><span>系统：</span>Windows10</li>
    <li class="list-group-item"><span>浏览器：</span>Chrome47</li>
  </ul>
</div>
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/jquery.ias.js"></script> 
<script src="../js/scripts.js"></script> 
<script src="../js/jquery.qqFace.js"></script> 
<script type="text/javascript">
$(function(){
	
	$('.emotion').qqFace({
		id : 'facebox', 
		assign:'comment-textarea', 
		path:'${pageContext.request.contextPath}/images/arclist/'	//表情存放的路径
	});
 });   
</script>
</body>
</html>