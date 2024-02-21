package com.main.controller;

import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.model.Customer;
import com.main.service.CrmUserService;
import com.main.service.LeadService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.main.model.LeadForm;
import com.main.repository.LeadRepo;

import jakarta.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;

@Controller
public class LeadController{
	

	@Autowired
	private CrmUserService crmUserService;

	@Autowired
	private LeadService leadService;

	@GetMapping(value ="Lead.htm")
	public String form(HttpServletRequest req)
	{
		req.setAttribute("LeadSourceTypes", leadService.getLeadSource());
		return "lead/LeadAdd";
	}


	@GetMapping("LeadList.htm")
	public String getCustomers(HttpServletRequest req, HttpSession ses) throws Exception {
		try {
			String userType = (String) ses.getAttribute("UserType");
			String userId = (String) ses.getAttribute("userId");
			List<Customer> customerList = new ArrayList<>();
			List<CrmUser> agents = new ArrayList<>();
			if (userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())
					|| userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())){
				agents = crmUserService.getUsersByRole(UserTypes.ROLE_AGENT.toString());
			}
			else {
				agents.add(crmUserService.getUsersByUserId(userId));
			}
			req.setAttribute("Agents", agents);
			req.setAttribute("CustomerList", customerList);
			req.setAttribute("userType", userType);
			return "lead/LeadsList";
		} catch (Exception e) {
			e.printStackTrace();
			return "static/error";
		}
	}

	@PostMapping(value="addlead.htm")
	public String AddLead(HttpServletRequest req)
	{
		 String name= req.getParameter("name");
		 String email= req.getParameter("emial");
		 Long phone = Long.parseLong(req.getParameter("phno"));
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

		leadService.saveLead(lf);

		return "redirect:/LeadList.htm";
	}

}
