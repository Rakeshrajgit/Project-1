package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.model.AdminModel;
import com.main.repository.AdminRepo;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class AdminController {
	
	
	@Autowired
	AdminRepo am;
	
	
	@GetMapping("/adminreg")
	public ModelAndView m1()
	{
		return new ModelAndView("AdminRegister");
	}
	
	
	@GetMapping("/adminlogin")
	public ModelAndView m2()
	{
		return new ModelAndView("AdminLogin");
	}
	
	
	@PostMapping("AdminReg")
	public ModelAndView aReg(HttpServletRequest req)
	{
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("pwd");
		
		AdminModel a=new AdminModel(name,email,password);
		am.save(a);
		return new ModelAndView("AdminLogin");
	}
	
	@GetMapping("Lead")
	public ModelAndView lead()
	{
		return new ModelAndView("LeadAdd");
	}
	
	@RequestMapping("LeadInfo")
	public ModelAndView leadinfo()
	{
		return new ModelAndView("LeadInfo");
	}
	
	
	
	@GetMapping("PhoneCall")
	public ModelAndView phone()
	{
		return new ModelAndView("LeadPhoneCall");
	}
	
	
	
	@GetMapping(value ="/ADLogin")
	public ModelAndView Login(HttpServletRequest req)
	{
		ModelAndView mv = null;
		String em = req.getParameter("email");
		String pw = req.getParameter("password");
		
		if(am.findByEmailAndPassword(em, pw)!=null)
		{
			
			mv= new ModelAndView("dashboard");
		}
		else
		{
			mv = new ModelAndView("AdminLogin");
		}
		
		return mv;
		
	}

}
