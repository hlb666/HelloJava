<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>房源信息详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  房源信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%' height=44>房源编号：</td><td width='39%'>${fangyuanxinxi.fangyuanbianhao}</td><td  rowspan=12 align=center><a href=${fangyuanxinxi.fangwuzhaopian} target=_blank><img src=${fangyuanxinxi.fangwuzhaopian} width=228 height=215 border=0></a></td></tr><tr><td width='11%' height=44>房源名称：</td><td width='39%'>${fangyuanxinxi.fangyuanmingcheng}</td></tr><tr><td width='11%' height=44>所在楼层：</td><td width='39%'>${fangyuanxinxi.suozailouceng}</td></tr><tr><td width='11%' height=44>总楼层：</td><td width='39%'>${fangyuanxinxi.zonglouceng}</td></tr><tr><td width='11%' height=44>户型结构：</td><td width='39%'>${fangyuanxinxi.huxingjiegou}</td></tr><tr><td width='11%' height=44>建筑面积：</td><td width='39%'>${fangyuanxinxi.jianzhumianji}</td></tr><tr><td width='11%' height=44>建成年份：</td><td width='39%'>${fangyuanxinxi.jianchengnianfen}</td></tr><tr><td width='11%' height=44>所在位置：</td><td width='39%'>${fangyuanxinxi.suozaiweizhi}</td></tr><tr><td width='11%' height=44>配套设施：</td><td width='39%'>${fangyuanxinxi.peitaosheshi}</td></tr><tr><td width='11%' height=44>月租金：</td><td width='39%'>${fangyuanxinxi.yuezujin}</td></tr><tr><td width='11%' height=44>房源状态：</td><td width='39%'>${fangyuanxinxi.fangyuanzhuangtai}</td></tr><tr><td width='11%' height=44>发布人：</td><td width='39%'>${fangyuanxinxi.faburen}</td></tr><tr><td width='11%' height=100  >详情描述：</td><td width='39%' colspan=2 height=100 >${fangyuanxinxi.xiangqingmiaoshu}</td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>

