<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>租房记录详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  租房记录详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>房源编号：</td><td width='39%'>${zufangjilu.fangyuanbianhao}</td>     <td width='11%'>房源名称：</td><td width='39%'>${zufangjilu.fangyuanmingcheng}</td></tr><tr>     <td width='11%'>发布人：</td><td width='39%'>${zufangjilu.faburen}</td>     <td width='11%'>月租金：</td><td width='39%'>${zufangjilu.yuezujin}</td></tr><tr>     <td width='11%'>预约看房：</td><td width='39%'>${zufangjilu.yuyuekanfang}</td>     <td width='11%'>备注说明：</td><td width='39%'>${zufangjilu.beizhushuoming}</td></tr><tr>     <td width='11%'>承租人：</td><td width='39%'>${zufangjilu.chengzuren}</td>     <td width='11%'>房东回复：</td><td width='39%'>${zufangjilu.fangdonghuifu}</td>     </tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>

