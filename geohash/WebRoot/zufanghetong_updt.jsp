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
		<TITLE>修改租房合同</TITLE>
	    
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
 
   %>
<script language="javascript">

function gows()
{
	document.location.href="zufanghetong_add.jsp?id=<%=id%>";
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
			<form action="updateZufanghetong.do" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1"  style="border-collapse:collapse" bgcolor="#F2FDFF">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" background="images/table_header.gif">修改租房合同<input type="hidden" name="id" value="${zufanghetong.id}" /></td>
						</tr>
						<tr ><td width="200">合同编号：</td><td><input name='hetongbianhao' type='text' id='hetongbianhao' value='<%=connDbBean.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">房源编号：</td><td><input name='fangyuanbianhao' type='text' id='fangyuanbianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr>
		<tr ><td width="200">房源名称：</td><td><input name='fangyuanmingcheng' type='text' id='fangyuanmingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr>
		<tr ><td width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr>
		<tr ><td width="200">承租人：</td><td><input name='chengzuren' type='text' id='chengzuren' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=(String)request.getSession().getAttribute("username")%>' readonly="readonly"  readonly='readonly' /></td></tr>
		<tr ><td width="200">月租金：</td><td><input name='yuezujin' type='text' id='yuezujin' value='' onblur='' style='border:solid 1px #000000; color:#666666'   /></td></tr>
		<tr ><td width="200">覆约金：</td><td><input name='fuyuejin' type='text' id='fuyuejin' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabelfuyuejin' />必需数字型</td></tr>
		<tr ><td width="200">付款方式：</td><td><input name='fukuanfangshi' type='text' id='fukuanfangshi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">起租日期：</td><td><input name='qizuriqi' type='text' id='qizuriqi' value='<%=connDbBean.getdate()%>' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabelqizuriqi' /></td></tr>
		<tr 0><td width="200">截止日期：</td><td><input name='jiezhiriqi' type='text' id='jiezhiriqi' value='<%=connDbBean.getdate()%>' onblur='checkform()' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/>&nbsp;*<label id='clabeljiezhiriqi' /></td></tr>
		<tr 1><td width="200">附件：</td><td><input name='fujian' type='text' id='fujian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('fujian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr 2><td width="200">备注说明：</td><td><textarea name='beizhushuoming' cols='50' rows='5' id='beizhushuoming' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
						<script language="javascript">document.form1.hetongbianhao.value='${zufanghetong.hetongbianhao}';</script>
	<script language="javascript">document.form1.fangyuanbianhao.value='${zufanghetong.fangyuanbianhao}';</script>
	<script language="javascript">document.form1.fangyuanmingcheng.value='${zufanghetong.fangyuanmingcheng}';</script>
	<script language="javascript">document.form1.faburen.value='${zufanghetong.faburen}';</script>
	<script language="javascript">document.form1.chengzuren.value='${zufanghetong.chengzuren}';</script>
	<script language="javascript">document.form1.yuezujin.value='${zufanghetong.yuezujin}';</script>
	<script language="javascript">document.form1.fuyuejin.value='${zufanghetong.fuyuejin}';</script>
	<script language="javascript">document.form1.fukuanfangshi.value='${zufanghetong.fukuanfangshi}';</script>
	<script language="javascript">document.form1.qizuriqi.value='${zufanghetong.qizuriqi}';</script>
	<script language="javascript">document.form1.jiezhiriqi.value='${zufanghetong.jiezhiriqi}';</script>
	<script language="javascript">document.form1.fujian.value='${zufanghetong.fujian}';</script>
	<script language="javascript">document.form1.beizhushuoming.value='${zufanghetong.beizhushuoming}';</script>
	
					 </table>
			</form>
   </body>
</html>






<script language=javascript >  
 
 function checkform(){  
 
	
    var qizuriqiobj = document.getElementById("qizuriqi"); if(qizuriqiobj.value==""){document.getElementById("clabelqizuriqi").innerHTML="&nbsp;&nbsp;<font color=red>请输入起租日期</font>";return false;}else{document.getElementById("clabelqizuriqi").innerHTML="  "; } 
	var jiezhiriqiobj = document.getElementById("jiezhiriqi"); if(jiezhiriqiobj.value==""){document.getElementById("clabeljiezhiriqi").innerHTML="&nbsp;&nbsp;<font color=red>请输入截止日期</font>";return false;}else{document.getElementById("clabeljiezhiriqi").innerHTML="  "; } 
	


return true;   
}   
popheight=450;
</script>  
