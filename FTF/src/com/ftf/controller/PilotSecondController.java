package com.ftf.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ftf.beans.InvolueTeam;
import com.ftf.beans.ListForInv;
import com.ftf.beans.Team;
import com.ftf.beans.Type;
import com.ftf.beans.User;
import com.ftf.common.Distance;
import com.ftf.service.TeamServiceImpl;
import com.ftf.service.UserLoginServiceImpl;


@RequestMapping("/pilotSecondController")
@Controller
public class PilotSecondController {
	
	@Autowired
	private UserLoginServiceImpl userLoginServiceImpl;
	
	@Autowired
	private TeamServiceImpl teamMapper;
	
//---------------------个人中心的二级菜单-------------------------------
//------------------加载个人资料的信息---------------------------------
	@RequestMapping("/one")
	public String persons1(HttpServletRequest request){
           request.setAttribute("class1","active");
           request.setAttribute("msg","test.jsp");
		return  "WEB-INF/pages/Person"; 
	}
	
//------------------加载我参与的队伍的信息---------------------------------
	@RequestMapping("/two")
	public String persons2(HttpServletRequest request){	
		Object uid1 = request.getSession().getAttribute("id");
		int uid = Integer.parseInt(String.valueOf(uid1));
		List<InvolueTeam> Involist = teamMapper.involueTeamsfrorAll(uid);
		System.out.println("ddddd-"+Involist.size());
		List<Team> list = new ArrayList<Team>();
		for (InvolueTeam involueTeam : Involist) {
			Team team = teamMapper.getById(involueTeam.getSid());
			list.add(team);
		}
		   request.setAttribute("Involist", Involist);
		   request.setAttribute("Teamlist", list);
           request.setAttribute("class2","active");
           request.setAttribute("msg","InvolveTeam.jsp");
		return  "WEB-INF/pages/Person"; 
	}	
//---------------------跳转至我发起的队伍以及相关的内容获取------------------
	@RequestMapping("/three")
	public String persons3(HttpServletRequest request){
		Object uid1 = request.getSession().getAttribute("id");
		int uid = Integer.parseInt(String.valueOf(uid1));
		Team team = new Team();
		team.setUid(uid);
		List<Team> list = teamMapper.getAllStart(team);
		request.setAttribute("list", list);		
        request.setAttribute("class3","active");
        request.setAttribute("msg","StartTeam.jsp");
		return  "WEB-INF/pages/Person"; 
	}
//---------------------点击我发起的项目中的相关内容获取-------------------------------	
	@RequestMapping("/threeContent")
	public String persons3Content(HttpServletRequest request){
        String id1 = request.getParameter("id");	
    	int id = Integer.parseInt(id1);	
    	request.getSession().setAttribute("sid", id);
		Team team = teamMapper.getById(id);
		int uid = team.getUid();
		int tid = team.getTid();
		User user = userLoginServiceImpl.getById(uid);
		Type types = new Type();
		types.setId(tid);
		Type type = teamMapper.getAllById(types);
		List<InvolueTeam> Involist = teamMapper.involueTeams(id);
		request.setAttribute("Involist", Involist);		
		request.setAttribute("users", user.getUsername());
		request.setAttribute("types", type.getType());
		request.setAttribute("team", team);		
        request.setAttribute("class3","active");
        request.setAttribute("msg","StartTeamContent.jsp");
		return  "WEB-INF/pages/Person"; 
	}
	
	@RequestMapping("/echarts")
    public void Echarts(HttpServletRequest request,HttpServletResponse response) throws IOException{
    	Object sid1 = request.getSession().getAttribute("sid");
    	int sid = Integer.parseInt(String.valueOf(sid1));
    	System.out.println("sid"+sid);
		List<InvolueTeam> involueTeams = teamMapper.involueTeamfrorEc(sid);
    	System.out.println(involueTeams.size());
    	int eid[] =new int[involueTeams.size()];  //这里可以把后台数据集 转为数组
		//把集合的数据装在数组中
		for (int i=0;i<involueTeams.size();i++) {
			eid[i]=involueTeams.get(i).getId();
			System.out.println(involueTeams.get(i).getId());
		}
		String json=JSONArray.fromObject(eid).toString();		
		response.getWriter().print(json);		   	
    }
	//-------------刪除当前发起的队伍------------------------
	@RequestMapping("/deleteTeam")
	public String deleteTeam(HttpServletRequest request){
		String id1 = request.getParameter("deid");
		int id = Integer.parseInt(id1);
		teamMapper.deleteLuanch(id);
		request.setAttribute("class3","active");
	    request.setAttribute("msg","StartTeam.jsp");
		return  this.persons3(request); 
	}
		
