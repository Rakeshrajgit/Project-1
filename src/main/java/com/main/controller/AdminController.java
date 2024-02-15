package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.model.AdminModel;
import com.main.repository.AdminRepo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {


	@Autowired
	AdminRepo am;


	@GetMapping("/adminreg")
	public ModelAndView m1()
	{
		return new ModelAndView("admin/AdminRegister");
	}


	@GetMapping("/adminlogin")
	public ModelAndView m2()
	{
		return new ModelAndView("admin/AdminLogin");
	}


//	@GetMapping("/login")
//	public ModelAndView login()
//	{
//		return new ModelAndView("admin/AdminLogin");
//	}


	@PostMapping("AdminReg")
	public ModelAndView aReg(HttpServletRequest req)
	{
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("pwd");
		
		AdminModel a=new AdminModel(name,email,password);
		am.save(a);
		return new ModelAndView("admin/AdminLogin");
	}
	
	@GetMapping("Lead")
	public ModelAndView lead()
	{
		return new ModelAndView("customer/LeadAdd");
	}
	
	@RequestMapping("LeadInfo")
	public ModelAndView leadinfo()
	{
		return new ModelAndView("customer/LeadInfo");
	}

	@GetMapping("PhoneCall")
	public ModelAndView phone()
	{
		return new ModelAndView("customer/LeadPhoneCall");
	}
	
	
	
	@GetMapping(value ="Dashboard.htm")
	public String Login(HttpServletRequest req)
	{
		return "static/dashboard";
	}

}
