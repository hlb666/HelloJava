<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>

<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>

<!DOCTYPE html>
<html>
<head>

<title>房源信息</title>

<LINK type="text/css" rel=stylesheet href="qtimages/style.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/arrow.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>

</head>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>

<%

%>

<body>
<jsp:include page="qttop.jsp"></jsp:include>
<div class="section">
  <div class="kcBox clear-fix">
    <div class="knowList3 clear-fix">
      <div class="Ttitle">房源信息 <span>Details</span>
        <div class="Tmore">  </div>
      </div>
      <!-- end Ttitle-->
      <ul class="knowListUl2">
	  <font color="#000000">
	                          
							  
							  
<form action="fyxxList.do" name="myform" method="post">
									查询   房源名称：<input name="fangyuanmingcheng" type="text" id="fangyuanmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  所在楼层：<input name="suozailouceng" type="text" id="suozailouceng" style='border:solid 1px #000000; color:#666666' size="12" />  户型结构：<input name="huxingjiegou" type="text" id="huxingjiegou" style='border:solid 1px #000000; color:#666666' size="12" />  建筑面积：<input name="jianzhumianji" type="text" id="jianzhumianji" style='border:solid 1px #000000; color:#666666' size="12" />  建成年份：<input name="jianchengnianfen1" type="text" id="jianchengnianfen1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="jianchengnianfen2" type="text" id="jianchengnianfen2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />  所在位置：<input name="suozaiweizhi" type="text" id="suozaiweizhi" style='border:solid 1px #000000; color:#666666' size="12" />  月租金：<input name="yuezujin" type="text" id="yuezujin" style='border:solid 1px #000000; color:#666666' size="12" /> 房源状态：<select name='fangyuanzhuangtai' id='fangyuanzhuangtai' style='border:solid 1px #000000; color:#666666;'><option value="">所有</option><option value="空闲">空闲</option><option value="已租">已租</option></select>
									<input type="submit" value="查询" /> <input type="button" name="Submit2" value="切换视图"  onClick="javascript:location.href='fyxxListtp.do';" />
								</form>	

	
<br />
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#ebf0f7">
                          <tr>
                            <td align="center" bgcolor="#ebf0f7" width="30px">序号</td>
                            <td bgcolor='#ebf0f7'>房源编号</td>    <td bgcolor='#ebf0f7'>房源名称</td>    <td bgcolor='#ebf0f7' width='90' align='center'>房屋照片</td>    <td bgcolor='#ebf0f7'>所在楼层</td>    <td bgcolor='#ebf0f7'>总楼层</td>    <td bgcolor='#ebf0f7'>户型结构</td>    <td bgcolor='#ebf0f7'>建筑面积</td>    <td bgcolor='#ebf0f7' width='65' align='center'>建成年份</td>    <td bgcolor='#ebf0f7'>所在位置</td>    <td bgcolor='#ebf0f7'>配套设施</td>    <td bgcolor='#ebf0f7'>月租金</td>    <td bgcolor='#ebf0f7'>房源状态</td>        <td bgcolor='#ebf0f7'>发布人</td>    
                            <td align="center" bgcolor="#ebf0f7" width="150px"> 添加时间 </td>
                            <td align="center" bgcolor="#ebf0f7" width="50px"> 操作 </td>
                          </tr>
                          <%
					int i=0;
				%>
                          <c:forEach items="${list}" var="u">
                            <%
					i++;
				%>
                            <tr align="center" bgcolor="#FFFFFF">
                              <td align="center"><%=i%></td>
                             <td>${u.fangyuanbianhao}</td>    <td>${u.fangyuanmingcheng}</td>    <td width='90'><a href='${u.fangwuzhaopian}' target='_blank'><img src='${u.fangwuzhaopian}' width=88 height=99 border=0 /></a></td>    <td>${u.suozailouceng}</td>    <td>${u.zonglouceng}</td>    <td>${u.huxingjiegou}</td>    <td>${u.jianzhumianji}</td>    <td>${u.jianchengnianfen}</td>    <td>${u.suozaiweizhi}</td>    <td>${u.peitaosheshi}</td>    <td>${u.yuezujin}</td>    <td>${u.fangyuanzhuangtai}</td>        <td>${u.faburen}</td>    
                              <td align="center"> ${u.addtime} </td>
                              <td align="center"><a href="fyxxDetail.do?id=${u.id}">详细</a></td>
                            </tr>
                          </c:forEach>
                        </table>
<br>

<p align="center"> <c:if test="${sessionScope.p==1 }">
		 <c:if test="${page.page>1}">
              <a href="fyxxList.do?page=1" >首页</a>
             <a href="fyxxList.do?page=${page.page-1 }"> 上一页</a>             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="fyxxList.do?page=${page.page+1 }">下一页</a>
			<a href="fyxxList.do?page=${page.totalPage }">末页</a>		    </c:if>		
	</c:if>
	</p>




							  
							  
                          					</font>
    
      </ul>
      <!-- end knowListUl-->
    </div>
    <!-- end knowList-->
    <div class="contact">
      <div class="numTel">400-0000-000</div>
      <dl>
        <dt>手&nbsp;&nbsp;&nbsp;机：</dt>
        <dd>12312312312</dd>
      </dl>
      <dl>
        <dt>电&nbsp;&nbsp;&nbsp;话：</dt>
        <dd>0000-00000000</dd>
      </dl>
      <dl>
        <dt>邮&nbsp;&nbsp;&nbsp;箱：</dt>
        <dd>aaaaaaaa@aa.com</dd>
      </dl>
      <dl>
        <dt>地&nbsp;&nbsp;&nbsp;址：</dt>
        <dd>xxxxxxxxxxxxxxxxxxxx</dd>
      </dl>
	  <dl>
        <dt>联系人：</dt>
        <dd>何总</dd>
      </dl>
      <div class="conMore"><a href="">更多 +</a></div>
    </div>
    <!-- end contact-->
  </div>
  <!-- end kcBox-->
</div>

<jsp:include page="qtdown.jsp"></jsp:include>

</body>
</html>
