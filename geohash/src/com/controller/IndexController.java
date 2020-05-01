package com.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



import com.entity.Xinwentongzhi;
import com.entity.Yonghuzhuce;
import com.entity.Fangyuanxinxi;//jixacxishxu1

import com.server.XinwentongzhiServer;
import com.server.YonghuzhuceServer;
import com.server.FangyuanxinxiServer;//jixacxishxu2

import com.util.PageBean;

@Controller
public class IndexController {
	
	@Autowired
	@Resource
	private XinwentongzhiServer xinwentongzhiService;
	
	@Autowired
	@Resource
	private YonghuzhuceServer yonghuzhuceServer;
	
	@Autowired
	@Resource	private FangyuanxinxiServer fangyuanxinxiServer;	//jixacxishxu3
	
	
	
//	首页显示内容
	@RequestMapping("/index.do")
	public String showIndex(ModelMap map){

		List<Xinwentongzhi> syxinwentongzhi1=xinwentongzhiService.getsyxinwentongzhi1(null);
		List<Xinwentongzhi> syxinwentongzhi2=xinwentongzhiService.getsyxinwentongzhi2(null);
		List<Xinwentongzhi> syxinwentongzhi3=xinwentongzhiService.getsyxinwentongzhi3(null);

		List<Yonghuzhuce> syyonghuzhuce1=yonghuzhuceServer.getsyyonghuzhuce1(null);
		List<Fangyuanxinxi> syfangyuanxinxi1=fangyuanxinxiServer.getsyfangyuanxinxi1(null);		List<Fangyuanxinxi> syfangyuanxinxi2=fangyuanxinxiServer.getsyfangyuanxinxi2(null);		List<Fangyuanxinxi> syfangyuanxinxi3=fangyuanxinxiServer.getsyfangyuanxinxi3(null);		//jixacxishxu4
		System.out.println(syyonghuzhuce1.size());
	    map.put("syxinwentongzhi1", syxinwentongzhi1);
	    map.put("syxinwentongzhi2", syxinwentongzhi2);
	    map.put("syxinwentongzhi3", syxinwentongzhi3);
	    map.put("syyonghuzhuce1", syyonghuzhuce1);
	    map.put("syfangyuanxinxi1", syfangyuanxinxi1);	    map.put("syfangyuanxinxi2", syfangyuanxinxi2);	    map.put("syfangyuanxinxi3", syfangyuanxinxi3);	    //jixacxishxu5

		return "default";
	}

	

	
}
