package com.phone.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phone.service.ProvinceService;

@Controller
@RequestMapping("/province")
public class provinceController {
		
	@Resource
	private ProvinceService provinceService;
	
	
	@RequestMapping(value="/selectAll")
	@ResponseBody
	public Object selectAllProvice(){
		return provinceService.selectAllProvince();
	}
	
	@RequestMapping(value="/selectCity")
	@ResponseBody
	public Object selectCity(int pid){
		System.out.println(pid);
		return provinceService.selectAllCity(pid);
		
	}
	
	
}
