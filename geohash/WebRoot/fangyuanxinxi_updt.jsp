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
		<TITLE>修改房源信息</TITLE>
	    <link rel="stylesheet" href="kindeditor_a5/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor_a5/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor_a5/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor_a5/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor_a5/plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="xiangqingmiaoshu"]', {
				cssPath : 'kindeditor_a5/plugins/code/prettify.css',
				uploadJson : 'kindeditor_a5/jsp/upload_json.jsp',
				fileManagerJson : 'kindeditor_a5/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
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
	document.location.href="fangyuanxinxi_add.jsp?id=<%=id%>";
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
			<form action="updateFangyuanxinxi.do" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1"  style="border-collapse:collapse" bgcolor="#F2FDFF">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" background="images/table_header.gif">修改房源信息<input type="hidden" name="id" value="${fangyuanxinxi.id}" /></td>
						</tr>
						<tr ><td width="200">房源编号：</td><td><input name='fangyuanbianhao' type='text' id='fangyuanbianhao' value='<%=connDbBean.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">房源名称：</td><td><input name='fangyuanmingcheng' type='text' id='fangyuanmingcheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelfangyuanmingcheng' /></td></tr>		<tr ><td width="200">房屋照片：</td><td><input name='fangwuzhaopian' type='text' id='fangwuzhaopian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('fangwuzhaopian')" style='border:solid 1px #000000; color:#666666'/></td></tr>		<tr ><td width="200">所在楼层：</td><td><input name='suozailouceng' type='text' id='suozailouceng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabelsuozailouceng' />必需数字型</td></tr>		<tr ><td width="200">总楼层：</td><td><input name='zonglouceng' type='text' id='zonglouceng' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">户型结构：</td><td><input name='huxingjiegou' type='text' id='huxingjiegou' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">建筑面积：</td><td><input name='jianzhumianji' type='text' id='jianzhumianji' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabeljianzhumianji' />必需数字型</td></tr>		<tr ><td width="200">建成年份：</td><td><input name='jianchengnianfen' type='text' id='jianchengnianfen' value='<%=connDbBean.getdate()%>' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>		<tr ><td width="200">所在位置：</td><td><input name='suozaiweizhi' type='text' id='suozaiweizhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr 0><td width="200">配套设施：</td><td><input name='peitaosheshi' type='text' id='peitaosheshi' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr 1><td width="200">月租金：</td><td><input name='yuezujin' type='text' id='yuezujin' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelyuezujin' /></td></tr>		<tr 2><td width="200">房源状态：</td><td><select name='fangyuanzhuangtai' id='fangyuanzhuangtai'><option value="空闲">空闲</option><option value="已租">已租</option></select></td></tr>		<tr 3><td width="200">详情描述：</td><td><textarea name="xiangqingmiaoshu" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea></td></tr>		<tr 4><td width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=(String)request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>		
		
						<tr align='center'   height="22">
						    <td width="25%"  align="right">&nbsp;
						        
						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
						<script language="javascript">document.form1.fangyuanbianhao.value='${fangyuanxinxi.fangyuanbianhao}';</script>	<script language="javascript">document.form1.fangyuanmingcheng.value='${fangyuanxinxi.fangyuanmingcheng}';</script>	<script language="javascript">document.form1.fangwuzhaopian.value='${fangyuanxinxi.fangwuzhaopian}';</script>	<script language="javascript">document.form1.suozailouceng.value='${fangyuanxinxi.suozailouceng}';</script>	<script language="javascript">document.form1.zonglouceng.value='${fangyuanxinxi.zonglouceng}';</script>	<script language="javascript">document.form1.huxingjiegou.value='${fangyuanxinxi.huxingjiegou}';</script>	<script language="javascript">document.form1.jianzhumianji.value='${fangyuanxinxi.jianzhumianji}';</script>	<script language="javascript">document.form1.jianchengnianfen.value='${fangyuanxinxi.jianchengnianfen}';</script>	<script language="javascript">document.form1.suozaiweizhi.value='${fangyuanxinxi.suozaiweizhi}';</script>	<script language="javascript">document.form1.peitaosheshi.value='${fangyuanxinxi.peitaosheshi}';</script>	<script language="javascript">document.form1.yuezujin.value='${fangyuanxinxi.yuezujin}';</script>	<script language="javascript">document.form1.fangyuanzhuangtai.value='${fangyuanxinxi.fangyuanzhuangtai}';</script>	<script language="javascript">document.form1.xiangqingmiaoshu.value='${fangyuanxinxi.xiangqingmiaoshu}';</script>	<script language="javascript">document.form1.faburen.value='${fangyuanxinxi.faburen}';</script>	
					 </table>
			</form>
   </body>
</html>






<script language=javascript >  
 
 function checkform(){  
 
	var fangyuanmingchengobj = document.getElementById("fangyuanmingcheng"); if(fangyuanmingchengobj.value==""){document.getElementById("clabelfangyuanmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入房源名称</font>";return false;}else{document.getElementById("clabelfangyuanmingcheng").innerHTML="  "; } 	        var yuezujinobj = document.getElementById("yuezujin"); if(yuezujinobj.value==""){document.getElementById("clabelyuezujin").innerHTML="&nbsp;&nbsp;<font color=red>请输入月租金</font>";return false;}else{document.getElementById("clabelyuezujin").innerHTML="  "; } 	    


return true;   
}   
popheight=450;
</script>  
