package com.main.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

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
