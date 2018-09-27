package com.world.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.world.bean.SysUser;
import com.world.repository.SysUserRepository;
import com.world.result.Result;
import com.world.result.ResultUtil;
import com.world.util.MD5Util;

@Controller
public class UserController {
	
	@Autowired
	private SysUserRepository sysUserRepository;
	
	@RequestMapping("/toUser")
	public String toUser(){
		return "user/user";
	}
	
	@RequestMapping("/getAllUser")
	@ResponseBody
	public Result getAllUser(){
		return ResultUtil.success(sysUserRepository.findAll());
	}
	
	@RequestMapping("/saveOrUpdate")
	@ResponseBody
	public Result saveOrUpdate(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		SysUser user;
		if(StringUtils.isEmpty(id)){
			user = new SysUser();
			user.setUsername(username);
			user.setPassword(MD5Util.encode("123"));
		}else{
			user = sysUserRepository.findOne(Long.parseLong(id));
			user.setUsername(username);
		}
		sysUserRepository.save(user);
		return ResultUtil.success(null);
	}
	
}
