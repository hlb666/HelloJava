package com.xuexi.mybatis.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xuexi.mybatis.service.BackOperateImpl;


@RequestMapping("/backController")
@Controller
public class PreController {

	@Autowired
	private  BackOperateImpl backOperateImpl;
	
	
	
}
