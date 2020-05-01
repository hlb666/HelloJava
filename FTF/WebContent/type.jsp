<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" />
		<link rel="stylesheet" href="css/Site.css" />
		<link rel="stylesheet" href="css/zy.all.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="stylesheet" href="css/amazeui.min.css" />
		<link rel="stylesheet" href="css/admin.css" />
		<script type="text/javascript" src="js/jquery.min.js">
		</script>
</head>
<script type="text/javascript">
$(function() {
	  $.get("${pageContext.request.contextPath}/userLoginController/getzudui",function(data,status){
		 // var a = JSON.parse(data);两种方法
		  //将json字符串转化为json对象
		  var a = eval("("+data+")");
		     for(var i=0;i<a.length;i++){
		    	 $(".tbodys").append("<tr><td>"+ a[i].id+"</td><td>"+a[i].title+"</td><td>"+ a[i].date+ "</td><td>"+
		    	           "<a href='${pageContext.request.contextPath}/userLoginController/delectZudui?id="
		    	           + a[i].id + "'>删除</a>"+ "</td></tr>");
		     }				   
			});    
	          
	  } ); 
</script>
<body>
<div class="dvcontent">	
			<div>
				<!--tab start-->
				<div class="tabs">
					<div class="hd">
						<ul style="">
							<li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">查看组队</li>
						</ul>
					</div>
					<div class="bd">
						<ul style="display: block;padding: 20px;">
							<li>
								<!--分页显示角色信息 start-->
								<div id="dv1">
									<table class="table" id="tbRecord">
										<thead>
											<tr>
												<th>组队编号</th>
												<th>组队名称</th>
												<th>组队时间</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody class="tbodys">								
																																																											
										</tbody>	
									</table>
								</div>
								<!--分页显示角色信息 end-->
							</li>
						</ul>
						
					</div>
				</div>
				<!--tab end-->

			</div>

			
			 <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
              <script src="js/plugs/Jqueryplugs.js" type="text/javascript"></script>
              <script src="js/_layout.js"></script>
             <script src="js/plugs/jquery.SuperSlide.source.js"></script>
			<script>
				var num = 1;
				$(function() {

				 $(".tabs").slide({ trigger: "click" });

				});

	
				var btn_save = function() {
					var pid = $("#RawMaterialsTypePageId  option:selected").val();
					var name = $("#RawMaterialsTypeName").val();
					var desc = $("#RawMaterialsTypeDescription").val();
					var ramark = $("#Ramark").val();
					$.ajax({
						type: "post",
						url: "/RawMaterialsType/AddRawMaterialsType",
						data: { name: name, pid: pid, desc: desc, ramark: ramark },
						success: function(data) {
							if(data > 0) {
								$.jq_Alert({
									message: "添加成功",
									btnOktext: "确认",
									dialogModal: true,
									btnOkClick: function() {
										//$("#RawMaterialsTypeName").val("");
										//$("#RawMaterialsTypeDescription").val("");
										//$("#Ramark").val("");                           
										//page1();
										location.reload();

									}
								});
							}
						}
					});
					alert(t);
				}

				var btn_edit = function(id) {
					$.jq_Panel({
						url: "/RawMaterialsType/EditRawMaterialsType?id=" + id,
						title: "编辑分类",
						dialogModal: true,
						iframeWidth: 500,
						iframeHeight: 400
					});
				}
				var btn_delete = function(id) {
					$.jq_Confirm({
						message: "您确定要删除吗?",
						btnOkClick: function() {
							$.ajax({
								type: "post",
								url: "/RawMaterialsType/DeleteRawMaterialsType",
								data: { id: id },
								success: function(data) {
									if(data > 0) {
										$.jq_Alert({
											message: "删除成功",
											btnOkClick: function() {
												page1();
											}
										});
									}
								}
							});
						}
					});
				}
			</script>
		</div>
</body>
</html>