package com.main.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.model.CSupport;
import com.main.model.Manager;
import com.main.repository.ManagerRepo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/manager")
public class ManagerContoller {
	
	@Autowired
	ManagerRepo mr;
	
	@GetMapping("managerReg")
	public ModelAndView m0()
	{
		return new ModelAndView("manager/ManagerReg");
	}
	

	@PostMapping("mreg")
	public ModelAndView m2(HttpServletRequest req)
	{
		
		Random rd = new Random();
		
		String s = rd+"";
		
		
		String mid=s;
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		ModelAndView mv = new ModelAndView("home/dashboard");
		
		Manager cs = new Manager(mid,name,email,password);
		mr.save(cs);
		 
		return mv;
		
			
	}
	
	
	@GetMapping("/Manager")
	public ModelAndView m1()
	{
		return new ModelAndView("manager/managerlogin");
	}
	
	
	@GetMapping("/managerLogin")
	public ModelAndView Login(HttpServletRequest req)
	{
		ModelAndView mv = null;
		String em = req.getParameter("email");
		String pw = req.getParameter("password");
		
		if(mr.findByEmailAndPassword(em, pw)!=null)
		{
			
			mv= new ModelAndView("home/HomePage");
		}
		else
		{
			mv = new ModelAndView("manager/managerlogin");
		}
		
		return mv;
		  
	}
	
	
	
	
	
//	@GetMapping("/ManagerLogin")
//	public ModelAndView m2()
//	{
//		return new ModelAndView("HomePage");
//	}

	
	

}
