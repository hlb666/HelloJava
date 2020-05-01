<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.db"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>



<!DOCTYPE html>
<html>
<head>

<title>GeoHash应用租房系统实例</title>

<LINK type="text/css" rel=stylesheet href="qtimages/style.css">
<script type="text/javascript" src="qtimages/jquery.js"></script>
<script type="text/javascript" src="qtimages/arrow.js"></script>
<script type="text/javascript" src="qtimages/inc.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body>
<jsp:include page="qttop.jsp"></jsp:include>
<div class="section ">
  <div class="TtitleBox">
    <div class="Ttitle">房源展示 <span>Service items</span>
      <div class="Tmore"> <a href="">查看更多 +</a> </div>
    </div>
    <!-- end Ttitle-->
  
  </div>
  <!-- end TtitleBox-->
  <div class="casebg">
    <div id="casePicUlId">
      <div class="casePicUlIdBox htmlpic1">
        <ul class="casePicUl">
          <c:forEach items="${syfangyuanxinxi1 }" var="a">
          <li>
            <div class="title">${a.huxingjiegou}</div>
            <div class="pic"><img src="${a.fangwuzhaopian}" alt="" width="219" height="170" class="PicAuto"></div>
            <div class="intro">${a.fangyuanmingcheng}</div>
            <div class="more"><a href="fyxxDetail.do?id=${a.id}">详情+</a></div>
          </li>
          </c:forEach>
          
		  
		</ul>
      </div>
      <!-- end casePicUlId-->
     
      <!-- end casePicUlId-->
    </div>
    <!-- end casePicUlIdBox-->
  </div>
  <!-- end casePic-->
