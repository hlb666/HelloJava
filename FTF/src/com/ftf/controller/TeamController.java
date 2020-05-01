package com.ftf.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ftf.beans.Search;
import com.ftf.beans.Team;
import com.ftf.common.Geohash;
import com.ftf.service.TeamServiceImpl;

@RequestMapping("/teamController")
@Controller
public class TeamController {
	
	@Autowired
	public TeamServiceImpl teamServiceImpl;
	
	@RequestMapping("/teaminsert")
	public String teamlunch(HttpServletRequest request,HttpServletResponse response){
		String savePath = request.getSession().getServletContext().getRealPath("/images");
        File file = new File(savePath);
        if (!file.exists() && !file.isDirectory()) {
            System.out.println(savePath+"目录不存在，需要创建");
            file.mkdir();
        }
        String message = "";
        String pic = "";
        String title = "";
        String type = "";
        String name = "";
        Object uid1 = null;
        String date = null;
        String content=null;
        int tid = 0;
        String lng = null;
        String lat = null;
        Team team;
        try{
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8"); 
            if(!ServletFileUpload.isMultipartContent(request)){
              return "";
            }
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            
            List<FileItem> list = upload.parseRequest(request);
            
             title = list.get(1).getString("UTF-8");
             type = list.get(2).getString("UTF-8");
             name = list.get(3).getString("UTF-8");
             date = list.get(4).getString("UTF-8");
             lng = "118.3564156294";
             lat = "31.2844878810";
             content = list.get(7).getString("UTF-8");
             uid1 = request.getSession().getAttribute("id");
     
             if(type.equals("运动")){
            	tid=1;           	 
             }else if(type.equals("登山")){
            	 tid=2;             	 
             } else if(type.equals("休闲")){
            	 tid=4; 
             }else if(type.equals("娱乐")){
            	 tid=3; 
             }      
            System.out.println("---发起队伍的资料信息----");
            System.out.println("title-"+title);
            System.out.println("type-"+type);
            System.out.println("name-"+name);
            System.out.println("date-"+date);
            System.out.println("lng-"+lng);
            System.out.println("lat-"+lat);
            System.out.println("uid-"+uid1);
            System.out.println("---发起队伍的资料信息----");
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
        int uid = Integer.parseInt(String.valueOf(uid1));
        BigDecimal bigDecimalLng = new BigDecimal(lng);
        BigDecimal bigDecimalLat = new BigDecimal(lat);
        double douLng = Double.parseDouble(lng);
        double douLat = Double.parseDouble(lat);
        Geohash geohash = new Geohash();
        String geocode = geohash.encode(douLat, douLng);
        if(photo.equals("../images/")){
        	System.out.println(1);
        	pic = "../images/four.jpg";
        	team = new Team(pic, title, uid, tid, date, content, bigDecimalLng, bigDecimalLat,geocode);
        	teamServiceImpl.insert(team);
        }else{      	
        	team = new Team(photo, title, uid, tid, date, content, bigDecimalLng, bigDecimalLat,geocode);
        	teamServiceImpl.insert(team);
        }
        return "WEB-INF/pages/TeamLaunch";
	}
	
	
	@RequestMapping("/sport")
	public String sport(){
		
		return "WEB-INF/pages/Sport";
	}
	@RequestMapping("/search")
	public String search(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");	
		String searched=request.getParameter("searched");
		System.out.println(searched);
		Object uid1=request.getSession().getAttribute("id");
		int uid=Integer.parseInt(String.valueOf(uid1));
		System.out.println(uid);
		Search search=new Search(searched, uid);
		teamServiceImpl.search(search);
		return "WEB-INF/pages/Search";
	}


	@RequestMapping(value="/getSea")
	@ResponseBody
	public void getSea(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");//第一句，设置服务器端编码
		response.setContentType("text/html;charset=utf-8");//第二句，设置浏览器端解码
		Search search=new Search(); 	
		Object uid1=request.getSession().getAttribute("id");
		int uid=Integer.parseInt(String.valueOf(uid1));
		search.setUid(uid);
		List<Search> list=teamServiceImpl.getSea(search);
		System.out.println(list.size());
		Object[] array = list.toArray(new Object[list.size()]);
		String json=JSONArray.fromObject(array).toString();	     
		System.out.println(json);	 			
		//响应前台
		response.setContentType("textml;charset=utf-8");
		response.getWriter().append(json);

	}
	
}
