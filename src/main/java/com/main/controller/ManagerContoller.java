package com.main.controller;

import java.util.Random;

import com.main.model.CrmUser;
import jakarta.servlet.http.HttpSession;
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
	
	
	@GetMapping("/HomePage")
	public String Login(HttpServletRequest req, HttpSession ses)
	{
		CrmUser user = (CrmUser) ses.getAttribute("UserData");
		System.out.printf(user.getUserEmail() +"----"+user.getPassword());

		return "static/HomePage";
		  
	}
	
	
	
	
	
//	@GetMapping("/ManagerLogin")
//	public ModelAndView m2()
//	{
//		return new ModelAndView("HomePage");
//	}

	
	

}
