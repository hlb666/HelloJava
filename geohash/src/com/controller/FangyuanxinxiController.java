package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.Fangyuanxinxi;
import com.server.FangyuanxinxiServer;
import com.util.Distance;
import com.util.Geohash;
import com.util.PageBean;
@Controller
public class FangyuanxinxiController {
	@Resource
	private FangyuanxinxiServer fangyuanxinxiService;


   
	@RequestMapping("addFangyuanxinxi.do")
	public String addFangyuanxinxi(HttpServletRequest request,
			                       Fangyuanxinxi fangyuanxinxi,
			                       HttpSession session)throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		String lng1 = fangyuanxinxi.getLng().toString();
		String lat1 = fangyuanxinxi.getLat().toString();	
		double lng = Double.parseDouble(lng1);
		double lat = Double.parseDouble(lat1);
        Geohash geohash = new Geohash();		
		String  geocode=geohash.encode(lat,lng).substring(0, 9);
		String code  = geocode;
		fangyuanxinxi.setAddtime(time.toString().substring(0, 19));
		fangyuanxinxi.setCode(code);		
		fangyuanxinxiService.add(fangyuanxinxi);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));		
		//session.setAttribute("backurl", "fangyuanxinxiList.do");		
		return "redirect:postback.jsp";
		//return "redirect:fangyuanxinxiList.do";	
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateFangyuanxinxi.do")
	public String doUpdateFangyuanxinxi(int id,ModelMap map,Fangyuanxinxi fangyuanxinxi){
		fangyuanxinxi=fangyuanxinxiService.getById(id);
		map.put("fangyuanxinxi", fangyuanxinxi);
		return "fangyuanxinxi_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("fangyuanxinxiDetail.do")
	public String fangyuanxinxiDetail(int id,ModelMap map,Fangyuanxinxi fangyuanxinxi){
		fangyuanxinxi=fangyuanxinxiService.getById(id);
		map.put("fangyuanxinxi", fangyuanxinxi);
		return "fangyuanxinxi_detail";
	}
//	前台详细
	@RequestMapping("fyxxDetail.do")
	public String fyxxDetail(int id,ModelMap map,Fangyuanxinxi fangyuanxinxi){
		fangyuanxinxi=fangyuanxinxiService.getById(id);

		map.put("fangyuanxinxi", fangyuanxinxi);
		return "fangyuanxinxidetail";
	}
//	
	@RequestMapping("updateFangyuanxinxi.do")
	public String updateFangyuanxinxi(int id,ModelMap map,Fangyuanxinxi fangyuanxinxi,HttpServletRequest request,HttpSession session){
		fangyuanxinxiService.update(fangyuanxinxi);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:fangyuanxinxiList.do";
	}

//	分页查询
	@RequestMapping("fangyuanxinxiList.do")
	public String fangyuanxinxiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Fangyuanxinxi fangyuanxinxi, String fangyuanbianhao, String fangyuanmingcheng, String fangwuzhaopian, String suozailouceng1,String suozailouceng2, String zonglouceng, String huxingjiegou, String jianzhumianji1,String jianzhumianji2, String jianchengnianfen1,String jianchengnianfen2, String suozaiweizhi, String peitaosheshi, String yuezujin1,String yuezujin2, String fangyuanzhuangtai, String xiangqingmiaoshu, String faburen, String issh){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 5);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 5);
		
		
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}
		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}
		if(fangwuzhaopian==null||fangwuzhaopian.equals("")){pmap.put("fangwuzhaopian", null);}else{pmap.put("fangwuzhaopian", fangwuzhaopian);}
		if(suozailouceng1==null||suozailouceng1.equals("")){pmap.put("suozailouceng1", null);}else{pmap.put("suozailouceng1", suozailouceng1);}
		if(suozailouceng2==null||suozailouceng2.equals("")){pmap.put("suozailouceng2", null);}else{pmap.put("suozailouceng2", suozailouceng2);}
		if(zonglouceng==null||zonglouceng.equals("")){pmap.put("zonglouceng", null);}else{pmap.put("zonglouceng", zonglouceng);}
		if(huxingjiegou==null||huxingjiegou.equals("")){pmap.put("huxingjiegou", null);}else{pmap.put("huxingjiegou", huxingjiegou);}
		if(jianzhumianji1==null||jianzhumianji1.equals("")){pmap.put("jianzhumianji1", null);}else{pmap.put("jianzhumianji1", jianzhumianji1);}
		if(jianzhumianji2==null||jianzhumianji2.equals("")){pmap.put("jianzhumianji2", null);}else{pmap.put("jianzhumianji2", jianzhumianji2);}
		if(jianchengnianfen1==null||jianchengnianfen1.equals("")){pmap.put("jianchengnianfen1", null);}else{pmap.put("jianchengnianfen1", jianchengnianfen1);}
		if(jianchengnianfen2==null||jianchengnianfen2.equals("")){pmap.put("jianchengnianfen2", null);}else{pmap.put("jianchengnianfen2", jianchengnianfen2);}
		if(suozaiweizhi==null||suozaiweizhi.equals("")){pmap.put("suozaiweizhi", null);}else{pmap.put("suozaiweizhi", suozaiweizhi);}
		if(peitaosheshi==null||peitaosheshi.equals("")){pmap.put("peitaosheshi", null);}else{pmap.put("peitaosheshi", peitaosheshi);}
		if(yuezujin1==null||yuezujin1.equals("")){pmap.put("yuezujin1", null);}else{pmap.put("yuezujin1", yuezujin1);}
		if(yuezujin2==null||yuezujin2.equals("")){pmap.put("yuezujin2", null);}else{pmap.put("yuezujin2", yuezujin2);}
		if(fangyuanzhuangtai==null||fangyuanzhuangtai.equals("")){pmap.put("fangyuanzhuangtai", null);}else{pmap.put("fangyuanzhuangtai", fangyuanzhuangtai);}
		if(xiangqingmiaoshu==null||xiangqingmiaoshu.equals("")){pmap.put("xiangqingmiaoshu", null);}else{pmap.put("xiangqingmiaoshu", xiangqingmiaoshu);}
		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}
		
		int total=fangyuanxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Fangyuanxinxi> list=fangyuanxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "fangyuanxinxi_list";
	}
	
	@RequestMapping("fangyuanxinxiList2.do")
	public String fangyuanxinxiList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Fangyuanxinxi fangyuanxinxi, String fangyuanbianhao, String fangyuanmingcheng, String fangwuzhaopian, String suozailouceng1,String suozailouceng2, String zonglouceng, String huxingjiegou, String jianzhumianji1,String jianzhumianji2, String jianchengnianfen1,String jianchengnianfen2, String suozaiweizhi, String peitaosheshi, String yuezujin1,String yuezujin2, String fangyuanzhuangtai, String xiangqingmiaoshu, String faburen, String issh,HttpServletRequest request){
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
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}
		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}
		if(fangwuzhaopian==null||fangwuzhaopian.equals("")){pmap.put("fangwuzhaopian", null);}else{pmap.put("fangwuzhaopian", fangwuzhaopian);}
		if(suozailouceng1==null||suozailouceng1.equals("")){pmap.put("suozailouceng1", null);}else{pmap.put("suozailouceng1", suozailouceng1);}
		if(suozailouceng2==null||suozailouceng2.equals("")){pmap.put("suozailouceng2", null);}else{pmap.put("suozailouceng2", suozailouceng2);}
		if(zonglouceng==null||zonglouceng.equals("")){pmap.put("zonglouceng", null);}else{pmap.put("zonglouceng", zonglouceng);}
		if(huxingjiegou==null||huxingjiegou.equals("")){pmap.put("huxingjiegou", null);}else{pmap.put("huxingjiegou", huxingjiegou);}
		if(jianzhumianji1==null||jianzhumianji1.equals("")){pmap.put("jianzhumianji1", null);}else{pmap.put("jianzhumianji1", jianzhumianji1);}
		if(jianzhumianji2==null||jianzhumianji2.equals("")){pmap.put("jianzhumianji2", null);}else{pmap.put("jianzhumianji2", jianzhumianji2);}
		if(jianchengnianfen1==null||jianchengnianfen1.equals("")){pmap.put("jianchengnianfen1", null);}else{pmap.put("jianchengnianfen1", jianchengnianfen1);}
		if(jianchengnianfen2==null||jianchengnianfen2.equals("")){pmap.put("jianchengnianfen2", null);}else{pmap.put("jianchengnianfen2", jianchengnianfen2);}
		if(suozaiweizhi==null||suozaiweizhi.equals("")){pmap.put("suozaiweizhi", null);}else{pmap.put("suozaiweizhi", suozaiweizhi);}
		if(peitaosheshi==null||peitaosheshi.equals("")){pmap.put("peitaosheshi", null);}else{pmap.put("peitaosheshi", peitaosheshi);}
		if(yuezujin1==null||yuezujin1.equals("")){pmap.put("yuezujin1", null);}else{pmap.put("yuezujin1", yuezujin1);}
		if(yuezujin2==null||yuezujin2.equals("")){pmap.put("yuezujin2", null);}else{pmap.put("yuezujin2", yuezujin2);}
		if(fangyuanzhuangtai==null||fangyuanzhuangtai.equals("")){pmap.put("fangyuanzhuangtai", null);}else{pmap.put("fangyuanzhuangtai", fangyuanzhuangtai);}
		if(xiangqingmiaoshu==null||xiangqingmiaoshu.equals("")){pmap.put("xiangqingmiaoshu", null);}else{pmap.put("xiangqingmiaoshu", xiangqingmiaoshu);}
		
		
		int total=fangyuanxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Fangyuanxinxi> list=fangyuanxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "fangyuanxinxi_list2";
	}
	
	
	
	@RequestMapping("ajax.do")
	public String ajax(HttpServletRequest request){
		String lng = request.getParameter("lng");
		String lat = request.getParameter("lat");
		
		request.getSession().setAttribute("lngs", lng);
	    request.getSession().setAttribute("lats", lat);
	    String lngs = (String) request.getSession().getAttribute("lngs");
		String lats = (String) request.getSession().getAttribute("lats");
//		int rad = (int) request.getSession().getAttribute("radius");
		System.out.println(lngs+"--ajax---"+lats+"-");
	    return "";
	}
	
	@RequestMapping("local.do")
	public void local(HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<Fangyuanxinxi> list = fangyuanxinxiService.selectCode();
		String names[] =new String[list.size()];  //这里可以把后台数据集 转为数组
		System.out.println(list.size());
//		//把 集合 的数据装在数组中
		for (int i=0;i<list.size();i++) {
			names[i]=list.get(i).getCode();
		}
		String json4=  JSONArray.fromObject(names).toString();
		System.out.println(json4);
		//响应输出
		response.getWriter().append(json4);

	  
	}
	
	
	
	@RequestMapping("fyxxList.do")
	public String fyxxList(@RequestParam(value="page",required=false)String page,
			HttpServletRequest request,ModelMap map,HttpSession session,Fangyuanxinxi fangyuanxinxi, String fangyuanbianhao, String fangyuanmingcheng, String fangwuzhaopian, String suozailouceng1,String suozailouceng2, String zonglouceng, String huxingjiegou, String jianzhumianji1,String jianzhumianji2, String jianchengnianfen1,String jianchengnianfen2, String suozaiweizhi, String peitaosheshi, String yuezujin1,String yuezujin2, String fangyuanzhuangtai, String xiangqingmiaoshu, String faburen, String issh){
		
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 5);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 8);
		String radius = request.getParameter("radius");     
     
		if(fangyuanbianhao==null||fangyuanbianhao.equals("")){pmap.put("fangyuanbianhao", null);}else{pmap.put("fangyuanbianhao", fangyuanbianhao);}
		if(fangyuanmingcheng==null||fangyuanmingcheng.equals("")){pmap.put("fangyuanmingcheng", null);}else{pmap.put("fangyuanmingcheng", fangyuanmingcheng);}
		if(fangwuzhaopian==null||fangwuzhaopian.equals("")){pmap.put("fangwuzhaopian", null);}else{pmap.put("fangwuzhaopian", fangwuzhaopian);}
		if(suozailouceng1==null||suozailouceng1.equals("")){pmap.put("suozailouceng1", null);}else{pmap.put("suozailouceng1", suozailouceng1);}
		if(suozailouceng2==null||suozailouceng2.equals("")){pmap.put("suozailouceng2", null);}else{pmap.put("suozailouceng2", suozailouceng2);}
		if(zonglouceng==null||zonglouceng.equals("")){pmap.put("zonglouceng", null);}else{pmap.put("zonglouceng", zonglouceng);}
		if(huxingjiegou==null||huxingjiegou.equals("")){pmap.put("huxingjiegou", null);}else{pmap.put("huxingjiegou", huxingjiegou);}
		if(jianzhumianji1==null||jianzhumianji1.equals("")){pmap.put("jianzhumianji1", null);}else{pmap.put("jianzhumianji1", jianzhumianji1);}
		if(jianzhumianji2==null||jianzhumianji2.equals("")){pmap.put("jianzhumianji2", null);}else{pmap.put("jianzhumianji2", jianzhumianji2);}
		if(jianchengnianfen1==null||jianchengnianfen1.equals("")){pmap.put("jianchengnianfen1", null);}else{pmap.put("jianchengnianfen1", jianchengnianfen1);}
		if(jianchengnianfen2==null||jianchengnianfen2.equals("")){pmap.put("jianchengnianfen2", null);}else{pmap.put("jianchengnianfen2", jianchengnianfen2);}
		if(suozaiweizhi==null||suozaiweizhi.equals("")){pmap.put("suozaiweizhi", null);}else{pmap.put("suozaiweizhi", suozaiweizhi);}
		if(peitaosheshi==null||peitaosheshi.equals("")){pmap.put("peitaosheshi", null);}else{pmap.put("peitaosheshi", peitaosheshi);}
		if(yuezujin1==null||yuezujin1.equals("")){pmap.put("yuezujin1", null);}else{pmap.put("yuezujin1", yuezujin1);}
		if(yuezujin2==null||yuezujin2.equals("")){pmap.put("yuezujin2", null);}else{pmap.put("yuezujin2", yuezujin2);}
		if(fangyuanzhuangtai==null||fangyuanzhuangtai.equals("")){pmap.put("fangyuanzhuangtai", null);}else{pmap.put("fangyuanzhuangtai", fangyuanzhuangtai);}
		if(xiangqingmiaoshu==null||xiangqingmiaoshu.equals("")){pmap.put("xiangqingmiaoshu", null);}else{pmap.put("xiangqingmiaoshu", xiangqingmiaoshu);}
		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}		
		
		
		
		
		System.out.println("radius:"+radius);
		if(radius==null){
			int total=fangyuanxinxiService.getCount(pmap);			
			pageBean.setTotal(total);
			List<Fangyuanxinxi> list=fangyuanxinxiService.getByPage(pmap);			
			map.put("page", pageBean);
			map.put("list", list);
			session.setAttribute("p", 1);			
		}else{
			int rads = Integer.parseInt(radius);
			System.out.println("rads:"+rads);
			int total=fangyuanxinxiService.getCount(pmap);
			double lon1;
			double lat1;
			pageBean.setTotal(total);
			List<Fangyuanxinxi> list=fangyuanxinxiService.getByPage(pmap);
			List<Fangyuanxinxi> teams = new ArrayList<Fangyuanxinxi>();
		
			
			if((String) request.getSession().getAttribute("lngs")!=null&&
					(String) request.getSession().getAttribute("lats")!=null){			
			String lngs = (String) request.getSession().getAttribute("lngs");
		    String lats = (String) request.getSession().getAttribute("lats");
		    lon1 = Double.parseDouble(lngs);
			lat1 = Double.parseDouble(lats);
			
			for (Fangyuanxinxi listNews : list) {
				double lon2 = listNews.getLng().doubleValue();
				double lat2 = listNews.getLat().doubleValue();				
				if(Distance.Distance(lat1, lon1, lat2, lon2)<rads){					
					teams.add(listNews);				
				}else{				
					request.setAttribute("NEWS", "无");
				}	
				
			  }
			
			}			
			map.put("page", pageBean);
			map.put("list", teams);
			session.setAttribute("p", 1);
		}
			
		return "fangyuanxinxilisttp";
	}
	
	@RequestMapping("deleteFangyuanxinxi.do")
	public String deleteFangyuanxinxi(int id,HttpServletRequest request){
		fangyuanxinxiService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:fangyuanxinxiList.do";
	}
	
	
}
