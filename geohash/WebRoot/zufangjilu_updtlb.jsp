<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<TITLE>设置租房记录</TITLE>
	    
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
       
	</head>
<%
  String id="";
//islbd1q 
   %>
<script language="javascript">

function gows()
{
	document.location.href="zufangjilu_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>
	<body>
			<form action="updateZufangjilu.do" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1"  style="border-collapse:collapse" bgcolor="#F2FDFF">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" background="images/table_header.gif">设置租房记录<input type="hidden" name="id" value="${zufangjilu.id}" /></td>
						</tr>
						<tr style='display:none'><td width="200">房源编号：</td><td><input name='fangyuanbianhao' type='text' id='fangyuanbianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr>
		<tr style='display:none'><td width="200">房源名称：</td><td><input name='fangyuanmingcheng' type='text' id='fangyuanmingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr>
		<tr style='display:none'><td width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr>
		<tr style='display:none'><td width="200">月租金：</td><td><input name='yuezujin' type='text' id='yuezujin' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr>
		<tr style='display:none'><td width="200">预约看房：</td><td><input name='yuyuekanfang' type='text' id='yuyuekanfang' value='<%=connDbBean.getdate()%>' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelyuyuekanfang' /></td></tr>
		<tr style='display:none'><td width="200">备注说明：</td><td><textarea name='beizhushuoming' cols='50' rows='5' id='beizhushuoming' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		<tr style='display:none'><td width="200">承租人：</td><td><input name='chengzuren' type='text' id='chengzuren' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=(String)request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		<tr ><td width="200">房东回复：</td><td><textarea name='fangdonghuifu' cols='50' rows='5' id='fangdonghuifu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
						<script language="javascript">document.form1.fangyuanbianhao.value='${zufangjilu.fangyuanbianhao}';</script>
	<script language="javascript">document.form1.fangyuanmingcheng.value='${zufangjilu.fangyuanmingcheng}';</script>
	<script language="javascript">document.form1.faburen.value='${zufangjilu.faburen}';</script>
	<script language="javascript">document.form1.yuezujin.value='${zufangjilu.yuezujin}';</script>
	<script language="javascript">document.form1.yuyuekanfang.value='${zufangjilu.yuyuekanfang}';</script>
	<script language="javascript">document.form1.beizhushuoming.value='${zufangjilu.beizhushuoming}';</script>
	<script language="javascript">document.form1.chengzuren.value='${zufangjilu.chengzuren}';</script>
	<script language="javascript">document.form1.fangdonghuifu.value='${zufangjilu.fangdonghuifu}';</script>
	
					 </table>
			</form>
   </body>
</html>





<script language=javascript >  
 
 function checkform(){  
 
	var yuyuekanfangobj = document.getElementById("yuyuekanfang"); if(yuyuekanfangobj.value==""){document.getElementById("clabelyuyuekanfang").innerHTML="&nbsp;&nbsp;<font color=red>请输入预约看房</font>";return false;}else{document.getElementById("clabelyuyuekanfang").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  
