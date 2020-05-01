<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="../js/jquery.min.js"></script>
 <script type="text/javascript" src="../js/bootstrap.min.js"></script>
 <link  rel="stylesheet" href="../css/bootstrap.min.css"> 
 <script src="../js/echarts.min.js" ></script>
<title>具体信息</title>
<style type="text/css">
.neirong_one{
box-shadow:5px 2px 6px 2px gray;
border-radius:20px;
width: 85%;
margin-left:7.5%;
height: 200px;
border:1px solid black;
margin-top: 10px;
}
.neirong_two{
box-shadow:5px 2px 6px 2px gray;
border-radius:20px;
width: 85%;
margin-left:7.5%;
height: 300px;
border:1px solid gray;
margin-top: 40px;
overflow: hidden;
}
.neirong_three{
box-shadow:5px 2px 6px 2px gray;
border-radius:20px;
width: 85%;
margin-left:7.5%;
height: 300px;
border:1px solid gray;
margin-top: 10px;
}
.neirong_four{
box-shadow:5px 2px 6px 2px gray;
border-radius:20px;
width: 85%;
margin-left:7.5%;
height: 60px;
border:1px solid gray;
margin-top: 10px;
}
.neirong_five{
box-shadow:5px 2px 6px 2px gray;
border-radius:20px;
width: 85%;
margin-left:7.5%;
height: 300px;
border:1px solid gray;
margin-top: 10px;
}
.imgs{
 width: 20%;
 box-shadow:5px 2px 6px 2px gray;
 height: 180px;
 margin-left: 40px;
 margin-top: 10px;
 float: left;
}
.contents{
 box-shadow:5px 2px 6px 2px gray;
 width: 70%;
 float: left;
 height: 180px;
 margin-left: 10px;
 margin-top: 10px;
 
}
.neirong_two_conent{
width: 96%;
height: 290px;
margin-left: 2%;
overflow-y: scroll;
}
.titles{
width: 96%;
height: 40px;
margin-left: 2%;
background-color: gray;
color: white;
text-align: center;
font-size:20px; 
border-radius:20px;
}
.neirong_two_conents{
width: 96%;
height: 210px;
margin-left: 2%;
overflow-y: scroll;
}
.echats_left{
margin-left:23%;
margin-top:10px;
box-shadow:5px 2px 6px 2px gray;
width: 55%;
height: 240px;
border: 1px solid gray;
}
.btn1{
width: 30%;
height: 30px;
margin-left: 19%;
margin-top: 10px;

}
.btn2{
width: 30%;
height: 30px;
margin-left: 35%;
margin-top: 10px;
}

</style>
</head>

<body>
<div class="neirong_one">
 <div class="imgs">
   <img style="width: 188px;height: 181px;" alt="" src="${team.pic }"> 
 </div>
 <div class="contents">
 <table class="table table-striped">
  <tr>
    <th>标题:</th>
    <td><input class="form-control" value="${team.title}"  type="text" disabled="disabled"></td>
  </tr>
  <tr>
   <th>类型:</th>
    <td><input class="form-control" value="${types}"  type="text" disabled="disabled"></td>
  </tr>
   <tr>
   <th>创建信息：</th>
    <td><input class="form-control" value="${users} | ${team.date}"  type="text" disabled="disabled"></td>
  </tr>
 </table>
 </div>
</div>
<div class="neirong_two">
 <div class="neirong_two_conent">
 ${team.content }
 </div>
</div>
<div class="neirong_three">
  <div class="titles">参与人员列表</div>
  <div class="neirong_two_conents">
  <table align="center" class="table table-striped">
    <tr>
     <th>序号</th>
     <th>姓名</th>
     <th>年龄</th>
     <th>性别</th>
     <th>邮箱</th>
    </tr>
   <c:forEach items="${Involist}" varStatus="lis" var="list">
    <tr>
     <td>${lis.index}</td>
     <td>${list.name}</td>
     <td>${list.age}</td>
     <td>${list.sex}</td>
     <td>${list.email}</td>
    </tr>
   </c:forEach>  
  </table>
 
 </div>
</div>

<div class="neirong_five">
 <div class="echats_left">
  <div id="main" style="width: 424px;height:240px;"></div>
 </div>
</div>
<div class="neirong_four">
<a href="${pageContext.request.contextPath}/pilotSecondController/deleteTeam?deid=${team.id}"><button class="btn2 btn btn-success">删除发起的队伍</button></a>
</div>
</body>
<script type="text/javascript">
$(function(){
	 $.get("${pageContext.request.contextPath}/pilotSecondController/echarts",function(rseult,status){
        if(rseult){   
       	 var num = eval(rseult);
       	 myChart.setOption({
       		 series:[{
       			 data:num
       		 }]
       	 });
        }       		 
	 });
});
	  // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
     var   option = {
      		 
    title : {
        text: '参与人数',
        subtext: '真实有效'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['人数']
    },
    toolbox: {
        show : true,
        feature : {
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    xAxis : [
        {
            type : 'category',
            data : ['男','女']
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
series : [
   {
       name:'人数',
       type:'bar',         
       data:[],                
   },
]
};               
        // 使用刚指定的配置项和数据显示图表。           
      myChart.setOption(option);          
</script>
</html>