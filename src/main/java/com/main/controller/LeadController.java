package com.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.main.model.LeadForm;
import com.main.repository.LeadRepo;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class LeadController{
	
	@Autowired
	LeadRepo lr;

	
	@GetMapping(value ="Lead.htm")
	public String form(HttpServletRequest req)
	{
		return "customer/LeadAdd";
	}
	
	@PostMapping(value="addlead.htm")
	public String AddLead(HttpServletRequest req)
	{
		 String name= req.getParameter("name");
		 String email= req.getParameter("emial");
		 long phone = Long.parseLong(req.getParameter("phno"));
		 String location = req.getParameter("location");
		 String source = req.getParameter("source");
		 
		
		LeadForm lf = LeadForm.builder()
				.leadName(name)
				.leadEmail(email)
				.leadPhoneNo(phone)
				.leadLocation(location)
				.leadAcqCode(source)
				.isActive(1)
				.build();
		 
//		 LeadForm lf = new LeadForm(name,email,phone,location,source);
		
		lr.save(lf);
		 
		
		
		return "redirect:/CustomerList.htm";
	}

}
