package com.world.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.world.bean.Module;
import com.world.repository.ModuleRepository;
import com.world.result.Result;
import com.world.result.ResultUtil;

import net.sf.json.JSONArray;

@Controller
public class ModuleController {
	
	@Autowired
	private ModuleRepository moduleRepository;
	
	@RequestMapping("/getModule")
	public String getModule(Model model){
		Iterable<Module> module = moduleRepository.findAll();
		model.addAttribute("module", JSONArray.fromObject(module));
		model.addAttribute("moduleClass", JSONArray.fromObject(moduleRepository.findTopModuleClass()));
		return "module/module";
	}
	
	@RequestMapping("getModule2")
	public ModelAndView getModule2(){
		ModelAndView mv = new ModelAndView("module/module2");
		Iterable<Module> module = moduleRepository.findAll();
		mv.addObject("module", JSONArray.fromObject(module));
		mv.addObject("moduleClass", JSONArray.fromObject(moduleRepository.findTopModuleClass()));
		return mv;
	}
	
	@RequestMapping("/addModule")
	@ResponseBody
	public Result addModule(HttpServletRequest request, HttpServletResponse response){
		String name = request.getParameter("name");
		String moduleClass = request.getParameter("moduleClass");
		int higherUp = StringUtils.isEmpty(request.getParameter("higherUp")) ? 
				0 : Integer.parseInt(request.getParameter("higherUp"));
		String rank = request.getParameter("rank");
		String moduleUrl = request.getParameter("moduleUrl");
		
		Module module = new Module();
		
		module.setName(name);
		module.setModuleClass(Integer.parseInt(moduleClass));
		module.setHigherUp(higherUp);
		module.setRank(Integer.parseInt(rank));
		module.setModuleUrl(moduleUrl);
		moduleRepository.save(module);
		return ResultUtil.success(null);
	}
	
	@RequestMapping("/updateModule")
	@ResponseBody
	public Result updateModule(HttpServletRequest request, HttpServletResponse response, int id, String name){
		Module module = moduleRepository.findOne(id);
		module.setName(name);
		return ResultUtil.success(null);
	}
	
	@RequestMapping("/delModule")
	@ResponseBody
	public Result delModule(HttpServletRequest request, HttpServletResponse response, int id){
		List<Module> modules = new ArrayList<Module>();
		Module module = moduleRepository.findOne(id);
		List<Module> moduleList = moduleRepository.findByHigherUp(id);
		if(!moduleList.isEmpty()){
			modules = moduleList;
		}
		modules.add(module);
		moduleRepository.delete(modules);
		return ResultUtil.success(null);
	}
	
}
