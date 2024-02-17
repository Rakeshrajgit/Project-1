package com.main.controller;

import com.main.service.CrmUserService;
import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.model.CrmUser;
import com.main.repository.CrmUserRepository;

@Controller
public class AdminController {

	@Autowired
	private CrmUserService crmUserService;

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

	@GetMapping(value="UserReg.htm")
	public String userReg(HttpServletRequest req)
	{
		return "admin/UserReg";
	}
	
	
	@PostMapping("UserReg.htm")
	public String UserReg(HttpServletRequest req)
	{
		 String userName=req.getParameter("username");
		 String userEmail=req.getParameter("email");
		 String password=req.getParameter("password");
		 String role=req.getParameter("role");
		CrmUser crmUser= CrmUser.builder()
				.userName(userName)
				.userEmail(userEmail)
				.password(password)
				.role(role)
				.build();
		crmUserService.saveCrmUser(crmUser);
		return "redirect:/Dashboard.htm";
	}

	@GetMapping(value ="checkUserEmailAlreadyExists.htm")
	public @ResponseBody boolean checkUserEmailAlreadyExists(HttpServletRequest req)
	{
		String newUserEmail = req.getParameter("userEmail");
		return crmUserService.checkUserEmailExists(newUserEmail);
	}

	

}
