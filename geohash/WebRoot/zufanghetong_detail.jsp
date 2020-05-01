<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>租房合同详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  租房合同详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>合同编号：</td><td width='39%'>${zufanghetong.hetongbianhao}</td>     <td width='11%'>房源编号：</td><td width='39%'>${zufanghetong.fangyuanbianhao}</td></tr><tr>     <td width='11%'>房源名称：</td><td width='39%'>${zufanghetong.fangyuanmingcheng}</td>     <td width='11%'>发布人：</td><td width='39%'>${zufanghetong.faburen}</td></tr><tr>     <td width='11%'>承租人：</td><td width='39%'>${zufanghetong.chengzuren}</td>     <td width='11%'>月租金：</td><td width='39%'>${zufanghetong.yuezujin}</td></tr><tr>     <td width='11%'>覆约金：</td><td width='39%'>${zufanghetong.fuyuejin}</td>     <td width='11%'>付款方式：</td><td width='39%'>${zufanghetong.fukuanfangshi}</td></tr><tr>     <td width='11%'>起租日期：</td><td width='39%'>${zufanghetong.qizuriqi}</td>     <td width='11%'>截止日期：</td><td width='39%'>${zufanghetong.jiezhiriqi}</td></tr><tr>     <td width='11%'>附件：</td><td width='39%'><a href="${zufanghetong.fujian}">点此下载</a></td>     <td width='11%'>备注说明：</td><td width='39%'>${zufanghetong.beizhushuoming}</td>     </tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>