	//-------------修改当前发起的队伍------------------------
	@RequestMapping("/modifyTeam")
	public String modifyTeam(HttpServletRequest request){
		String id1 = request.getParameter("deid");
		int id = Integer.parseInt(id1);
		System.out.println("did"+id);
		request.setAttribute("class3","active");
	    request.setAttribute("msg","StartTeam.jsp");
		return  this.persons3(request); 
	}
	
	
//------------------删除（退出）当前参与的队伍-----------------------
	@RequestMapping("/deleteinv")
public String DeletInvolveTeam(HttpServletRequest request){
	String id1 = request.getParameter("id");
	int id = Integer.parseInt(id1);
	System.out.println(id+"ss");
	teamMapper.deleteInvolve(id);
	
    request.setAttribute("class2","active");
    request.setAttribute("msg","InvolveTeam.jsp");
	return  this.persons2(request); 
} 

//------------------修改当前参与的队伍的个人信息-----------------------
	
	
		
//--------------------------跳转至美好瞬间以及相关信息的获取--------------------	
	@RequestMapping("/four")
	public String persons4(HttpServletRequest request){
           request.setAttribute("class4","active");
           request.setAttribute("msg","test.jsp");
		return  "WEB-INF/pages/Person"; 
	}
//---------------------约吧中心的二级菜单-------------------------------	

