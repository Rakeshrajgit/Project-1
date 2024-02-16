package com.main.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.model.AdminModel;
import com.main.model.Application;
import com.main.repository.AdminRepo;
import com.main.repository.AppRepo;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class AppController {
	
	
	
	@Autowired
	AppRepo ar;
	
	@Autowired
	private AdminRepo ar1;
	

	@GetMapping("/welcome")
	public String welcome()
	{
		return "Welcome to Spring Application";
	}
	
	@GetMapping("/")
	public ModelAndView m1()
	{
		return new ModelAndView("Home");
	}
	
	@GetMapping("/AppRegister")
	public ModelAndView m2()
	{
		return new ModelAndView("AppReg");
	}
	
	@PostMapping("/insertapp")
	public ModelAndView m3(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("Home");
		
		String email=req.getParameter("gmail");
		String appno=req.getParameter("applicationNo");
		LocalDate date = LocalDate.parse(req.getParameter("date"));
		String fname= req.getParameter("firstName");
		String lname = req.getParameter("lastName");
		String male = req.getParameter("gender");
		LocalDate dob = LocalDate.parse(req.getParameter("dob")); 
		String cnum = req.getParameter("contactNumber");
		String address = req.getParameter("address");
		String pan = req.getParameter("panNumber");
		String aadhar = req.getParameter("aadharNumber");
		String drive = req.getParameter("drivingLicense");
		String voter = req.getParameter("voterID");
		String amount = req.getParameter("amount");
		String pmt = req.getParameter("paymentMethod");
		String cmtdays = req.getParameter("cmtDays");
		String exename = req.getParameter("executiveName");
		
		Application ap = new Application(email,appno,date,fname,lname,male,dob,cnum,address,pan,aadhar,drive,voter,amount,pmt,cmtdays,exename);
		
		ar.save(ap);
		
		return mv;
	}
	
	@RequestMapping("reg")
	public ModelAndView Alogin()
	{
		return new ModelAndView("Areg");
	}
	
	
	
	
	@RequestMapping("aa")
	public ModelAndView aReg(HttpServletRequest req)
	{
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("pwd");
		String utype=req.getParameter("utype");
		AdminModel am=new AdminModel(name,email,password,utype);
		ar1.save(am);
		return new ModelAndView("Alogin");
	}
	
	@RequestMapping("/log")
	public ModelAndView validate()
	{
		return new ModelAndView("Alogin");
	}
	
	
	@RequestMapping(value ="/logic")
	public ModelAndView LoginUser(HttpServletRequest req)
	
	{
		ModelAndView mv=null;
		String em=req.getParameter("email");
		String pw=req.getParameter("pwd");

	
		if(ar1.findByEmailAndPassword(em, pw)!=null)
			{
				System.out.println("Inside Success "); 
				mv= new ModelAndView("success");
			}
			else 
			{
				System.out.println("Inside login ");
				mv= new ModelAndView("Alogin");
				
			}
			
		return mv;
	
	}
	
}




