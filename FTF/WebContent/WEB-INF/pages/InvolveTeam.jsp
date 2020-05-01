<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container_wrap{
  pdding-right: 10%;
}
.container_jumbotron{
width: 98%;
margin-left: 1%;
}
.jumbotron{
height: 10px;
padding-left: 2%;
}
.caption{
 width:95%;
-webkit-transition:-webkit-transform 0.35s;
transition: transform 0.35s;
-webkit-transform: scale3d(1,1,1);
transform: scale3d(1,1,1);
}
.caption:hover{
-webkit-transform: scale3d(1.03,1.03,1);
transform: scale3d(1.03,1.03,1);
}
.thumbnail_left{
width: 25%;
height: 170px;
float: left;
margin-right: 20px;
margin-left: 20px;
margin-top: 10px;
}
.thumbnail_right{

margin-top: 10px;
width: 65%;
height: 170px;
float: left;
}
.InvWrap{
width: 60%;
height: 190px;
overflow: hidden;
box-shadow:5px 2px 6px 2px gray;
border-radius: 20px;
margin-left: 30px;
float: left;
}
.InvWrapone{

width: 32%;
height: 190px;
border: 1px solid black;
overflow: hidden;
box-shadow:5px 2px 6px 2px gray;
border-radius: 20px 0px 0px 20px;
margin-left: 30px;
float: left;
overflow-y: scroll;
}
.maxwrap{
margin-top: 20px;

}
</style>
</head>
<body>
 <div class="container_wrap">
	  <div class="container_jumbotron">
			<div class="jumbotron biaotij">
			  这里是你参与的队伍哦！若是不想继续参加，可以退出队伍哦！
			</div>			
		</div>
		<c:forEach items="${Teamlist}" var="list" varStatus="num">
	   <div class="row maxwrap">
		   <div class="col-lg-12 col-md-12 col-sm-12">
		   
		   	 <div class="InvWrap">
		      <div class="caption thumbnail_left">
		       <img alt="" style="width: 166px;height: 170px" src="${list.pic }">
		      </div>
		      <div class="caption thumbnail_right">
	            <table class="table table-striped">
	              <tr>
				    <th>标题:</th>
				    <td><input class="form-control" value="${list.title}"  type="text" disabled="disabled"></td>
				  </tr>
				  <tr>
				   <th>编号:</th>
				    <td><input class="form-control" value="100${list.id}"  type="text" disabled="disabled"></td>
				  </tr>
				   <tr>
				   <th>标签：</th>
				    <td><input class="form-control" value="运动"  type="text" disabled="disabled"></td>
				  </tr>
	            </table>
              </div>
            </div>
            <c:forEach items="${Involist}" var="list1" begin="${num.index }" end="${num.index }">
          
            <div class="InvWrapone">
		          <table class="table table-striped">
	              <tr>
				    <th>姓名:</th>
				    <td><input class="form-control" value="${list1.name }"  type="text" disabled="disabled"></td>
				  </tr>
				  <tr>
				   <th>年龄:</th>
				    <td><input class="form-control" value="${list1.age }"  type="text" disabled="disabled"></td>
				  </tr>
				   <tr>
				   <th>性别：</th>
				    <td><input class="form-control" value="${list1.sex }"  type="text" disabled="disabled"></td>
				  </tr>
				  <tr>
				   <th>邮箱：</th>
				    <td><input class="form-control" value="${list1.email}"  type="text" disabled="disabled"></td>
				  </tr>
	            </table>
	            <div>
	             <a href="${pageContext.request.contextPath}/pilotSecondController/deleteinv?id=${list1.id}"><button style="margin-left: 10px;margin-bottom: 2px;margin-left: 50%;"  class="btn btn-info"><span class="glyphicon glyphicon-minus"></span>退出当前队伍</button></a>
                </div>
            </div>
     </c:forEach>
		  </div>
		</div>
		    </c:forEach>
	  </div>
</body>
	<script type="text/javascript" src="../js/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</html>