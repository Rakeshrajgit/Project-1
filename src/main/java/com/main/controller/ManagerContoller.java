package com.main.controller;

import com.main.model.CrmUser;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerContoller {
	
	@GetMapping("managerReg.htm")
	public String m0()
	{
		return "manager/ManagerReg";
	}
	
	@GetMapping("/Manager")
	public ModelAndView m1()
	{
		return new ModelAndView("manager/managerlogin");
	}
	
	
	@GetMapping("/HomePage")
	public String Login(HttpServletRequest req, HttpSession ses)
	{
		return "static/HomePage";
	}
	
	
	
	
	
//	@GetMapping("/ManagerLogin")
//	public ModelAndView m2()
//	{
//		return new ModelAndView("HomePage");
//	}

	
	

}
