package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.model.Customer;
import com.main.repository.CustomerRepo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	@Autowired
	CustomerRepo cr;

	@GetMapping("/WC")
	public String welcome()
	{
		return "Welcome to Customer";
	}
	
	@GetMapping("/register")
	public ModelAndView m1()
	{
		return new ModelAndView("customer/CustomerReg");
	}
	
	
	
	
	@PostMapping("/insertCustomer")
	public ModelAndView m2(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("Success");
		
		
		String fname = req.getParameter("fname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		
		Customer c = new Customer(email,fname,phone);
		
		cr.save(c);
		
		return mv;
		
	}
	
	
	
	
}
