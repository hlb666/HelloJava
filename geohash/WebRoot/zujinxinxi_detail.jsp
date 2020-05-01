<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>租金信息详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  租金信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>合同编号：</td><td width='39%'>${zujinxinxi.hetongbianhao}</td>     <td width='11%'>房源编号：</td><td width='39%'>${zujinxinxi.fangyuanbianhao}</td></tr><tr>     <td width='11%'>发布人：</td><td width='39%'>${zujinxinxi.faburen}</td>     <td width='11%'>承租人：</td><td width='39%'>${zujinxinxi.chengzuren}</td></tr><tr>     <td width='11%'>月租金：</td><td width='39%'>${zujinxinxi.yuezujin}</td>     <td width='11%'>租金月份：</td><td width='39%'>${zujinxinxi.zujinyuefen}</td></tr><tr>     <td width='11%'>备注说明：</td><td width='39%'>${zujinxinxi.beizhushuoming}</td>     <td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>