	@RequestMapping("/ajax")
	public String ajax(HttpServletRequest request){
		String lng = request.getParameter("lng");
		String lat = request.getParameter("lat");
		String radius = request.getParameter("radius");
		request.getSession().setAttribute("lngs", lng);
	    request.getSession().setAttribute("lats", lat);
	    request.getSession().setAttribute("radius", radius);
	    String lngs = (String) request.getSession().getAttribute("lngs");
		String lats = (String) request.getSession().getAttribute("lats");
//		int rad = (int) request.getSession().getAttribute("radius");
		System.out.println(lngs+"--ajax---"+lats+"-");
	    return "";
	}
//--------------------------------运动类型的数据获取----------------------	
	@RequestMapping("/sport")
    private String example(HttpServletRequest request) {
		System.out.println("----------运动类型数据库取值信息----------------");
		String lng = "118.3564156294";
		String lat = "31.2844878810";
		request.getSession().setAttribute("lngs", lng);
	    request.getSession().setAttribute("lats", lat);
		
//==========================================================	
		
		
		String lngs = (String) request.getSession().getAttribute("lngs");
		String lats = (String) request.getSession().getAttribute("lats");
//		int rad = (int) request.getSession().getAttribute("radius");
		System.out.println(lngs+"-----"+lats);
		String tid = request.getParameter("tid");
		int tids = Integer.parseInt(tid);
		request.getSession().setAttribute("ttid", tids);
		System.out.println(tid+"-xsd");
		double lon1 = Double.parseDouble(lngs);
		double lat1 = Double.parseDouble(lats);
		System.out.println("lng_sport-"+lngs+"lat-"+lats);
		Team team = new Team();
		team.setTid(tids);
		List<Team> Teamlist = teamMapper.getAll(team);
		List<Team> teams = new ArrayList<Team>();
		float dis = 0.0f;
		String diss=null;
		System.out.println(Teamlist);
		for (Team team2 : Teamlist) {
			double lon2 = team2.getLng().doubleValue();
			double lat2 = team2.getLat().doubleValue();
			if(Distance.Distance(lat1, lon1, lat2, lon2)<2){
				dis = (float)Distance.Distance(lat1, lon1, lat2, lon2);
				DecimalFormat format = new DecimalFormat("0.000");
				 diss = format.format(dis);
				teams.add(team2);				
			}else{				
				request.setAttribute("NEWS", "无");
			}			
		}
		System.out.println("----------运动类型数据库取值信息----------------");
		request.setAttribute("teams", teams);
		request.setAttribute("dis", diss);
        return "WEB-INF/pages/Sport";
    }
	
	
	@RequestMapping("/sports")
    private String examples(HttpServletRequest request) {
		System.out.println("----------运动类型数据库取值信息2.0----------------");
		String radius = request.getParameter("radius");
		Object ttid = request.getSession().getAttribute("ttid");
		int tid = Integer.parseInt(String.valueOf(ttid));
		System.out.println(tid);
	

		int rads = Integer.parseInt(radius);
		System.out.println(rads);
		String lngs = (String) request.getSession().getAttribute("lngs");
		String lats = (String) request.getSession().getAttribute("lats");

		System.out.println(lngs+"-----"+lats);		
		double lon1 = Double.parseDouble(lngs);
		double lat1 = Double.parseDouble(lats);
		System.out.println("lng_sport-"+lngs+"lat-"+lats);
		Team team = new Team();
		team.setTid(tid);
		List<Team> Teamlist = teamMapper.getAll(team);
		List<Team> teams = new ArrayList<Team>();
		float dis = 0.0f;
		String diss=null;
		for (Team team2 : Teamlist) {
			double lon2 = team2.getLng().doubleValue();
			double lat2 = team2.getLat().doubleValue();
			if(Distance.Distance(lat1, lon1, lat2, lon2)<rads){
				dis = (float)Distance.Distance(lat1, lon1, lat2, lon2);
				DecimalFormat format = new DecimalFormat("0.000");
				diss = format.format(dis);
				teams.add(team2);				
			}else{				
				request.setAttribute("NEWS", "无");
			}			
		}
		System.out.println("----------运动类型数据库取值信息2.0----------------");
		request.setAttribute("teams", teams);
		request.setAttribute("dis", diss);
        return "WEB-INF/pages/Sport";
    }
	
//----------------------登山页面的跳转以及信息的获取------------------------------
	@RequestMapping("/climb")
    private String climb() {
        return "WEB-INF/pages/Climb";
    }
//----------------------发起队伍------------------------------
	@RequestMapping("/teamLaunch")
    private String TeamLaunch() {
        return "WEB-INF/pages/TeamLaunch";
    }
//--------------------队伍具体信息的展示-----------------------
	@RequestMapping("/teamc")
    private String Teamc(HttpServletRequest request) {
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);	
		Team team = teamMapper.getById(id);
		int uid = team.getUid();
		int tid = team.getTid();
		User user = userLoginServiceImpl.getById(uid);
		Type types = new Type();
		types.setId(tid);
		Type type = teamMapper.getAllById(types);
		String title = team.getTitle();
		String date = team.getDate();
		String content = team.getContent();
		String pic = team.getPic();
		String userer = user.getUsername();
		String typed = type.getType();
		request.setAttribute("id", id);
		request.setAttribute("pic",pic);
        request.setAttribute("title",title);
        request.setAttribute("date",date);
        request.setAttribute("content",content);
        request.setAttribute("userer",userer);
        request.setAttribute("typed",typed);
        return "WEB-INF/pages/TeamContent";
    }	
	
//-------------------------确认参加的信息提交--------------------------
	
	@RequestMapping("/involve")
	public String involves(HttpServletRequest request){
		System.out.println("--------参加者信息的提交--------");
		Object  uid1 =  request.getSession().getAttribute("id");
		int uid = Integer.parseInt(String.valueOf(uid1));
	
		System.out.println(uid);
		String id1 = request.getParameter("id");
		int sid = Integer.parseInt(id1);
		System.out.println("sid"+sid);
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		System.out.println(name+age+sex+email);
		InvolueTeam involueTeam = new InvolueTeam(name, sex, age, email, sid, uid);
		teamMapper.addToInvolve(involueTeam);
		
		request.setAttribute("news", "参加成功！");
		return this.Teamc(request);
	}
	
//--------------------------我参与的队伍信息获取----------------------------
    @RequestMapping("/getByAjax")
	public void getByAjax(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);	
		Team team = teamMapper.getById(id);
		request.setAttribute("team", team);		
		String json=JSONArray.fromObject(team).toString();
		response.getWriter().print(json);			
	}
}
