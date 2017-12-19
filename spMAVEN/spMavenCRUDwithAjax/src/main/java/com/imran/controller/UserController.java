package com.imran.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.imran.model.Product;

@Controller
public class UserController {
	
	@RequestMapping(value="/")
	public String index(){
		return "index";
	}
	
	
	@RequestMapping("/test/{id}")
	public @ResponseBody Map<String, Object> test(@PathVariable("id") Integer id){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("successMsg", "Delete Id: "+id);
		
		
		System.out.println(map.get("successMsg"));
		return map;
	}
	
	

}
