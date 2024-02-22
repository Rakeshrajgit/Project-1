package com.main.controller;

import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.model.Customer;
import com.main.service.CrmUserService;
import com.main.service.LeadIdGenerator;
import com.main.service.LeadService;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.main.model.LeadForm;
import com.main.repository.LeadRepo;

import jakarta.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;


@Slf4j
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
			
			
			List<LeadForm> leadList = new ArrayList<>();
			List<CrmUser> agents = new ArrayList<>();
			
			
			 if (userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())
	                    || userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())) {
	            	
	                userId = req.getParameter("userId");
	                
	                if (userId == null) 
	                {
	                    leadList = leadService.getAllLead();
	                }
	                else if (userId.equalsIgnoreCase("UnAssigned")) {
	                	leadList = leadService.getLeadsIfLeadIdIsNull();
	                }
	                else
	                {
	                    leadList = leadService.getLeadsByLeadId(userId);
	                }
	                agents = crmUserService.getUsersByRole(UserTypes.ROLE_AGENT.toString());
	            }
	            else
	            {
	                agents.add(crmUserService.getUsersByUserId(userId));
	                leadList = leadService.getLeadsByLeadId(userId);
	            }
			req.setAttribute("leadStatusList",leadService.getAllLeadStatus());
			req.setAttribute("Agents", agents);
			req.setAttribute("LeadList", leadList);
			req.setAttribute("userType", userType);
			
			return "lead/LeadsList";
		} catch (Exception e) {
			e.printStackTrace();
			return "static/error";
		}
	}
	
	
	

	@PostMapping(value="addlead.htm")
	public String AddLead(HttpServletRequest req, HttpSession ses)
	{
		List<CrmUser> agents = new ArrayList<>();
		String userId = (String) ses.getAttribute("userId");
		

		 String leadId = LeadIdGenerator.generateLeadId();
		 String name= req.getParameter("name");
		 String email= req.getParameter("email");
		 Long phone = Long.parseLong(req.getParameter("phno"));
		 String location = req.getParameter("location");
		 String source = req.getParameter("source");
		
		
		LeadForm lf = LeadForm.builder()
				.leadId(leadId)
				.leadName(name)
				.leadEmail(email)
				.leadPhoneNo(phone)
				.leadLocation(location)
				.leadAcqCode(source)
				.userId(userId)
				.isActive(1)
				
				.build();

		leadService.saveLead(lf);

		return "redirect:/LeadList.htm";
	}
	
	
	 @PostMapping("UpdateAgentForLead.htm")
	    public @ResponseBody String updateAgentForLead(HttpServletRequest req, HttpSession ses) {
	        try {
	            String appNo = req.getParameter("appNo");
	            String agentId = req.getParameter("agentId");
	            leadService.updateAgentForLead(appNo, agentId);
	            return "Agent assigned successfully !";
	        } catch (Exception e) {
	            log.error(e.getMessage());
	            return "Agent assignment unsuccessful !";
	        }
	    }
	

}
