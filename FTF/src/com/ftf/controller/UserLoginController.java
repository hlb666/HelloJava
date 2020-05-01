package com.ftf.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ftf.beans.Admin;
import com.ftf.beans.Team;
import com.ftf.beans.User;
import com.ftf.common.VerifyCode;
import com.ftf.dao.TeamMapper;
import com.ftf.service.TeamServiceImpl;
import com.ftf.service.UserLoginServiceImpl;

@RequestMapping("/userLoginController")
@Controller
public class UserLoginController {
	
	@Autowired
	private UserLoginServiceImpl userLoginServiceImpl;
	@Autowired
	private TeamServiceImpl teamServiceImpl ;
	

	
	//-------------进行注册----------------------------------------------
	@RequestMapping("/add")
	public String add(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");		
		String username = request.getParameter("username");
		String password = request.getParameter("password");		
		String email = request.getParameter("email");		
		String pwd = KL(password);
		System.out.println(username);
		System.out.println(password);
		System.out.println(email);
		User user = new User(username, pwd, email);	
		userLoginServiceImpl.add(user);
		request.setAttribute("MSG","注册成功");
		return "Regist";
	}
	
	//-------------进行注册的用户名验证----------------------------------------------
	@RequestMapping("/toAjax")
	public void ajax(HttpServletRequest request,HttpServletResponse response) throws IOException{		
		String username = request.getParameter("username");
		System.out.println("注册验证账户名-"+username);
		User user = userLoginServiceImpl.check(username);
		if(user!=null){
			response.getWriter().print("<font color='red'>User name already exists</font>");
		}else{
			response.getWriter().print("<font color='green'>User name available</font>");
		}		
	}
	
	//-------------邮箱找回密码----------------------------------------------
	
