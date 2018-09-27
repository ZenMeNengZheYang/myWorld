package com.world.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.world.bean.Student;
import com.world.repository.StudentRepository;

@RestController
public class StudentController {
	
	@Autowired
	private StudentRepository studentRepository;
	
	@RequestMapping("getStudentAll")
	public ModelAndView getStudentAll(){
		ModelAndView mv = new ModelAndView("student");
		Iterable<Student> list = studentRepository.findAll();
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("addStudent")
	public void addStudent(){
		Student s = new Student();
		s.setAge(1);
		s.setName("哈哈");
		s.setSex("男");
		s.setTelephone("123456");
		studentRepository.save(s);
	}
	
}
