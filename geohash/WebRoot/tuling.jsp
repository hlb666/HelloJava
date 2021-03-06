<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fengmaybe_Robot</title>
    <script src="js/jquery.min.js"></script>
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
body, html {
width: 100%;
height: 100%;
overflow-x:hidden;
overflow-y:hidden;
}
body {
    background: url(http://pic1.win4000.com/wallpaper/e/58e6f381091d5.jpg) no-repeat;
    background-size:cover;
    background-position:center;
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
        background:rgba(248,248,255,0.5);
        box-sizing: border-box;
        width: 600px;
        height: 500px;
        border-radius: 20px;

        border: 2px solid white;
        margin: 20px auto;
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
         background:rgba(220,220,200,0.3);
        width: 500px;
        height: 45px;
        font-size: 30px;
        line-height: 5px;
    }
    .outer button{
        width: 70px;
        height: 55px;
        font-size: 20px;
        line-height: 5px;
        background:rgba(220,220,200,0.3);
        border-radius: 10px;
        margin-top: 35px;
        margin-bottom: 0px;
        outline: rgba(152,245,255,0.2);;
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
    .logo{
      background: rgba(240,255,255,0.4);
    }
</style>
<body>
<div class="imgLayout">
    <div class="outer">

    <div class="chatContent">
    <div class="msg_robot">
        <img src="images/1.png" alt="robot">
        <p></p>
    </div>
    <div class="msg_mine">
        <img src="images/2.png" alt="robot">
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
        var paras = "key=11ee936fe93f41f3b55716f72c1cf5b1&info="+sayContent;
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
</body>
</html>

