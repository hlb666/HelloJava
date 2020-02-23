<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>常规设置 - 异清轩博客管理系统</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/font-awesome.min.css">
<link rel="apple-touch-icon-precomposed" href="../images/icon/icon.png">
<link rel="shortcut icon" href="../images/icon/favicon.ico">
<script src="../js/jquery-2.1.4.min.js"></script>
  <script type="text/javascript">
  //一个ajax对象
    var ajax = {
        get:function (url,successCallBack,failCallBack) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET",url,true);
            xhr.onreadystatechange = function () {
                //xhr.readyState 的值有0 1 2 3 4
                if(xhr.readyState == 4){
                    //判断xhr.status的响应码
                    if(xhr.status == 200 || xhr.status == 304){
                        //判断successCallBack 是否传递了一个函数
                        if(typeof successCallBack == "function"){
                            //将xhr.responseText的信息交给用户回调函数处理
                            successCallBack(xhr.responseText,xhr);
                        }else if(typeof failCallBack == "function"){
                            //将xhr.responseText的信息交给用户回调函数处理
                            failCallBack(xhr.responseText,xhr);
                        }
                    }
     
                }};
            xhr.send(null);
        },
        post:function (url,data,successCallBack,failCallBack) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST",url,true);
            xhr.onreadystatechange = function () {
                //xhr.readyState 的值有0 1 2 3 4
                if(xhr.readyState == 4){
                    //判断xhr.status的响应码
                    if(xhr.status == 200 || xhr.status == 304){
                        //判断successCallBack 是否传递了一个函数
                        if(typeof successCallBack == "function"){
                            //将xhr.responseText的信息交给用户回调函数处理
                            successCallBack(xhr.responseText,xhr);
                        }else if(typeof failCallBack == "function"){
                            //将xhr.responseText的信息交给用户回调函数处理
                            failCallBack(xhr.responseText,xhr);
                        }
                    }
     
                }};
            //设置请求头,这行代码,一定要在open之后, send之前调用.
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send(data);
        }
    };

    </script>
</head>
<style>
    {
        padding: 0;
        margin: 0;
    }
    .imgLayout{
        width: 100%;
        height: 100%;
        margin: 0 auto;
        background: url("star.jpg");
        /*简单粗暴解决高度塌陷问题（记得复习其他方法） */
        padding:1px;
    }
    .outer{
        box-sizing: border-box;
        width: 600px;
        height: 500px;
        border-radius: 20px;
        background-color: whitesmoke;
        border: 2px solid white;
        margin: 15px auto;
        padding: 5px;
    }
    .chatContent{
        box-sizing: border-box;
        width: 100%;
        height: 380px;
        overflow: auto;
        margin-bottom: 10px;
    }
    .outer input{
        width: 580px;
        height: 45px;
        font-size: 30px;
        line-height: 45px;
    }
    .outer button{
        width: 580px;
        height: 45px;
        font-size: 30px;
        line-height: 45px;
        background-color: cornflowerblue;
        border-radius: 20px;
        margin-top: 5px;
        margin-bottom: 5px;
        outline: cornflowerblue;
    }
    .outer .chatContent div{
        width: 550px;
        /*让内容撑开高度，p可能有高度不同*/
        /*height: 55px;*/
        display: none;
    }
    .outer .chatContent .msg_mine{
        text-align: right;
        float: right;
        margin-right: 5px;
    }
    .outer .chatContent .msg_robot{
        clear: both;
    }
    .chatContent img{
        width: 40px;
        height: 40px;
        border-radius: 50%;
    }
</style>
<body class="user-select">
<section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/">YlsatCMS</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="">消息 <span class="badge">1</span></a></li>
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">admin <span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
              </ul>
            </li>
            <li><a href="${pageContext.request.contextPath}/backController/login" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
            <li><a data-toggle="modal" data-target="#WeChat">帮助</a></li>
          </ul>
          <form action="" method="post" class="navbar-form navbar-right" role="search">
            <div class="input-group">
              <input type="text" class="form-control" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
              <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
              </span> </div>
          </form>
        </div>
      </div>
    </nav>
  </header>
  <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar">
        <li><a href="${pageContext.request.contextPath}/backController/index">报告</a></li>
      </ul>
     <ul class="nav nav-sidebar">
        <li><a href="${pageContext.request.contextPath}/backController/article">管理博客</a></li>
        <li><a href="${pageContext.request.contextPath}/backController/notice">管理公告</a></li>
        <li><a href="${pageContext.request.contextPath}/backController/addarticle">发布博客</a></li>
        <li><a href="${pageContext.request.contextPath}/backController/add-notice">发布公告</a></li>
      </ul>
      <ul class="nav nav-sidebar">
        <li><a href="${pageContext.request.contextPath}/backController/category">栏目</a></li>
        <li><a href="${pageContext.request.contextPath}/backController/flink">友情链接</a></li>
     
      </ul>
      <ul class="nav nav-sidebar">
        <li><a class="dropdown-toggle" id="userMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">用户</a>
          <ul class="dropdown-menu" aria-labelledby="userMenu">
            <li><a href="#">管理用户组</a></li>
            <li><a href="${pageContext.request.contextPath}/backController/manage-user">管理用户</a></li>
          </ul>
        </li>
        <li class="active"><a class="dropdown-toggle" id="settingMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">设置</a>
          <ul class="dropdown-menu" aria-labelledby="settingMenu">
            <li><a href="${pageContext.request.contextPath}/backController/setting">智能问答</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">待开发</a></li>
          </ul>
        </li>
      </ul>
    </aside>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <div class="row">
      
      <div class="imgLayout">
    <div class="outer">
    <div class="chatContent">
    <div class="msg_robot">
        <img src="../images/1.png" alt="robot">
        <p></p>
    </div>
    <div class="msg_mine">
        <img src="../images/2.png" alt="robot">
        <p></p>
 
    </div>
    </div>
    <input type="text">
    <button class="send_btn">Send</button>
    </div>