	@RequestMapping("/findPassword")
	public String findPassword(HttpServletRequest request,HttpServletResponse response){
		  String email=request.getParameter("email");
		  System.out.println("找回密码的邮箱-"+email);
		  User user1 = new User();
		  user1.setEmail(email);
		  User user = userLoginServiceImpl.getPassword(user1);

		  String username = user.getUsername();
		  String password = user.getPassword();
		  String pwd  = JM(password);
		  System.out.println(pwd);
          System.out.println("---------邮箱找回密码-------------------");
		  		   
		    Properties props = new Properties();  
	        // 开启debug调试  
	        props.setProperty("mail.debug", "true");  
	        // 发送服务器需要身份验证  
	        props.setProperty("mail.smtp.auth", "true");  
	        // 设置邮件服务器主机名  
	        props.setProperty("mail.host", "smtp.163.com");  
	        // 发送邮件协议名称  
	        props.setProperty("mail.transport.protocol", "smtp");  
	        // 设置环境信息  
	        Session session = Session.getInstance(props);  
	          
	        // 创建邮件对象  
	        Message msg = new MimeMessage(session);  
	        try {
				msg.setSubject("邻约团队");
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  	      	        
	        try {
	        	// 设置邮件内容  
		        msg.setText("您的"+"账号:"+username+"密码："+pwd+"已经找回，请返回登录");  
		        // 设置发件人  
		        msg.setFrom(new InternetAddress("ma280165660@163.com"));  		          
		        Transport transport = session.getTransport();  
		        // 连接邮件服务器  
		        transport.connect("ma280165660@163.com", "HLB123");  
		        // 发送邮件  
		        transport.sendMessage(msg, new Address[] {new InternetAddress(email)});  
		        // 关闭连接  
		        transport.close();  
	        } catch (Exception e) {
				e.printStackTrace();
			}
	        System.out.println("---------邮箱找回密码-------------------");
	        request.setAttribute("MSG1", "密码已找回");	
		    return "Retrieve";
	}	
	 String text="";
	
	//-------------验证码生成-------------------------------------------------
	@RequestMapping("/yanzhengma")
	public void yanzhengma(HttpServletRequest request,HttpServletResponse response) throws IOException{
	  //创建对象
       VerifyCode vc = new VerifyCode();
        //获取图片对象
        BufferedImage bi = vc.getImage();
        //获得图片的文本内容
         text = vc.getText();
        // 将系统生成的文本内容保存到session中
        request.getSession().setAttribute("text", text);
        //向浏览器输出图片
        vc.output(bi, response.getOutputStream());	
	}
	
	//-------------登录验证-------------------------------------------------
	
	@RequestMapping("/login")
	public String Login(HttpServletRequest request,HttpServletResponse response){
	 
	 String username = request.getParameter("username");
	 String password = request.getParameter("password");
	 String code = request.getParameter("image");
	 
//     VerifyCode vc = new VerifyCode();
//     String text = vc.getText();
     String pwd = KL(password);
    		 
	 User user = new User();
	 user.setUsername(username);
	 user.setPassword(pwd);
	 User user2 = userLoginServiceImpl.getExit(user);	 
	 System.out.println("-----登录相关信息-------");
     System.out.println(username);
     System.out.println(password);
     System.out.println(code);
     System.out.println(text);
     System.out.println("-----登录相关信息-------");
     String MSG3="";
     String PAGE="";
     if(code.equalsIgnoreCase(text)){
    	 if(user2!=null){ 
    		 int id = user2.getId();
    		 String user2name = user2.getUsername();
    		 request.getSession().setAttribute("id", id);
    		 request.getSession().setAttribute("user2name", user2name);
    		 List<Team> lists = userLoginServiceImpl.All();
    		 request.setAttribute("lists", lists);
    		 PAGE = "WEB-INF/pages/Main"; 
    	 }else{
    		 
    		MSG3="账号或密码错误";   		
    		PAGE = "Login"; 
    	 }
    	   	 
     }else{
    	 MSG3="验证码有误";
    	 PAGE = "Login"; 
     }	
     request.setAttribute("MSG3",MSG3);
		return PAGE;
	}
//-------------======>main-------------------------------
	@RequestMapping("/main")
	public String test(HttpServletRequest request){
		 List<Team> lists = userLoginServiceImpl.All();
		 request.setAttribute("lists", lists);
		return  "WEB-INF/pages/Main"; 
	}
//-------------=====》daohang-------------------------------
	@RequestMapping("/daohang")
	public String daohang(){
		return  "WEB-INF/pages/daohang"; 
	}
//-------------=====>login--------------------------------
	@RequestMapping("/logins")
	public String logins(){
		return  "Login"; 
	}
//-------------=====>Person--------------------------------
	@RequestMapping("/persons")
	public String persons(HttpServletRequest request){
		   Object id = request.getSession().getAttribute("id");		 		
		   User user = userLoginServiceImpl.getById(id);
		   String name = user.getUsername();
		   String email = user.getEmail();
		   String password = user.getPassword();
		   String pic = user.getPic();
		   System.out.println(pic);
		   request.setAttribute("name", name);
		   request.setAttribute("email", email);
		   request.setAttribute("password", password);
		   request.setAttribute("pic", pic);
           request.setAttribute("class1","active");          
           request.setAttribute("msg","PersonNews.jsp");
		return  "WEB-INF/pages/Person"; 
	}
//-------------=====>Person--------------------------------
	@RequestMapping("/searchs")
	public String searchs(){
		return  "WEB-INF/pages/Search"; 
	}
//-------------=====>Person--------------------------------
	@RequestMapping("/trysts")
	public String trysts(){		
		return  "WEB-INF/pages/Tryst"; 
	}
	
	//-------------=====>Person--------------------------------
		@RequestMapping("/test")
		public String trysts1(){		
			return  "WEB-INF/pages/Tryst"; 
		}
	
	//-------------=====>图灵界面--------------------------------
	@RequestMapping("/tuling")
	public String tuling(){		
		return  "WEB-INF/pages/TulingRoobt"; 
	}
	
	//-------------=====>Person--------------------------------
	@RequestMapping("/tulingc")
	public String tulingC(){		
		return  "WEB-INF/pages/tuling"; 
	}	
	
	
	
	//------------管理员登陆--------------
	@RequestMapping("/backLogin")
	public String backLogin(HttpServletRequest request){		
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Admin admin = new Admin(name, password);		
		Admin admin2 = userLoginServiceImpl.Login(admin);
		if(admin2!=null){			
			return "indexb"; 
		}		
		return "indexa"; 
	}
	
	//-------获取组队信息--------
	@ResponseBody
	@RequestMapping("/getzudui")
	public void getzudui(HttpServletRequest request, HttpServletResponse response) throws IOException{
		List<Team> lis = teamServiceImpl.getAlladmin();
		System.out.println(lis.size());		
		String json4=  JSONArray.fromObject(lis).toString();
		System.out.println(json4);
		response.setContentType("text/html;charset=utf-8");
		//响应输出
		response.getWriter().append(json4);	
	}
	
	//-------获取用户信息--------
	@ResponseBody
	@RequestMapping("/getUsers")
	public void getUsers(HttpServletRequest request, HttpServletResponse response) throws IOException{
		List<User> lists = teamServiceImpl.getAlluser();
		System.out.println(lists.size());		
		String json4=  JSONArray.fromObject(lists).toString();
		System.out.println(json4);
		response.setContentType("text/html;charset=utf-8");
		//响应输出
		response.getWriter().append(json4);	
	}
	
	//------------删除用户--------------
	@RequestMapping("/delectUser")
	public String delectUser(HttpServletRequest request,HttpServletResponse response){
		System.out.println("你好");
		
		String id1=request.getParameter("id");
		System.out.println(id1);
		Integer id = Integer.parseInt(id1);
		userLoginServiceImpl.delectUser(id);
		return "user";
		
	}
	//------------删除组队--------------
	@RequestMapping("/delectZudui")
	public String delectZudui(HttpServletRequest request,HttpServletResponse response){		
		
		String id1=request.getParameter("id");
		System.out.println(id1);
		Integer id = Integer.parseInt(id1);
		userLoginServiceImpl.delectZudui(id);
		return "type";	
	}
	
	
	 // 可逆的加密算法   
	 public static String KL(String inStr) {   
	  // String s = new String(inStr);   
	  char[] a = inStr.toCharArray();   
	  for (int i = 0; i < a.length; i++) {   
	   a[i] = (char) (a[i] ^ 't');   
	  }   
	  String s = new String(a);   
	  return s;   
	 }  

	 
	 /** 
	     * 加密解密算法 执行一次加密，两次解密 
	     */   
		 public static String JM(String inStr) {   
			  char[] a = inStr.toCharArray();   
			  for (int i = 0; i < a.length; i++) {   
			   a[i] = (char) (a[i] ^ 't');   
			  }   
			  String k = new String(a);   
			  return k;   
			 }  

	 
}
