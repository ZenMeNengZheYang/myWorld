package com.world.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.world.repository.Aaa;


@RestController
public class SayHello {
	
	@Autowired
	private Aaa aaa;
	
	@RequestMapping("theMartialArtsWorld")
	public String theMartialArtsWorld(){
		return "这是你的江湖!";
	}
	
	@RequestMapping("test")
	public ModelAndView test(){
		ModelAndView mv = new ModelAndView("test");
		return mv;
	}
	
	@RequestMapping("save")
	public void save() throws Exception{
		System.out.println(aaa.insertDataReturnKeyByGetNextVal("SEQ_PARAM_ID"));
	}
	
}