</div>
<div class="section">
  <div class="kcBox clear-fix">
    <div class="knowList clear-fix">
      <div class="Ttitle">站内新闻 <span>News</span>
        <div class="Tmore"> <a href="xwtzList.dow?lb=站内新闻">查看更多 +</a> </div>
      </div>
      <!-- end Ttitle-->
      <ul class="knowListUl">
	 <c:forEach items="${syxinwentongzhi1 }" var="a">
        <li><a href="xwtzDetail.do?id=${a.id}">${fn:substring(a.biaoti, 0, 20)}</a><span>${fn:substring(a.addtime, 0, 10)}</span> </li>
        </c:forEach>
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
<%-- <div class="section proBg">
  <div class="inProBd">
    <div class="Ttitle2">案例展示 <span>Cases</span>
      <div class="Tmore2"> <a href="">查看更多 +</a> </div>
    </div>
    <!-- end Ttitle-->
    <div class="proListPic" >
      <ul class="clear-fix">
        <li>
          <div class="pic"><img src="http://www.jsdaima.com/Uploads/webpage/201707/1499223200/images/c1.jpg" width="288" height="230" alt=""  class="PicAuto"></div>
          <div class="title">职业保姆</div>
          <div class="intro"> <a href=""> <span>职业保姆</span>
            <p>家政服务是指将部分家庭事务社会化、职业化、市场化，属于民生范畴。由社会专业机构、社区机构、非盈利组织、家政服务公司和专业家政服务人员来承担，帮助家庭与社会互动，构建家庭规范，提高家庭生活质量，以此促进整个社会的发展。</p>
            </a> </div>
        </li>
        <li>
          <div class="pic"><img src="http://www.jsdaima.com/Uploads/webpage/201707/1499223200/images/c2.jpg" width="288" height="230" alt=""  class="PicAuto"></div>
          <div class="title">涉外保姆</div>
          <div class="intro"> <a href=""> <span>涉外保姆</span>
            <p>家政服务是指将部分家庭事务社会化、职业化、市场化，属于民生范畴。由社会专业机构、社区机构、非盈利组织、家政服务公司和专业家政服务人员来承担，帮助家庭与社会互动，构建家庭规范，提高家庭生活质量，以此促进整个社会的发展。</p>
            </a> </div>
        </li>
        <li>
          <div class="pic"><img src="http://www.jsdaima.com/Uploads/webpage/201707/1499223200/images/c3.jpg" width="288" height="230" alt=""  class="PicAuto"></div>
          <div class="title">育婴早教</div>
          <div class="intro"> <a href=""> <span>育婴早教</span>
            <p>家政服务是指将部分家庭事务社会化、职业化、市场化，属于民生范畴。由社会专业机构、社区机构、非盈利组织、家政服务公司和专业家政服务人员来承担，帮助家庭与社会互动，构建家庭规范，提高家庭生活质量，以此促进整个社会的发展。</p>
            </a> </div>
        </li>
        <li>
          <div class="pic"><img src="http://www.jsdaima.com/Uploads/webpage/201707/1499223200/images/c4.jpg" width="288" height="230" alt=""  class="PicAuto"></div>
          <div class="title">幼教保育</div>
          <div class="intro"> <a href=""> <span>幼教保育</span>
            <p>家政服务是指将部分家庭事务社会化、职业化、市场化，属于民生范畴。由社会专业机构、社区机构、非盈利组织、家政服务公司和专业家政服务人员来承担，帮助家庭与社会互动，构建家庭规范，提高家庭生活质量，以此促进整个社会的发展。</p>
            </a> </div>
        </li>
        <li>
          <div class="pic"><img src="http://www.jsdaima.com/Uploads/webpage/201707/1499223200/images/c5.jpg" width="288" height="230" alt=""  class="PicAuto"></div>
          <div class="title">家教外教</div>
          <div class="intro"> <a href=""> <span>家教外教</span>
            <p>家政服务是指将部分家庭事务社会化、职业化、市场化，属于民生范畴。由社会专业机构、社区机构、非盈利组织、家政服务公司和专业家政服务人员来承担，帮助家庭与社会互动，构建家庭规范，提高家庭生活质量，以此促进整个社会的发展。</p>
            </a> </div>
        </li>
        <li>
          <div class="pic"><img src="http://www.jsdaima.com/Uploads/webpage/201707/1499223200/images/c6.jpg" width="288" height="230" alt=""  class="PicAuto"></div>
          <div class="title">高级管家</div>
          <div class="intro"> <a href=""> <span>家政服务</span>
            <p>家政服务是指将部分家庭事务社会化、职业化、市场化，属于民生范畴。由社会专业机构、社区机构、非盈利组织、家政服务公司和专业家政服务人员来承担，帮助家庭与社会互动，构建家庭规范，提高家庭生活质量，以此促进整个社会的发展。</p>
            </a> </div>
        </li>
        <li>
          <div class="pic"><img src="http://www.jsdaima.com/Uploads/webpage/201707/1499223200/images/c1.jpg" width="288" height="230" alt=""  class="PicAuto"></div>
          <div class="title">家政服务</div>
          <div class="intro"> <a href=""> <span>家政服务</span>
            <p>家政服务是指将部分家庭事务社会化、职业化、市场化，属于民生范畴。由社会专业机构、社区机构、非盈利组织、家政服务公司和专业家政服务人员来承担，帮助家庭与社会互动，构建家庭规范，提高家庭生活质量，以此促进整个社会的发展。</p>
            </a> </div>
        </li>
        <li>
          <div class="pic"><img src="http://www.jsdaima.com/Uploads/webpage/201707/1499223200/images/c2.jpg" width="288" height="230" alt=""  class="PicAuto"></div>
          <div class="title">家政服务</div>
          <div class="intro"> <a href=""> <span>家政服务</span>
            <p>家政服务是指将部分家庭事务社会化、职业化、市场化，属于民生范畴。由社会专业机构、社区机构、非盈利组织、家政服务公司和专业家政服务人员来承担，帮助家庭与社会互动，构建家庭规范，提高家庭生活质量，以此促进整个社会的发展。</p>
            </a> </div>
        </li>
		
      </ul>
    </div> --%>
    <script>
	$(".proListPic ul li").hover(function(){
  	 var $abc = $(this);
  	 $abc.find(".title").stop(true,true).slideUp("fast",function(){$abc.find(".intro").slideDown("fast");})  
  },function(){
  	 var $abc = $(this);
  	 $abc.find(".title").stop(true,true);
     $abc.find(".intro").stop(true,true).slideUp("fast",function(){$abc.find(".title").slideDown("fast");})
  })
  </script>
    <!-- end proListPic-->
  </div>
  <!-- end inProBd-->
</div>
<div class="section">
  <div class="company clear-fix">
    <div class="Ttitle">关于我们 <span>about us</span>
      <div class="Tmore"> <a href="">更多 +</a> </div>
    </div>
    <!-- end Ttitle-->
    <div class="companyCon">
      <div class="companyPic"><img src="qtimages/about.jpg" alt="" width="190" height="190" class="PicAuto"></div>
      <div class="companyConFont"> <span>关于我们</span>
	  <%=connDbBean.readzd("dx","content","leibie","关于我们")%>
	  </div>
      <!-- end companyConFont -->
    </div>
    <!-- end companyCon -->
  </div>
  <!-- end company -->
</div>

<jsp:include page="qtdown.jsp"></jsp:include>
<!-- end footer-->
</body>
</html>
