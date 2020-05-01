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
	<TITLE>租房合同查询</TITLE>
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
							<td colspan="17" background="images/table_header.gif">租房合同列表</td>
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
								<form action="zufanghetongList2.do" name="myform" method="post">
									查询   合同编号：<input name="hetongbianhao" type="text" id="hetongbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  房源编号：<input name="fangyuanbianhao" type="text" id="fangyuanbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  房源名称：<input name="fangyuanmingcheng" type="text" id="fangyuanmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  发布人：<input name="faburen" type="text" id="faburen" style='border:solid 1px #000000; color:#666666' size="12" />  承租人：<input name="chengzuren" type="text" id="chengzuren" style='border:solid 1px #000000; color:#666666' size="12" />  起租日期：<input name="qizuriqi1" type="text" id="qizuriqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="qizuriqi2" type="text" id="qizuriqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />  截止日期：<input name="jiezhiriqi1" type="text" id="jiezhiriqi1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="jiezhiriqi2" type="text" id="jiezhiriqi2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />
									<input type="submit" value="查询" />
								</form>								</td>
						</tr></table>
					  </td>
			    </tr>
					
						<tr align="center">
						<td style="padding-left:0px; padding-right:0px;"><table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#ebf0f7">
                          <tr>
                            <td align="center" bgcolor="#ebf0f7" width="30px">序号</td>
                            <td align='center'>合同编号</td>
    <td align='center'>房源编号</td>
    <td align='center'>房源名称</td>
    <td align='center'>发布人</td>
    <td align='center'>承租人</td>
    <td align='center'>月租金</td>
    <td align='center'>覆约金</td>
    <td align='center'>付款方式</td>
    <td  width='65' align='center'>起租日期</td>
    <td  width='65' align='center'>截止日期</td>
    <td  width='90' align='center'>附件</td>
    
    <td  width='80' align='center'>履约金退还</td>
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
                             <td>${u.hetongbianhao}</td>
    <td>${u.fangyuanbianhao}</td>
    <td>${u.fangyuanmingcheng}</td>
    <td>${u.faburen}</td>
    <td>${u.chengzuren}</td>
    <td>${u.yuezujin}</td>
    <td>${u.fuyuejin}</td>
    <td>${u.fukuanfangshi}</td>
    <td>${u.qizuriqi}</td>
    <td>${u.jiezhiriqi}</td>
    <td width='90' align='center'><a href='${u.fujian}' target='_blank'>下载</a></td>
    
    <td align='center'>${u.issh} </td>
                              <td align="center"> ${u.addtime } </td>
                              <td align="center"> <a href="zufanghetongDetail.do?id=${u.id }">详细</a></td>
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
              <a href="zufanghetongList2.do?page=1" >首页</a>
             <a href="zufanghetongList2.do?page=${page.page-1 }"> 上一页</a>             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="zufanghetongList2.do?page=${page.page+1 }">下一页</a>
			<a href="zufanghetongList2.do?page=${page.totalPage }">末页</a>		    </c:if>		
	</c:if>
	</p>
			
			
			
			
			
	</body>
</html>
