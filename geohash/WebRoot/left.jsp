<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<div class="vernav2 iconmenu">
    	<ul>
        	<li class="current"><a href="#formsub" class="editor">系统用户管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub">
               		<li><a href="allusers_add.jsp" target="main">管理员帐号添加</a></li>
					<li><a href="allusersList.do" target="main">管理员帐号查询</a></li>
                    <li><a href="yonghuzhuceList.do" target="main">注册用户管理</a></li>
                    <li><a href="mod.jsp" target="main">修改密码</a></li>
                </ul>
            </li>
			
			<li><a href="#formsub2" class="elements">新闻公告管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub2">
               		<li><a href="xinwentongzhi_add.jsp?lb=站内新闻" target="main">站内新闻添加</a></li>
                    <li><a href="xinwentongzhiList.do?lb=站内新闻" target="main">站内新闻查询</a></li>
               		<li><a href="xinwentongzhi_add.jsp?lb=行业资讯" target="main">行业资讯添加</a></li>
                    <li><a href="xinwentongzhiList.do?lb=行业资讯" target="main">行业资讯查询</a></li>
                </ul>
            </li>
			
			<li><a href="#formsub3" class="gallery">变幻图管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub3">
               		<li><a href="xinwentongzhi_add.jsp?lb=变幻图" target="main">变幻图添加</a></li>
                    <li><a href="xinwentongzhiList.do?lb=变幻图" target="main">变幻图查询</a></li>
                </ul>
            </li>
			
			<%-- <li><a href="#formsub4" class="elements">站内新闻管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub4">
               		<li><a href="xinwentongzhi_add.jsp" target="main">站内新闻添加</a></li>
                    <li><a href="xinwentongzhiList.do" target="main">站内新闻查询</a></li>
                </ul>
            </li> --%>
			
			<li><a href="#formsub5" class="widgets">房源信息管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub5">
               		<li><a href="fangyuanxinxi_add.jsp" target="main">房源信息添加</a></li>
                    <li><a href="fangyuanxinxiList.do" target="main">房源信息查询</a></li>
                </ul>
            </li>
			
			<li><a href="#formsub6" class="calendar">租房管理中心</a>
            	<span class="arrow"></span>
            	<ul id="formsub6">
               		<li><a href="zufangjiluList.do" target="main">租房记录管理</a></li>
                    <li><a href="zufanghetongList.do" target="main">租房合同管理</a></li>
                    <li><a href="zujinxinxiList.do" target="main">租金信息管理</a></li>
                </ul>
            </li>
			
			<%-- <li><a href="#formsub7" class="support">站内新闻管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub7">
               		<li><a href="xinwentongzhi_add.jsp" target="main">站内新闻添加</a></li>
                    <li><a href="xinwentongzhiList.do" target="main">站内新闻查询</a></li>
                </ul>
            </li>
			
			
			<li><a href="#formsub8" class="typo">站内新闻管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub8">
               		<li><a href="xinwentongzhi_add.jsp" target="main">站内新闻添加</a></li>
                    <li><a href="xinwentongzhiList.do" target="main">站内新闻查询</a></li>
                </ul>
            </li>
			
			<li><a href="#formsub9" class="tables">站内新闻管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub9">
               		<li><a href="xinwentongzhi_add.jsp" target="main">站内新闻添加</a></li>
                    <li><a href="xinwentongzhiList.do" target="main">站内新闻查询</a></li>
                </ul>
            </li>
			
			<li><a href="#formsub10" class="buttons">站内新闻管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub10">
               		<li><a href="xinwentongzhi_add.jsp" target="main">站内新闻添加</a></li>
                    <li><a href="xinwentongzhiList.do" target="main">站内新闻查询</a></li>
                </ul>
            </li>
			
			<li><a href="#formsub11" class="error">站内新闻管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub11">
               		<li><a href="xinwentongzhi_add.jsp" target="main">站内新闻添加</a></li>
                    <li><a href="xinwentongzhiList.do" target="main">站内新闻查询</a></li>
                </ul>
            </li>
			
			<li><a href="#formsub12" class="gallery">站内新闻管理</a>
            	<span class="arrow"></span>
            	<ul id="formsub12">
               		<li><a href="xinwentongzhi_add.jsp" target="main">站内新闻添加</a></li>
                    <li><a href="xinwentongzhiList.do" target="main">站内新闻查询</a></li>
                </ul>
            </li> --%>
			
            <!--<li><a href="filemanager.html" class="gallery">File Manager</a></li>-->
          
           
            <li ><a href="#addons" class="addons">系统管理</a>
            	<span class="arrow"></span>
            	<ul id="addons">
               		<li><a href="youqinglianjie_add.jsp" target="main">友情连接添加</a></li>
                    <li><a href="youqinglianjieList.do" target="main">友情连接查询</a></li>
                    <li><a href="liuyanbanList.do" target="main">留言管理</a></li>
                    <li><a href="dx.jsp?lb=关于我们" target="main">关于我们</a></li>
					<li><a href="dx.jsp?lb=系统公告" target="main">系统公告</a></li>
                </ul>
            </li>
        </ul>
        <a class="togglemenu"></a>
        <br /><br />
    </div>