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

import com.entity.Zufangjilu;
import com.server.ZufangjiluServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class ZufangjiluController {
	@Resource
	private ZufangjiluServer zufangjiluService;


   
	@RequestMapping("addZufangjilu.do")
	public String addZufangjilu(HttpServletRequest request,Zufangjilu zufangjilu,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		zufangjilu.setAddtime(time.toString().substring(0, 19));
		zufangjiluService.add(zufangjilu);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "zufangjiluList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:zufangjiluList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateZufangjilu.do")
	public String doUpdateZufangjilu(int id,ModelMap map,Zufangjilu zufangjilu){
		zufangjilu=zufangjiluService.getById(id);
		map.put("zufangjilu", zufangjilu);
		return "zufangjilu_updt";
	}
	
	
	
	@RequestMapping("doUpdateZufangjilulb.do")
	public String doUpdateZufangjilulb(int id,ModelMap map,Zufangjilu zufangjilu){
		zufangjilu=zufangjiluService.getById(id);
		map.put("zufangjilu", zufangjilu);
		return "zufangjilu_updtlb";
	}
	
@RequestMapping("updateZufangjilulb.do")
	public String updateZufangjilulb(int id,ModelMap map,Zufangjilu zufangjilu){
		zufangjiluService.updatelb(zufangjilu);
		return "redirect:zufangjiluList.do";
	}
	
//	后台详细
	@RequestMapping("zufangjiluDetail.do")
	public String zufangjiluDetail(int id,ModelMap map,Zufangjilu zufangjilu){
		zufangjilu=zufangjiluService.getById(id);
		map.put("zufangjilu", zufangjilu);
		return "zufangjilu_detail";
	}
//	前台详细
	@RequestMapping("zfjlDetail.do")
	public String zfjlDetail(int id,ModelMap map,Zufangjilu zufangjilu){
		zufangjilu=zufangjiluService.getById(id);
		map.put("zufangjilu", zufangjilu);
		return "zufangjiludetail";
	}
//	
	@RequestMapping("updateZufangjilu.do")
	public String updateZufangjilu(int id,ModelMap map,Zufangjilu zufangjilu,HttpServletRequest request,HttpSession session){
		zufangjiluService.update(zufangjilu);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:zufangjiluList.do";
	}

//	分页查询
	@RequestMapping("zufangjiluList.do")
	public String zufangjiluList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zufangjilu zufangjilu, String fangyuanbianhao, String fangyuanmingcheng, String faburen, String yuezujin, String yuyuekanfang1,String yuyuekanfang2, String beizhushuoming, String chengzuren, String fangdonghuifu, String issh){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}		if(yuyuekanfang1==null||yuyuekanfang1.equals("")){pmap.put("yuyuekanfang1", null);}else{pmap.put("yuyuekanfang1", yuyuekanfang1);}		if(yuyuekanfang2==null||yuyuekanfang2.equals("")){pmap.put("yuyuekanfang2", null);}else{pmap.put("yuyuekanfang2", yuyuekanfang2);}		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}		if(chengzuren==null||chengzuren.equals("")){pmap.put("chengzuren", null);}else{pmap.put("chengzuren", chengzuren);}		if(fangdonghuifu==null||fangdonghuifu.equals("")){pmap.put("fangdonghuifu", null);}else{pmap.put("fangdonghuifu", fangdonghuifu);}		
		int total=zufangjiluService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zufangjilu> list=zufangjiluService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zufangjilu_list";
	}
	
	@RequestMapping("zufangjiluList3.do")
	public String zufangjiluList3(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zufangjilu zufangjilu, String fangyuanbianhao, String fangyuanmingcheng, String faburen, String yuezujin, String yuyuekanfang1,String yuyuekanfang2, String beizhushuoming, String chengzuren, String fangdonghuifu, String issh,HttpServletRequest request){
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
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}		if(yuyuekanfang1==null||yuyuekanfang1.equals("")){pmap.put("yuyuekanfang1", null);}else{pmap.put("yuyuekanfang1", yuyuekanfang1);}		if(yuyuekanfang2==null||yuyuekanfang2.equals("")){pmap.put("yuyuekanfang2", null);}else{pmap.put("yuyuekanfang2", yuyuekanfang2);}		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}		if(fangdonghuifu==null||fangdonghuifu.equals("")){pmap.put("fangdonghuifu", null);}else{pmap.put("fangdonghuifu", fangdonghuifu);}		
		
		int total=zufangjiluService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zufangjilu> list=zufangjiluService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zufangjilu_list3";
	}	@RequestMapping("zufangjiluList2.do")
	public String zufangjiluList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zufangjilu zufangjilu, String fangyuanbianhao, String fangyuanmingcheng, String faburen, String yuezujin, String yuyuekanfang1,String yuyuekanfang2, String beizhushuoming, String chengzuren, String fangdonghuifu, String issh,HttpServletRequest request){
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
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}		if(yuyuekanfang1==null||yuyuekanfang1.equals("")){pmap.put("yuyuekanfang1", null);}else{pmap.put("yuyuekanfang1", yuyuekanfang1);}		if(yuyuekanfang2==null||yuyuekanfang2.equals("")){pmap.put("yuyuekanfang2", null);}else{pmap.put("yuyuekanfang2", yuyuekanfang2);}		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}		if(fangdonghuifu==null||fangdonghuifu.equals("")){pmap.put("fangdonghuifu", null);}else{pmap.put("fangdonghuifu", fangdonghuifu);}		
		
		int total=zufangjiluService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zufangjilu> list=zufangjiluService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zufangjilu_list2";
	}	
	
	@RequestMapping("zfjlList.do")
	public String zfjlList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zufangjilu zufangjilu, String fangyuanbianhao, String fangyuanmingcheng, String faburen, String yuezujin, String yuyuekanfang1,String yuyuekanfang2, String beizhushuoming, String chengzuren, String fangdonghuifu, String issh){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}		if(yuyuekanfang1==null||yuyuekanfang1.equals("")){pmap.put("yuyuekanfang1", null);}else{pmap.put("yuyuekanfang1", yuyuekanfang1);}		if(yuyuekanfang2==null||yuyuekanfang2.equals("")){pmap.put("yuyuekanfang2", null);}else{pmap.put("yuyuekanfang2", yuyuekanfang2);}		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}		if(chengzuren==null||chengzuren.equals("")){pmap.put("chengzuren", null);}else{pmap.put("chengzuren", chengzuren);}		if(fangdonghuifu==null||fangdonghuifu.equals("")){pmap.put("fangdonghuifu", null);}else{pmap.put("fangdonghuifu", fangdonghuifu);}		
		int total=zufangjiluService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zufangjilu> list=zufangjiluService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zufangjilulist";
	}
	
	@RequestMapping("deleteZufangjilu.do")
	public String deleteZufangjilu(int id,HttpServletRequest request){
		zufangjiluService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:zufangjiluList.do";
	}
	
	
}
