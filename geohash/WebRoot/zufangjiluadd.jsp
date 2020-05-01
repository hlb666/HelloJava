<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>



<!DOCTYPE html>
<html>
<head>

<title>租房记录</title>

<LINK type="text/css" rel=stylesheet href="qtimages/style.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/arrow.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
</head>
<%
if(request.getSession().getAttribute("username")==null)
{
	out.print("<script>alert('对不起,请您先登陆!');location.href='index.do';</script>");
	return;
}
  String id="";


 



   %>


	
	<script language="javascript">
function checkform()
{
	var yuyuekanfangobj = document.getElementById("yuyuekanfang"); if(yuyuekanfangobj.value==""){document.getElementById("clabelyuyuekanfang").innerHTML="&nbsp;&nbsp;<font color=red>请输入预约看房</font>";return false;}else{document.getElementById("clabelyuyuekanfang").innerHTML="  "; } 
	
}
function gow()
{
	document.location.href="zufangjiluadd.jsp?id=<%=id%>";
}
</script>


<body>
<jsp:include page="qttop.jsp"></jsp:include>
<div class="section">
  <div class="kcBox clear-fix">
    <div class="knowList3 clear-fix">
      <div class="Ttitle">租房记录 <span>Details</span>
        <div class="Tmore">  </div>
      </div>
      <!-- end Ttitle-->
      <ul class="knowListUl2">
	  <font color="#000000">
	                          
							  
							  <% 




%>

  
<form action="addZufangjilu.do" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CCCCCC" style="border-collapse:collapse;color:#333333;font-size:14" class="newsline">
						
						<tr ><td width="200">房源编号：</td><td><input name='fangyuanbianhao' type='text' id='fangyuanbianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.fangyuanbianhao.value='<%=connDbBean.readzd("fangyuanxinxi","fangyuanbianhao","id",request.getParameter("id"))%>';document.form1.fangyuanbianhao.setAttribute("readOnly",'true');</script>
		<tr ><td width="200">房源名称：</td><td><input name='fangyuanmingcheng' type='text' id='fangyuanmingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.fangyuanmingcheng.value='<%=connDbBean.readzd("fangyuanxinxi","fangyuanmingcheng","id",request.getParameter("id"))%>';document.form1.fangyuanmingcheng.setAttribute("readOnly",'true');</script>
		<tr ><td width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.faburen.value='<%=connDbBean.readzd("fangyuanxinxi","faburen","id",request.getParameter("id"))%>';document.form1.faburen.setAttribute("readOnly",'true');</script>
		<tr ><td width="200">月租金：</td><td><input name='yuezujin' type='text' id='yuezujin' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.yuezujin.value='<%=connDbBean.readzd("fangyuanxinxi","yuezujin","id",request.getParameter("id"))%>';document.form1.yuezujin.setAttribute("readOnly",'true');</script>
		<tr ><td width="200">预约看房：</td><td><input name='yuyuekanfang' type='text' id='yuyuekanfang' value='<%=connDbBean.getdate()%>' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelyuyuekanfang' /></td></tr>
		<tr ><td width="200">备注说明：</td><td><textarea name='beizhushuoming' cols='50' rows='5' id='beizhushuoming' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		<tr ><td width="200">承租人：</td><td><input name='chengzuren' type='text' id='chengzuren' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=(String)request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr style='display:none'><td width="200">房东回复：</td><td><input name='fangdonghuifu' type='text' id='fangdonghuifu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						      <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
			<script language="javascript">popheight = 450;</script>
							  
							  
                          					</font>
    
      </ul>
      <!-- end knowListUl-->
    </div>
    <!-- end knowList-->
    <div class="contact">
      <div class="numTel">400-0000-000</div>
      <dl>
        <dt>手&nbsp;&nbsp;&nbsp;机：</dt>
        <dd>12312312312</dd>
      </dl>
      <dl>
        <dt>电&nbsp;&nbsp;&nbsp;话：</dt>
        <dd>0000-00000000</dd>
      </dl>
      <dl>
        <dt>邮&nbsp;&nbsp;&nbsp;箱：</dt>
        <dd>aaaaaaaa@aa.com</dd>
      </dl>
      <dl>
        <dt>地&nbsp;&nbsp;&nbsp;址：</dt>
        <dd>xxxxxxxxxxxxxxxxxxxx</dd>
      </dl>
	  <dl>
        <dt>联系人：</dt>
        <dd>何总</dd>
      </dl>
      <div class="conMore"><a href="">更多 +</a></div>
    </div>
    <!-- end contact-->
  </div>
  <!-- end kcBox-->
</div>

<jsp:include page="qtdown.jsp"></jsp:include>

</body>
</html>
