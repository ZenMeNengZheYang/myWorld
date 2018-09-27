package com.world.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.repository.SysRoleRepository;
import com.world.result.Result;
import com.world.result.ResultUtil;

@Controller
public class RoleController {
	
	@Autowired
	private SysRoleRepository sysRoleRepository;
	
	@RequestMapping("/toRole")
	public String toRole(){
		return "role/role";
	}
	
	@RequestMapping("/getAllRole")
	@ResponseBody
	public Result getAllRole(){
		return ResultUtil.success(sysRoleRepository.findAll());
	}
	
}
