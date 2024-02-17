package com.main.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.model.Application;
import com.main.repository.AppRepo;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class AppController {

	@Autowired
	private AppRepo appRepo;

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

		appRepo.save(ap);
		
		return mv;
	}
	
	@RequestMapping("reg")
	public ModelAndView Alogin()
	{
		return new ModelAndView("Areg");
	}

	
	@RequestMapping("/log")
	public ModelAndView validate()
	{
		return new ModelAndView("Alogin");
	}


}