</div>
 
<script>
    var input = document.querySelector(".outer input");
    var send = document.querySelector(".send_btn");
    var msg_robot = document.querySelector(".outer .chatContent .msg_robot");
    var msg_mine = document.querySelector(".outer .chatContent .msg_mine");
    var chatContent = document.querySelector(".chatContent");
 
    /*机器人聊天函数
    * */
    function chat() {
        var sayContent = input.value;
        var paras = "key=e445f18bffac410da2cb92bb8bf9ede5&userid=芭芭拉&info="+sayContent;
        ajax.post("http://www.tuling123.com/openapi/api",paras,function (content,xhr) {
            //克隆mine的节点，深度克隆
            var newNodeMine=msg_mine.cloneNode(true);
            newNodeMine.lastElementChild.innerHTML=sayContent;
            newNodeMine.style.display="block";
            chatContent.appendChild(newNodeMine);
            //设置自动滚动文本聊天信息
            autoScroll(chatContent);
            //只要提交了，清空input栏的值
            input.value="";
            console.log(content);
            //post响应的数据是一个json对象，所以要转成js对象
            var obj = JSON.parse(content);
            //判断响应回复的信息是哪种类型
            msgRobot = obj.text;
            //判断图片信息
            if(obj.url){
                msgRobot += "<a href='"+obj.url+"' target='_blank'>点我看图片.</a>";
            }
 
            //判断菜谱信息
            if(obj.list && obj.code=="308000"){
                msgRobot +=" ①菜谱名字："+obj.list[0].name+" ②菜谱原料："+obj.list[0].info+" 做饭链接："+"<a href='"+obj.list[0].detailurl+"' target='_blank'>点我看怎么做？</a>";
            }
 
            //判断新闻信息
            if(obj.list && obj.code=="302000"){
                msgRobot +=" ①文章标题："+obj.list[0].article+" ②文章来源："+obj.list[0].source+" 做饭链接："+"<a href='"+obj.list[0].detailurl+"' target='_blank'>点我看新闻.</a>";
            }
            //克隆新的节点robot的
            var newNodeRobot=msg_robot.cloneNode(true);
            newNodeRobot.lastElementChild.innerHTML=msgRobot;
            newNodeRobot.style.display="block";
            chatContent.appendChild(newNodeRobot);
            //设置自动滚动文本聊天信息
            autoScroll(chatContent);
        });
    }
 
 
    /*让指定的元素自动滚动
    * */
    function autoScroll(parentEle) {
        setTimeout(function step() {
            //注意scrollTop不是CSS的属性是js的属性,是没有单位的
            var top = parentEle.scrollTop;
            parentEle.scrollTop += top +4;
            //设置定时器关闭的条件
            if(top == parentEle.scrollTop) return;
            setTimeout(step,20);
        },0);
    }
 
    /*为send按钮设置单机响应函数,注意这里是一个函数，只需要把函数名给他就行
    * */
    send.onclick = chat;
 
    /*设置键盘响应函数，点击enter就相当于button的单机
    *这里是要执行的，所以要chat();
    * */
    document.onkeydown=function (ev) {
        if(ev.keyCode == 13){
            chat();
        }
    }
</script>
        
      </div>
    </div>
  </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form action="" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
        <tbody>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="王雨" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">注册编号:</td>
                <td width="80%"><input type="text" value="admin" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">剩余积分:</td>
                <td width="80%"><input type="text" value="18538078281" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <!-- <button type="button" class="btn btn-default" data-dismiss="modal">取消</button> -->
          <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
        </div>
      </div>
    </form>
  </div>
</div>
<!--个人登录记录模态框-->
<div class="modal fade" id="seeUserLoginlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" >登录记录</h4>
      </div>
      <div class="modal-body">
        <table class="table" style="margin-bottom:0px;">
          <thead>
            <tr>
              <th>登录IP</th>
              <th>登录时间</th>
              <th>状态</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>::1:55570</td>
              <td>2016-01-08 15:50:28</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64377</td>
              <td>2016-01-08 10:27:44</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:64027</td>
              <td>2016-01-08 10:19:25</td>
              <td>成功</td>
            </tr>
            <tr>
              <td>::1:57081</td>
              <td>2016-01-06 10:35:12</td>
              <td>成功</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">朕已阅</button>
      </div>
    </div>
  </div>
</div>
<!--微信二维码模态框-->
<div class="modal fade user-select" id="WeChat" tabindex="-1" role="dialog" aria-labelledby="WeChatModalLabel">
  <div class="modal-dialog" role="document" style="margin-top:120px;max-width:280px;">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="WeChatModalLabel" style="cursor:default;">微信扫一扫</h4>
      </div>
      <div class="modal-body" style="text-align:center"> <src="../images/weixin.jpg" alt="" style="cursor:pointer"/> </div>
    </div>
  </div>
</div>
<!--提示模态框-->
<div class="modal fade user-select" id="areDeveloping" tabindex="-1" role="dialog" aria-labelledby="areDevelopingModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="areDevelopingModalLabel" style="cursor:default;">该功能正在日以继夜的开发中…</h4>
      </div>
      <div class="modal-body"> <src="../images/baoman/baoman_01.gif" alt="深思熟虑" />
        <p style="padding:15px 15px 15px 100px; position:absolute; top:15px; cursor:default;">很抱歉，程序猿正在日以继夜的开发此功能，本程序将会在以后的版本中持续完善！</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">朕已阅</button>
      </div>
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
<script src="../js/bootstrap.min.js"></script> 
<script src="../js/admin-scripts.js"></script>
</body>
</html>