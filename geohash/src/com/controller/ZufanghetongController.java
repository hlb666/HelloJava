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

import com.entity.Zufanghetong;
import com.server.ZufanghetongServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class ZufanghetongController {
	@Resource
	private ZufanghetongServer zufanghetongService;


   
	@RequestMapping("addZufanghetong.do")
	public String addZufanghetong(HttpServletRequest request,Zufanghetong zufanghetong,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		zufanghetong.setAddtime(time.toString().substring(0, 19));
		zufanghetongService.add(zufanghetong);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "zufanghetongList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:zufanghetongList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateZufanghetong.do")
	public String doUpdateZufanghetong(int id,ModelMap map,Zufanghetong zufanghetong){
		zufanghetong=zufanghetongService.getById(id);
		map.put("zufanghetong", zufanghetong);
		return "zufanghetong_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("zufanghetongDetail.do")
	public String zufanghetongDetail(int id,ModelMap map,Zufanghetong zufanghetong){
		zufanghetong=zufanghetongService.getById(id);
		map.put("zufanghetong", zufanghetong);
		return "zufanghetong_detail";
	}
//	前台详细
	@RequestMapping("zfhtDetail.do")
	public String zfhtDetail(int id,ModelMap map,Zufanghetong zufanghetong){
		zufanghetong=zufanghetongService.getById(id);
		map.put("zufanghetong", zufanghetong);
		return "zufanghetongdetail";
	}
//	
	@RequestMapping("updateZufanghetong.do")
	public String updateZufanghetong(int id,ModelMap map,Zufanghetong zufanghetong,HttpServletRequest request,HttpSession session){
		zufanghetongService.update(zufanghetong);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:zufanghetongList.do";
	}

//	分页查询
	@RequestMapping("zufanghetongList.do")
	public String zufanghetongList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zufanghetong zufanghetong, String hetongbianhao, String fangyuanbianhao, String fangyuanmingcheng, String faburen, String chengzuren, String yuezujin, String fuyuejin1,String fuyuejin2, String fukuanfangshi, String qizuriqi1,String qizuriqi2, String jiezhiriqi1,String jiezhiriqi2, String fujian, String beizhushuoming, String issh){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(hetongbianhao==null||hetongbianhao.equals("")){pmap.put("hetongbianhao", null);}else{pmap.put("hetongbianhao", hetongbianhao);}		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}		if(chengzuren==null||chengzuren.equals("")){pmap.put("chengzuren", null);}else{pmap.put("chengzuren", chengzuren);}		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}		if(fuyuejin1==null||fuyuejin1.equals("")){pmap.put("fuyuejin1", null);}else{pmap.put("fuyuejin1", fuyuejin1);}		if(fuyuejin2==null||fuyuejin2.equals("")){pmap.put("fuyuejin2", null);}else{pmap.put("fuyuejin2", fuyuejin2);}		if(fukuanfangshi==null||fukuanfangshi.equals("")){pmap.put("fukuanfangshi", null);}else{pmap.put("fukuanfangshi", fukuanfangshi);}		if(qizuriqi1==null||qizuriqi1.equals("")){pmap.put("qizuriqi1", null);}else{pmap.put("qizuriqi1", qizuriqi1);}		if(qizuriqi2==null||qizuriqi2.equals("")){pmap.put("qizuriqi2", null);}else{pmap.put("qizuriqi2", qizuriqi2);}		if(jiezhiriqi1==null||jiezhiriqi1.equals("")){pmap.put("jiezhiriqi1", null);}else{pmap.put("jiezhiriqi1", jiezhiriqi1);}		if(jiezhiriqi2==null||jiezhiriqi2.equals("")){pmap.put("jiezhiriqi2", null);}else{pmap.put("jiezhiriqi2", jiezhiriqi2);}		if(fujian==null||fujian.equals("")){pmap.put("fujian", null);}else{pmap.put("fujian", fujian);}		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}		
		int total=zufanghetongService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zufanghetong> list=zufanghetongService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zufanghetong_list";
	}
	
	@RequestMapping("zufanghetongList3.do")
	public String zufanghetongList3(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zufanghetong zufanghetong, String hetongbianhao, String fangyuanbianhao, String fangyuanmingcheng, String faburen, String chengzuren, String yuezujin, String fuyuejin1,String fuyuejin2, String fukuanfangshi, String qizuriqi1,String qizuriqi2, String jiezhiriqi1,String jiezhiriqi2, String fujian, String beizhushuoming, String issh,HttpServletRequest request){
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
		if(hetongbianhao==null||hetongbianhao.equals("")){pmap.put("hetongbianhao", null);}else{pmap.put("hetongbianhao", hetongbianhao);}		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}		if(fuyuejin1==null||fuyuejin1.equals("")){pmap.put("fuyuejin1", null);}else{pmap.put("fuyuejin1", fuyuejin1);}		if(fuyuejin2==null||fuyuejin2.equals("")){pmap.put("fuyuejin2", null);}else{pmap.put("fuyuejin2", fuyuejin2);}		if(fukuanfangshi==null||fukuanfangshi.equals("")){pmap.put("fukuanfangshi", null);}else{pmap.put("fukuanfangshi", fukuanfangshi);}		if(qizuriqi1==null||qizuriqi1.equals("")){pmap.put("qizuriqi1", null);}else{pmap.put("qizuriqi1", qizuriqi1);}		if(qizuriqi2==null||qizuriqi2.equals("")){pmap.put("qizuriqi2", null);}else{pmap.put("qizuriqi2", qizuriqi2);}		if(jiezhiriqi1==null||jiezhiriqi1.equals("")){pmap.put("jiezhiriqi1", null);}else{pmap.put("jiezhiriqi1", jiezhiriqi1);}		if(jiezhiriqi2==null||jiezhiriqi2.equals("")){pmap.put("jiezhiriqi2", null);}else{pmap.put("jiezhiriqi2", jiezhiriqi2);}		if(fujian==null||fujian.equals("")){pmap.put("fujian", null);}else{pmap.put("fujian", fujian);}		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}		
		
		int total=zufanghetongService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zufanghetong> list=zufanghetongService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zufanghetong_list3";
	}	@RequestMapping("zufanghetongList2.do")
	public String zufanghetongList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zufanghetong zufanghetong, String hetongbianhao, String fangyuanbianhao, String fangyuanmingcheng, String faburen, String chengzuren, String yuezujin, String fuyuejin1,String fuyuejin2, String fukuanfangshi, String qizuriqi1,String qizuriqi2, String jiezhiriqi1,String jiezhiriqi2, String fujian, String beizhushuoming, String issh,HttpServletRequest request){
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
		if(hetongbianhao==null||hetongbianhao.equals("")){pmap.put("hetongbianhao", null);}else{pmap.put("hetongbianhao", hetongbianhao);}		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}		if(fuyuejin1==null||fuyuejin1.equals("")){pmap.put("fuyuejin1", null);}else{pmap.put("fuyuejin1", fuyuejin1);}		if(fuyuejin2==null||fuyuejin2.equals("")){pmap.put("fuyuejin2", null);}else{pmap.put("fuyuejin2", fuyuejin2);}		if(fukuanfangshi==null||fukuanfangshi.equals("")){pmap.put("fukuanfangshi", null);}else{pmap.put("fukuanfangshi", fukuanfangshi);}		if(qizuriqi1==null||qizuriqi1.equals("")){pmap.put("qizuriqi1", null);}else{pmap.put("qizuriqi1", qizuriqi1);}		if(qizuriqi2==null||qizuriqi2.equals("")){pmap.put("qizuriqi2", null);}else{pmap.put("qizuriqi2", qizuriqi2);}		if(jiezhiriqi1==null||jiezhiriqi1.equals("")){pmap.put("jiezhiriqi1", null);}else{pmap.put("jiezhiriqi1", jiezhiriqi1);}		if(jiezhiriqi2==null||jiezhiriqi2.equals("")){pmap.put("jiezhiriqi2", null);}else{pmap.put("jiezhiriqi2", jiezhiriqi2);}		if(fujian==null||fujian.equals("")){pmap.put("fujian", null);}else{pmap.put("fujian", fujian);}		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}		
		
		int total=zufanghetongService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zufanghetong> list=zufanghetongService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zufanghetong_list2";
	}	
	
	@RequestMapping("zfhtList.do")
	public String zfhtList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Zufanghetong zufanghetong, String hetongbianhao, String fangyuanbianhao, String fangyuanmingcheng, String faburen, String chengzuren, String yuezujin, String fuyuejin1,String fuyuejin2, String fukuanfangshi, String qizuriqi1,String qizuriqi2, String jiezhiriqi1,String jiezhiriqi2, String fujian, String beizhushuoming, String issh){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(hetongbianhao==null||hetongbianhao.equals("")){pmap.put("hetongbianhao", null);}else{pmap.put("hetongbianhao", hetongbianhao);}		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}		if(chengzuren==null||chengzuren.equals("")){pmap.put("chengzuren", null);}else{pmap.put("chengzuren", chengzuren);}		if(yuezujin==null||yuezujin.equals("")){pmap.put("yuezujin", null);}else{pmap.put("yuezujin", yuezujin);}		if(fuyuejin1==null||fuyuejin1.equals("")){pmap.put("fuyuejin1", null);}else{pmap.put("fuyuejin1", fuyuejin1);}		if(fuyuejin2==null||fuyuejin2.equals("")){pmap.put("fuyuejin2", null);}else{pmap.put("fuyuejin2", fuyuejin2);}		if(fukuanfangshi==null||fukuanfangshi.equals("")){pmap.put("fukuanfangshi", null);}else{pmap.put("fukuanfangshi", fukuanfangshi);}		if(qizuriqi1==null||qizuriqi1.equals("")){pmap.put("qizuriqi1", null);}else{pmap.put("qizuriqi1", qizuriqi1);}		if(qizuriqi2==null||qizuriqi2.equals("")){pmap.put("qizuriqi2", null);}else{pmap.put("qizuriqi2", qizuriqi2);}		if(jiezhiriqi1==null||jiezhiriqi1.equals("")){pmap.put("jiezhiriqi1", null);}else{pmap.put("jiezhiriqi1", jiezhiriqi1);}		if(jiezhiriqi2==null||jiezhiriqi2.equals("")){pmap.put("jiezhiriqi2", null);}else{pmap.put("jiezhiriqi2", jiezhiriqi2);}		if(fujian==null||fujian.equals("")){pmap.put("fujian", null);}else{pmap.put("fujian", fujian);}		if(beizhushuoming==null||beizhushuoming.equals("")){pmap.put("beizhushuoming", null);}else{pmap.put("beizhushuoming", beizhushuoming);}		
		int total=zufanghetongService.getCount(pmap);
		pageBean.setTotal(total);
		List<Zufanghetong> list=zufanghetongService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "zufanghetonglist";
	}
	
	@RequestMapping("deleteZufanghetong.do")
	public String deleteZufanghetong(int id,HttpServletRequest request){
		zufanghetongService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:zufanghetongList.do";
	}
	
	
}
