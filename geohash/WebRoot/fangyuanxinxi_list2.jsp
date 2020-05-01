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
	<TITLE>房源信息查询</TITLE>
	<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
	</head>
	<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td>
					<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
						<tr align="left" bgcolor="#F2FDFF">
							<td colspan="17" background="images/table_header.gif">房源信息列表</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr valign="top">
			  <td bgcolor="#FFFFFF">
			  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
						
					<tr align="right" bgcolor="#ebf0f7">
					  <td colspan="21">
					  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" >
						<tr align="left" >
							<td colspan="17">
								<form action="fangyuanxinxiList2.do" name="myform" method="post">
									查询   房源名称：<input name="fangyuanmingcheng" type="text" id="fangyuanmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  所在楼层：<input name="suozailouceng" type="text" id="suozailouceng" style='border:solid 1px #000000; color:#666666' size="12" />  户型结构：<input name="huxingjiegou" type="text" id="huxingjiegou" style='border:solid 1px #000000; color:#666666' size="12" />  建筑面积：<input name="jianzhumianji" type="text" id="jianzhumianji" style='border:solid 1px #000000; color:#666666' size="12" />  建成年份：<input name="jianchengnianfen1" type="text" id="jianchengnianfen1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="jianchengnianfen2" type="text" id="jianchengnianfen2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />  所在位置：<input name="suozaiweizhi" type="text" id="suozaiweizhi" style='border:solid 1px #000000; color:#666666' size="12" />  月租金：<input name="yuezujin" type="text" id="yuezujin" style='border:solid 1px #000000; color:#666666' size="12" /> 房源状态：<select name='fangyuanzhuangtai' id='fangyuanzhuangtai' style='border:solid 1px #000000; color:#666666;'><option value="">所有</option><option value="空闲">空闲</option><option value="已租">已租</option></select>
									<input type="submit" value="查询" />
								</form>								</td>
						</tr></table>
					  </td>
			    </tr>
					
						<tr align="center">
						<td style="padding-left:0px; padding-right:0px;"><table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#ebf0f7">
                          <tr>
                            <td align="center" bgcolor="#ebf0f7" width="30px">序号</td>
                            <td align='center'>房源编号</td>    <td align='center'>房源名称</td>    <td  width='90' align='center'>房屋照片</td>    <td align='center'>所在楼层</td>    <td align='center'>总楼层</td>    <td align='center'>户型结构</td>    <td align='center'>建筑面积</td>    <td  width='65' align='center'>建成年份</td>    <td align='center'>所在位置</td>    <td align='center'>配套设施</td>    <td align='center'>月租金</td>    <td align='center'>房源状态</td>        <td align='center'>发布人</td>    <td  width='80' align='center'>是否审核</td>
                            <td align="center" bgcolor="#ebf0f7" width="150px"> 添加时间 </td>
                            <td align="center" bgcolor="#ebf0f7" width="150px"> 操作 </td>
                          </tr>
                          <%
					int i=0;
				%>
                          <c:forEach items="${list }" var="u">
                            <%
					i++;
				%>
                            <tr align="center" bgcolor="#FFFFFF">
                              <td align="center"><%=i%></td>
                             <td>${u.fangyuanbianhao}</td>    <td>${u.fangyuanmingcheng}</td>    <td width='90' align='center'><a href='${u.fangwuzhaopian}' target='_blank'><img src='${u.fangwuzhaopian}' width=88 height=99 border=0 /></a></td>    <td>${u.suozailouceng}</td>    <td>${u.zonglouceng}</td>    <td>${u.huxingjiegou}</td>    <td>${u.jianzhumianji}</td>    <td>${u.jianchengnianfen}</td>    <td>${u.suozaiweizhi}</td>    <td>${u.peitaosheshi}</td>    <td>${u.yuezujin}</td>    <td>${u.fangyuanzhuangtai}</td>        <td>${u.faburen}</td>    <td align='center'>${u.issh} </td>
                              <td align="center"> ${u.addtime } </td>
                              <td align="center"><a href="doUpdateFangyuanxinxi.do?id=${u.id }">编辑</a>  <a href="deleteFangyuanxinxi.do?id=${u.id }"
										onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">删除</a> <a href="fyxxDetail.do?id=${u.id }" target="_blank">详细</a></td>
                            </tr>
                          </c:forEach>
                        </table></td>
						</tr>
					</table>
					
					
			  </td>
	  </tr>
		</table>
		
		
		
			<p align="center"> <c:if test="${sessionScope.p==1 }">
		 <c:if test="${page.page>1}">
              <a href="fangyuanxinxiList2.do?page=1" >首页</a>
             <a href="fangyuanxinxiList2.do?page=${page.page-1 }"> 上一页</a>             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="fangyuanxinxiList2.do?page=${page.page+1 }">下一页</a>
			<a href="fangyuanxinxiList2.do?page=${page.totalPage }">末页</a>		    </c:if>		
	</c:if>
	</p>
			
			
			
			
			
	</body>
</html>
