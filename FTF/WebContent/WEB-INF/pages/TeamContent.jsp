<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="${pageContext.request.contextPath}/WEB-INF/pages">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>队伍信息</title>
<link rel="stylesheet" href="../css/iconfont.css">
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
 <link  rel="stylesheet" href="../css/bootstrap.min.css">  
 
 <script type="text/javascript">

 </script>
 
 
<style type="text/css">
.teamc_wrap{
 width: 80%;
 height: 800px;
 border: 1px solid black;
 margin-left: 10%;
 margin-top: 20px;
 border-radius:50px; 
 overflow: hidden;
 background-color: #DDDDDD;
}
.teamc_head{
   width:850px;
   height: 260px;
border-bottom:1px solid white;
   margin-left: 20px;
   margin-top: 20px;
}
.teamc_body{
   width:850px;
   height: 430px;
   
   margin-left: 20px;

}
.teamc_foot{
   width:850px;
   height: 70px;

   margin-left: 20px;
   text-align: center;

}
.teamc_head_left{
  width: 30%;
  height: 260px;

  float: left;
}
.teamc_head_right{
  width: 70%;
  height: 260px;
 
  float: left;
}
.teamc_photo{
width: 90%;
height: 220px;

margin-left: 5%;
margin-top: 20px;
overflow: hidden;
}
.teamc_title{
width: 100%;
height: 50px;

margin-top: 20px;

}
.teamc_xujia{
width: 100%;
height: 50px;

margin-top: 10px;
}
.teamc_creatorandtime{
width: 100%;
height: 45px;

margin-top: 10px;
}
.teamc_type{
width: 100%;
height: 45px;

margin-top: 10px;
}
.teamc_head_right>input{
line-height: 50px;
}
</style>
</head>
<body>
<div class="teamc_wrap">
 <div class="teamc_head">
  <div class="teamc_head_left">
   <div class="teamc_photo">
    <img alt="" style="height:220px ;width: 225px" src="${pic }">
   </div>
  </div>
  <div class="teamc_head_right">
   <div class="teamc_title">
    <input style="height: 47px" class="form-control" readonly="readonly" value="${title }">
   </div>
   <div class="teamc_xujia">
    <button style="height: 30px;"><span class="glyphicon glyphicon-fire"></span> 收藏</button>
    <button style="height: 30px; margin-left: 10px;"><span class="glyphicon glyphicon-globe"></span> 分享</button>
    <button style="height: 30px; margin-left: 10px;"><span class="glyphicon glyphicon-leaf"></span> ...更多</button>
   </div>
   <div class="teamc_creatorandtime">
    <input style="height: 43px" class="form-control" readonly="readonly" value="创建者：${userer }| ${date }">
   </div>
   <div class="teamc_type">
    <input style="height: 43px" class="form-control" readonly="readonly" value="标签：${typed }/你所喜歡">
   </div>
   <div></div>
  </div>
 </div>
 <div class="teamc_body" style="overflow-y:scoll; "> 
  ${content}  
 </div>
 <div class="teamc_foot">
  <button data-toggle="modal" data-target="#myModal" style="width: 50%" type="button" class="btn btn-primary">确认参加</button>
 </div>
</div>
<!-- 模态框 修改用户信息-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-header_text">
				 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				 </button>
				 <h4 class="modal-title" id="myModalLabel">
					填写信息
				 </h4>
			</div>
		<form method="post" action="${pageContext.request.contextPath}/pilotSecondController/involve?id=${id}">
			<div class="modal-body">
				 <div class="modal-body_wrap">
				   <div class="modal-body_wrap_content">
				    <table class="table table-striped" align="center">
				     <tr>
				      <th>名字: </th>
				      <td><input type="text" class="form-control" name='name' value=''></td>
				     </tr>
				      <tr>
				      <th>年龄: </th>
				      <td><input type="password" class="form-control" name='age' value=''></td>
				     </tr>
				      <tr>
				      <th>性别: </th>
				      <td>
				       <select name="sex" class="form-control">
				        <option>男</option>
				        <option>女</option>
				       </select>
				      </td>
				     </tr>	
				     <tr>
				      <th>邮箱: </th>
				      <td><input type="text" class="form-control" name='email' value=''></td>
				     </tr>				    
				    </table>
				   </div>
				 </div>
			</div>
			<div class="modal-footer">
				 <button type="button" class="btn btn-default" data-dismiss="modal">关闭
				 </button>
				 <button type="submit" class="btn btn-primary">
					提交信息
				 </button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
</body>
</html>