<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<TITLE>添加房源信息</TITLE>
    <script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&ak=mK55PnxMQ79ff5TAzWNdvQufGSTiy5n1&services=&t=20171014112628"></script>
    <!-- 如果需要拖拽鼠标进行操作，可引入以下js文件 -->
    <script type="text/javascript" src="http://api.map.baidu.com/library/RectangleZoom/1.2/src/RectangleZoom_min.js"></script> 
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
		

		
	<link rel="stylesheet" href="kindeditor_a5/themes/default/default.css" />
	<link rel="stylesheet" href="kindeditor_a5/plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor_a5/kindeditor.js"></script>
	<script charset="utf-8" src="kindeditor_a5/lang/zh_CN.js"></script>
	<script charset="utf-8" src="kindeditor_a5/plugins/code/prettify.js"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
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
<form action="addFangyuanxinxi.do" name="form1" method="post">
	<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1"  style="border-collapse:collapse" bgcolor="#F2FDFF">
		<tr bgcolor="#E7E7E7">
			<td height="20" colspan="2" background="images/table_header.gif">添加房源信息</td>
		</tr>
		<tr ><td width="200">房源编号：</td><td><input name='fangyuanbianhao' type='text' id='fangyuanbianhao' value='<%=connDbBean.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">房源名称：</td><td><input name='fangyuanmingcheng' type='text' id='fangyuanmingcheng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelfangyuanmingcheng' /></td></tr>		<tr ><td width="200">房屋照片：</td><td><input name='fangwuzhaopian' type='text' id='fangwuzhaopian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;
		<input type='button' value='上传' onClick="up('fangwuzhaopian')" style='border:solid 1px #000000; color:#666666'/></td></tr>		<tr ><td width="200">所在楼层：</td><td><input name='suozailouceng' type='text' id='suozailouceng' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabelsuozailouceng' />必需数字型</td></tr>		<tr ><td width="200">总楼层：</td><td><input name='zonglouceng' type='text' id='zonglouceng' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">户型结构：</td><td><input name='huxingjiegou' type='text' id='huxingjiegou' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">建筑面积：</td><td><input name='jianzhumianji' type='text' id='jianzhumianji' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabeljianzhumianji' />必需数字型</td></tr>		<tr ><td width="200">建成年份：</td><td><input name='jianchengnianfen' type='text' id='jianchengnianfen' value='<%=connDbBean.getdate()%>' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>		<tr ><td width="200">所在位置：</td><td><input name='suozaiweizhi' type='text' id='suozaiweizhi' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">配套设施：</td><td><input name='peitaosheshi' type='text' id='peitaosheshi' value='' onblur='' size='50' style='border:solid 1px #000000; color:#666666' /></td></tr>		<tr ><td width="200">月租金：</td><td><input name='yuezujin' type='text' id='yuezujin' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelyuezujin' /></td></tr>		<tr ><td width="200">房源状态：</td><td><select name='fangyuanzhuangtai' id='fangyuanzhuangtai'><option value="空闲">空闲</option><option value="已租">已租</option></select></td></tr>		<tr ><td width="200">详情描述：</td><td><textarea name="xiangqingmiaoshu" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"></textarea></td></tr>
		<tr ><td width="200">选择房源位置：</td>
		 <td>
		  <div style="width: 700px;height: 650px">
		      <div id="allmap" style="width:100%;height: 500px;"></div>
			   <div id="r-result">
			         输入:<input type="text" id="suggestId" size="20" value="百度" style="width: 700px;height: 25px;border: 1px solid black" /></div>
			         经度:<input name="lng" type="text" class="lng" style="width: 700px;height: 25px;border: 1px solid black"><br>
			         纬度:<input name="lat" type="text" class="lat" style="width: 700px;height: 25px;border: 1px solid black">
			   <div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
		  </div>
        </td>
		</tr>		<tr ><td width="200">发布人：</td><td><input name='faburen' type='text' id='faburen' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=(String)request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>		
		<tr align='center'   height="22">
			 <td width="25%"  align="right">&nbsp;						        
			 </td>
			 <td width="75%"  align="left">
			     <input type="submit" name="querenzhuce" id="querenzhuce" value="发布信息" onClick="return checkform();"/>
			     <input type="reset" value="重置信息"/>&nbsp;
			</td>
		</tr>
	</table>
</form>
</body>
</html>
<script language=javascript >  
 function checkform(){  
	var fangyuanmingchengobj = document.getElementById("fangyuanmingcheng"); if(fangyuanmingchengobj.value==""){document.getElementById("clabelfangyuanmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入房源名称</font>";return false;}else{document.getElementById("clabelfangyuanmingcheng").innerHTML="  "; } 	var suozailoucengobj = document.getElementById("suozailouceng"); if(suozailoucengobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(suozailoucengobj.value)){document.getElementById("clabelsuozailouceng").innerHTML=""; }else{document.getElementById("clabelsuozailouceng").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}      var jianzhumianjiobj = document.getElementById("jianzhumianji"); if(jianzhumianjiobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(jianzhumianjiobj.value)){document.getElementById("clabeljianzhumianji").innerHTML=""; }else{document.getElementById("clabeljianzhumianji").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}      var yuezujinobj = document.getElementById("yuezujin"); if(yuezujinobj.value==""){document.getElementById("clabelyuezujin").innerHTML="&nbsp;&nbsp;<font color=red>请输入月租金</font>";return false;}else{document.getElementById("clabelyuezujin").innerHTML="  "; } 	var yuezujinobj = document.getElementById("yuezujin"); if(yuezujinobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(yuezujinobj.value)){document.getElementById("clabelyuezujin").innerHTML=""; }else{document.getElementById("clabelyuezujin").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
return true;   
}   
popheight=450;
</script>  
<script type="text/javascript">  
    // 百度地图API功能
  
    var map = new BMap.Map("allmap");
    map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
    map.addControl(new BMap.MapTypeControl()); 
    var myDrag = new BMapLib.RectangleZoom(map, {
        followText: "拖拽鼠标进行操作"
    });
    myDrag.open();  //开启拉框放大
    // myDrag.close();  //关闭拉框放大
    map.centerAndZoom("芜湖",15);   // 初始化地图,设置城市和地图级别。
    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "suggestId"
        ,"location" : map
    });
    ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
    var str = "";
        var _value = e.fromitem.value;
        var value = "";
        if (e.fromitem.index > -1) {
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }    
        str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
        
        value = "";
        if (e.toitem.index > -1) {
            _value = e.toitem.value;
            value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        }    
        str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
        G("searchResultPanel").innerHTML = str;
    });

    var myValue;
    ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
    var _value = e.item.value;
        myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
        G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
        setPlace();
    });

    function setPlace(){
        map.clearOverlays();    //清除地图上所有覆盖物
        function myFun(){
            var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
            console.log('经度：'+pp.lng, '纬度：'+pp.lat);
            $(".lng").val(pp.lng);
            $(".lat").val(pp.lat);
            map.centerAndZoom(pp, 18);
            map.addOverlay(new BMap.Marker(pp));    //添加标注
        }
        var local = new BMap.LocalSearch(map, { //智能搜索
          onSearchComplete: myFun
        });
        local.search(myValue);
    }   
</script>