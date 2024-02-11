package com.main.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.model.Application;
import com.main.repository.AppRepo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AppController {

	@Autowired
	AppRepo ar;

	@GetMapping("/welcome")
	public String welcome()
	{
		return "Welcome to Spring Application";
	}
	
	@GetMapping("/AppRegister")
	public ModelAndView m2()
	{
		return new ModelAndView("customer/AppReg");
	}
	
	@PostMapping("/insertapp")
	public ModelAndView m3(HttpServletRequest req)
	{
		ModelAndView mv = new ModelAndView("customer/Home");
		
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
	
//	@RequestMapping
//	public ModelAndView login(HttpServletRequest req)
//	{
//		ModelAndView mv = null;
//		
//		String gmail = req.getParameter("gmail");
//		String fname = req.getParameter("firstName");
//		
//		if(ar.login(fname, gmail)!=null)
//		{
//			mv = new ModelAndView("success");
//		}
//		else
//		{
//			mv = new ModelAndView("AppReg");
//		}
//		
//		return mv;
//	}
}




