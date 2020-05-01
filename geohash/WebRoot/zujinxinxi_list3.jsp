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
	<TITLE>租金信息查询</TITLE>
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
							<td colspan="17" background="images/table_header.gif">租金信息列表</td>
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
								<form action="zujinxinxiList2.do" name="myform" method="post">
									查询   合同编号：<input name="hetongbianhao" type="text" id="hetongbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  房源编号：<input name="fangyuanbianhao" type="text" id="fangyuanbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  发布人：<input name="faburen" type="text" id="faburen" style='border:solid 1px #000000; color:#666666' size="12" />  承租人：<input name="chengzuren" type="text" id="chengzuren" style='border:solid 1px #000000; color:#666666' size="12" />  租金月份：<input name="zujinyuefen1" type="text" id="zujinyuefen1"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />-<input name="zujinyuefen2" type="text" id="zujinyuefen2"  value='' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:80px; height:20px; border:solid 1px #000000; color:#666666' />
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
    <td align='center'>发布人</td>
    <td align='center'>承租人</td>
    <td align='center'>月租金</td>
    <td  width='65' align='center'>租金月份</td>
    
    <td  width='80' align='center'>是否支付</td>
    <td  width='80' align='center'>是否审核</td>
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
    <td>${u.faburen}</td>
    <td>${u.chengzuren}</td>
    <td>${u.yuezujin}</td>
    <td>${u.zujinyuefen}</td>
    
    <td align='center'>${u.iszf}</td>
    <td align='center'>${u.issh} </td>
                              <td align="center"> ${u.addtime } </td>
                              <td align="center"><a href="doUpdateZujinxinxi.do?id=${u.id }">编辑</a>  <a href="deleteZujinxinxi.do?id=${u.id }"
										onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">删除</a> <a href="zujinxinxiDetail.do?id=${u.id }">详细</a></td>
                            </tr>
                          </c:forEach>
                        </table></td>
						</tr>
					</table>
					
					
			  </td>
	  </tr>
		</table>
		
		 <%
			String sql="select * from zujinxinxi where faburen='"+(String)request.getSession().getAttribute("username")+"'  ";
				
if(request.getParameter("hetongbianhao")=="" ||request.getParameter("hetongbianhao")==null ){}else{String nhetongbianhao=new String(request.getParameter("hetongbianhao").getBytes("8859_1"));if(nhetongbianhao.contains("?")){nhetongbianhao=request.getParameter("hetongbianhao");}sql=sql+" and hetongbianhao like '%"+nhetongbianhao+"%'";}
if(request.getParameter("fangyuanbianhao")=="" ||request.getParameter("fangyuanbianhao")==null ){}else{String nfangyuanbianhao=new String(request.getParameter("fangyuanbianhao").getBytes("8859_1"));if(nfangyuanbianhao.contains("?")){nfangyuanbianhao=request.getParameter("fangyuanbianhao");}sql=sql+" and fangyuanbianhao like '%"+nfangyuanbianhao+"%'";}
if(request.getParameter("faburen")=="" ||request.getParameter("faburen")==null ){}else{String nfaburen=new String(request.getParameter("faburen").getBytes("8859_1"));if(nfaburen.contains("?")){nfaburen=request.getParameter("faburen");}sql=sql+" and faburen like '%"+nfaburen+"%'";}
if(request.getParameter("chengzuren")=="" ||request.getParameter("chengzuren")==null ){}else{String nchengzuren=new String(request.getParameter("chengzuren").getBytes("8859_1"));if(nchengzuren.contains("?")){nchengzuren=request.getParameter("chengzuren");}sql=sql+" and chengzuren like '%"+nchengzuren+"%'";}
if (request.getParameter("zujinyuefen1")==""  ||request.getParameter("zujinyuefen1")==null ) {}else{sql=sql+" and zujinyuefen >= '"+request.getParameter("zujinyuefen1")+"'";}
if (request.getParameter("zujinyuefen2")==""  ||request.getParameter("zujinyuefen2")==null ) {}else {sql=sql+" and zujinyuefen <= '"+request.getParameter("zujinyuefen2")+"'";}
			sql+=" order by id desc";
double yuezujinz=0;
							
							
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
				
						
						yuezujinz=yuezujinz+Float.valueOf(RS_result.getString("yuezujin")).floatValue();

						
						
			 }
			%>
		共计月租金:<%=yuezujinz%>； 
		
			<p align="center"> <c:if test="${sessionScope.p==1 }">
		 <c:if test="${page.page>1}">
              <a href="zujinxinxiList2.do?page=1" >首页</a>
             <a href="zujinxinxiList2.do?page=${page.page-1 }"> 上一页</a>             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="zujinxinxiList2.do?page=${page.page+1 }">下一页</a>
			<a href="zujinxinxiList2.do?page=${page.totalPage }">末页</a>		    </c:if>		
	</c:if>
	</p>
			
			
			
			
			
	</body>
</html>
