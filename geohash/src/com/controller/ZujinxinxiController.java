package com.controller;

import java.io.File;
import java.io.IOException;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Zujinxinxi;
import com.server.ZujinxinxiServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class ZujinxinxiController {
	@Resource
	private ZujinxinxiServer zujinxinxiService;


   
	@RequestMapping("addZujinxinxi.do")
	public String addZujinxinxi(HttpServletRequest request,Zujinxinxi zujinxinxi,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		zujinxinxi.setAddtime(time.toString().substring(0, 19));
		zujinxinxiService.add(zujinxinxi);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "zujinxinxiList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:zujinxinxiList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateZujinxinxi.do")
	public String doUpdateZujinxinxi(int id,ModelMap map,Zujinxinxi zujinxinxi){
		zujinxinxi=zujinxinxiService.getById(id);
		map.put("zujinxinxi", zujinxinxi);
		return "zujinxinxi_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("zujinxinxiDetail.do")
	public String zujinxinxiDetail(int id,ModelMap map,Zujinxinxi zujinxinxi){
		zujinxinxi=zujinxinxiService.getById(id);
		map.put("zujinxinxi", zujinxinxi);
		return "zujinxinxi_detail";
	}
//	前台详细
	@RequestMapping("zjxxDetail.do")
	public String zjxxDetail(int id,ModelMap map,Zujinxinxi zujinxinxi){
		zujinxinxi=zujinxinxiService.getById(id);
		map.put("zujinxinxi", zujinxinxi);
		return "zujinxinxidetail";
	}
//	
	@RequestMapping("updateZujinxinxi.do")
	public String updateZujinxinxi(int id,ModelMap map,Zujinxinxi zujinxinxi,HttpServletRequest request,HttpSession session){
		zujinxinxiService.update(zujinxinxi);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:zujinxinxiList.do";
	}

//	分页查询
	@RequestMapping("zujinxinxiList.do")
	public String zujinxinxiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zujinxinxi zujinxinxi, String hetongbianhao, String fangyuanbianhao, String faburen, String chengzuren, String yuezujin, String zujinyuefen1,String zujinyuefen2, String beizhushuoming, String issh, String iszf){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(hetongbianhao==null||hetongbianhao.equals("")){pmap.put("hetongbianhao", null);}else{pmap.put("hetongbianhao", hetongbianhao);}
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}
		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}
		if(chengzuren==null||chengzuren.equals("")){pmap.put("chengzuren", null);}else{pmap.put("chengzuren", chengzuren);}
		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}
		if(zujinyuefen1==null||zujinyuefen1.equals("")){pmap.put("zujinyuefen1", null);}else{pmap.put("zujinyuefen1", zujinyuefen1);}
		if(zujinyuefen2==null||zujinyuefen2.equals("")){pmap.put("zujinyuefen2", null);}else{pmap.put("zujinyuefen2", zujinyuefen2);}
		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}
		
		int total=zujinxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zujinxinxi> list=zujinxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zujinxinxi_list";
	}
	
	@RequestMapping("zujinxinxiList3.do")
	public String zujinxinxiList3(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zujinxinxi zujinxinxi, String hetongbianhao, String fangyuanbianhao, String faburen, String chengzuren, String yuezujin, String zujinyuefen1,String zujinyuefen2, String beizhushuoming, String issh, String iszf,HttpServletRequest request){
		/*if(session.getAttribute("user")==null){
			return "login";
		}*/
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		pmap.put("faburen", (String)request.getSession().getAttribute("username"));
		if(hetongbianhao==null||hetongbianhao.equals("")){pmap.put("hetongbianhao", null);}else{pmap.put("hetongbianhao", hetongbianhao);}
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}
		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}
		if(zujinyuefen1==null||zujinyuefen1.equals("")){pmap.put("zujinyuefen1", null);}else{pmap.put("zujinyuefen1", zujinyuefen1);}
		if(zujinyuefen2==null||zujinyuefen2.equals("")){pmap.put("zujinyuefen2", null);}else{pmap.put("zujinyuefen2", zujinyuefen2);}
		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}
		
		
		int total=zujinxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zujinxinxi> list=zujinxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zujinxinxi_list3";
	}
	@RequestMapping("zujinxinxiList2.do")
	public String zujinxinxiList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zujinxinxi zujinxinxi, String hetongbianhao, String fangyuanbianhao, String faburen, String chengzuren, String yuezujin, String zujinyuefen1,String zujinyuefen2, String beizhushuoming, String issh, String iszf,HttpServletRequest request){
		/*if(session.getAttribute("user")==null){
			return "login";
		}*/
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		pmap.put("chengzuren", (String)request.getSession().getAttribute("username"));
		if(hetongbianhao==null||hetongbianhao.equals("")){pmap.put("hetongbianhao", null);}else{pmap.put("hetongbianhao", hetongbianhao);}
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}
		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}
		if(zujinyuefen1==null||zujinyuefen1.equals("")){pmap.put("zujinyuefen1", null);}else{pmap.put("zujinyuefen1", zujinyuefen1);}
		if(zujinyuefen2==null||zujinyuefen2.equals("")){pmap.put("zujinyuefen2", null);}else{pmap.put("zujinyuefen2", zujinyuefen2);}
		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}
		
		
		int total=zujinxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zujinxinxi> list=zujinxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zujinxinxi_list2";
	}
	
	
	@RequestMapping("zjxxList.do")
	public String zjxxList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zujinxinxi zujinxinxi, String hetongbianhao, String fangyuanbianhao, String faburen, String chengzuren, String yuezujin, String zujinyuefen1,String zujinyuefen2, String beizhushuoming, String issh, String iszf){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(hetongbianhao==null||hetongbianhao.equals("")){pmap.put("hetongbianhao", null);}else{pmap.put("hetongbianhao", hetongbianhao);}
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}
		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}
		if(chengzuren==null||chengzuren.equals("")){pmap.put("chengzuren", null);}else{pmap.put("chengzuren", chengzuren);}
		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}
		if(zujinyuefen1==null||zujinyuefen1.equals("")){pmap.put("zujinyuefen1", null);}else{pmap.put("zujinyuefen1", zujinyuefen1);}
		if(zujinyuefen2==null||zujinyuefen2.equals("")){pmap.put("zujinyuefen2", null);}else{pmap.put("zujinyuefen2", zujinyuefen2);}
		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}
		
		int total=zujinxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zujinxinxi> list=zujinxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zujinxinxilist";
	}
	
	@RequestMapping("deleteZujinxinxi.do")
	public String deleteZujinxinxi(int id,HttpServletRequest request){
		zujinxinxiService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:zujinxinxiList.do";
	}
	
	
}
