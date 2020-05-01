<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="../js/jquery.min.js"></script>
 <script src="../js/bootstrap.min.js"></script>
 <link  rel="stylesheet" href="../css/bootstrap.min.css">  
<title>Insert title here</title>
<style type="text/css">
.news {
	margin-top: 4%;
	margin-left: 15%;
	width: 70%;
	height: 70%;
	border: 1px solid #DDDDDD;
	border-radius: 60px;
	background-color: #DDDDDD;
	box-shadow: 0px 1px 1px rgba(0, 0, 0.5, 1.5);
}

.touxiang {
	width: 40%;
	height: 100%;
	border-right: 1px solid white;
	float: left;
}

.imgs {
	margin-top: 10%;
	margin-left: 15%;
	width: 45%;
	height: 40%;
	border-radius: 70px;
	border: 1px solid black;
	overflow: hidden;
}

.imgs_pho {
	width: 100%;
	height: 100%;
}

.imgs_line {
	margin-top: 5%;
	margin-left: 16%;
	width: 45%;
	height: 3%;
	background-color: white;
}

.imgs_name {
	padding-left: 5%;
	margin-top: 5%;
	margin-left: 15%;
	width: 45%;
	height: 8%;
	font-size: 15px;
	border-bottom: 1px solid black;
}

.neirong {
	width: 59.9%;
	height: 100%;
	border-left: 1px solid white;
	float: left;
}

.neirong_email {
	padding-top: 1.5%;
	padding-left: 2%;
	margin-left: 16%;
	margin-top: 5%;
	width: 60%;
	height: 10%;
	border: 1px solid white;
	border-radius: 20px;
}

.neirong_line {
	margin-top: 2%;
	width: 100%;
	height: 0.2%;
	border-bottom: 1px solid gray;
}

.neirong_bianji {
	border-radius: 20px;
	padding-top: 0.5%;
	padding-left: 3%;
	background-color: gray;
	color: white;
	margin-top: 2%;
	margin-left: 65%;
	width: 20%;
	height: 8%;
	border: 1px solid white;
	cursor: pointer;
}

.modal-header_text {
	text-align: center;
}

.modal-body {
	width: 100%;
	height: auto;
}

.modal-body_wrap {
	width: 100%;
	height: 200px;;
    border-bottom: 1px solid gray;
}

.modal-body_wrap_img {
	width: 35%;
	height: 200px;
	border-right: 1px solid gray;
	float: left;
}

.modal-body_wrap_content {
	width: 65%;
	height: 200px;
	border-bottom: 1px solid gray;
	float: left;
}

.modal-body_wrap_photo {
	width: 80%;
	height: 80%;
	border: 1px solid gray;
	overflow: hidden;
}

.modal-body_wrap_modify {
	width: 50%;
	height: 15%;
	border: 1px solid gray;
	margin-left: 45%;
	margin-top: 3%;
	background-color: gray;
	border-radius: 20px;
	padding-left: 15px;
	padding-top: 3px;

}

.btnfile {
	color: white;
    cursor: pointer;
}

.erweima{
margin-left:25%;
margin-top:6%;
 width: 150px;
 height: 150px;
 border: 1px solid graytext;
 
}
.erweima_miaoshu{
 background:gray;
 margin-top:4%;
 margin-left:25%;
 width: 150px;
 height: 40px;
 border: 1px solid gray;
 color: white;
 
}
</style>
<script type="text/javascript">
$(function(){
	  $("#file0").change(function(){  
			 var objUrl = getObjectURL(this.files[0]) ;//获取文件信息  
			 console.log("objUrl = "+objUrl);  
			  if (objUrl) {  
			  $("#img0").attr("src", objUrl);  
			 }   
	}) ;  
	function getObjectURL(file) {  
			 var url = null;   
			 if (window.createObjectURL!=undefined) {  
			  url = window.createObjectURL(file) ;  
			 } else if (window.URL!=undefined) { // mozilla(firefox)  
			  url = window.URL.createObjectURL(file) ;  
			 } else if (window.webkitURL!=undefined) { // webkit or chrome  
			  url = window.webkitURL.createObjectURL(file) ;  
			 }  
			 return url ;  
			}  
});

</script>
</head>

<body>
<div class="news">
<!--左侧区域  -->
  <div class="touxiang">
    <div class="imgs">
      <img class="imgs_pho" src="${pic}">
    </div>
    <div class="imgs_line">    
    </div>
    <div class="imgs_name">
       ${name} | 粉丝：0
    </div>
  </div>
<!--右侧区域  -->  
  <div class="neirong">
   <div class="neirong_email">
        当前使用邮箱：${email}
   </div>
   <div class="neirong_bianji" data-toggle="modal" data-target="#myModal">
    <span class="glyphicon glyphicon-pencil"></span> 编辑
   </div>
   <div class="neirong_line">
   </div> 
    <div class="erweima">
      <img style="height:149px;width:149px" src="${pageContext.request.contextPath}/userUpdateController/erweima" />
    </div> 
    <div class="erweima_miaoshu">
               请扫描二维码获取平台使用相关信息！
    </div>
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
					修改个人信息
				 </h4>
			</div>
		<form class="cmxform" enctype="multipart/form-data" id="commentForm" method="post" action="${pageContext.request.contextPath}/userUpdateController/modify">
			<div class="modal-body">
				 <div class="modal-body_wrap">
				   <div class="modal-body_wrap_img">
				    <div class="modal-body_wrap_photo">
				     <img  src="${pic}" id="img0" style="width:100%;height:100%;">
				    </div>
				    <div class="modal-body_wrap_modify">
				      <label class="btnfile" for="file0">上传头像</label>          
                      <input type="file" value="${pic}" name="file1" id="file0" style="position:absolute; clip:rect(0,0,0,0);">
				    </div>
				   </div>
				   <div class="modal-body_wrap_content">
				    <table class="table table-striped" align="center">
				     <tr>
				      <th>账户名: </th>
				      <td><input type="text" class="form-control" name='name' value='${name}'></td>
				     </tr>
				      <tr>
				     <th>密码: </th>
				      <td><input type="password" class="form-control" name='password' value='${password}'></td>
				     </tr>
				     <tr>
				      <th>邮箱: </th>
				      <td><input type="text" class="form-control" name='email' value='${email}'></td>
				     </tr>
				    
				    </table>
				   </div>
				 </div>
			</div>
			<div class="modal-footer">
				 <button type="button" class="btn btn-default" data-dismiss="modal">关闭
				 </button>
				 <button type="submit" class="btn btn-primary">
					提交更改
				 </button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

</body>
</html>