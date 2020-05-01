package com.ftf.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ftf.beans.ErWeiMa;
import com.ftf.beans.User;
import com.ftf.common.QRCodeUtils;
import com.ftf.service.UserUpdateServiceImpl;



@RequestMapping("/userUpdateController")
@Controller
public class UserUpdateController {
	
	@Autowired
	private UserUpdateServiceImpl userUpdateServiceImpl;
	
//-------------------个人中心的修改信息-----------------------------------------	
	@RequestMapping("/modify")
	public ModelAndView modify(HttpServletRequest request, HttpServletResponse response){
		String savePath = request.getSession().getServletContext().getRealPath("/images");
        File file = new File(savePath);
        if (!file.exists() && !file.isDirectory()) {
            System.out.println(savePath+"目录不存在，需要创建");
            file.mkdir();
        }
        String message = "";
        String pic = "";
        User user = null;
        String name = "";
        String password = "";
        String email = "";
        Object id1 = null;
        
        try{
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8"); 
            if(!ServletFileUpload.isMultipartContent(request)){
              return new ModelAndView("redirect:/userLoginController/persons");
            }
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            
            List<FileItem> list = upload.parseRequest(request);
            
             name = list.get(1).getString("UTF-8");
             password = list.get(2).getString("UTF-8");
             email = list.get(3).getString("UTF-8");
             id1 = request.getSession().getAttribute("id");
     
                    
            System.out.println("---个人资料修改信息----");
            System.out.println("修改的name-"+name);
            System.out.println("修改的id-"+id1);
            System.out.println("修改的password-"+password);
            System.out.println("修改的email-"+email);
            System.out.println("---个人资料修改信息----");
            System.out.println();
 
            for(FileItem item : list){
                if(item.isFormField()){
                }else{
                	String filename = item.getName();
                    if(filename==null || filename.trim().equals("")){
                        continue;
                    }
                    filename = filename.substring(filename.lastIndexOf("\\")+1);
                    InputStream in = item.getInputStream();
                    FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
                    pic = filename;
                    byte buffer[] = new byte[1024];
                    int len = 0;
                    while((len=in.read(buffer))>0){
                        out.write(buffer, 0, len);
                    }     
                    in.close();             
                    out.close();
                    item.delete();
                    message = "文件上传成功！";
                }
            }
        }catch (Exception e) {
            message= "文件上传失败！";
            e.printStackTrace();           
        }
        String photo = ("../images/"+pic);
        System.out.println("用户修改的头像路径-"+photo);  
        int id = Integer.parseInt(String.valueOf(id1));
        if(pic.equals("images/")){
        	System.out.println(1);
        	pic = "../images/1.png";
        	user = new User(id, name, password, email,pic);
        }else{
        	System.out.println(2);
        	user = new User(id, name, password, email, photo);
        }
        
        userUpdateServiceImpl.updateUser(user);
        
        return new ModelAndView("redirect:/userLoginController/persons");
        }	
//-------------------测试使用------------------------------------------------
	@RequestMapping("/test")
	public ModelAndView test(){	
		return new ModelAndView("redirect:/userLoginController/daohang");
	}
//-------------------二维码信息获取------------------------------------------------
	@RequestMapping("/erweima")
	public void erweima(HttpServletRequest request, HttpServletResponse response){	
     ErWeiMa erWeiMa = userUpdateServiceImpl.erWeiMa(1);    
	  String content = erWeiMa.getContent(); 
      QRCodeUtils encoder = new QRCodeUtils();  
      encoder.encoderQRCoder(content, response);  		
	}
}
