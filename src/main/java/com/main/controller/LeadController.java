package com.main.controller;

import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.model.Customer;
import com.main.service.CrmUserService;
import com.main.service.LeadIdGenerator;
import com.main.service.LeadService;
import com.main.service.LeadServiceUpdate;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	private LeadRepo leadRepo;

	@Autowired
	private CrmUserService crmUserService;

	@Autowired
	private LeadService leadService;
	
	@Autowired
	private LeadServiceUpdate leadserviceupdate;

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
	public String AddLead(HttpServletRequest req , HttpSession ses)
	{
		
		String userId = (String) ses.getAttribute("userId");
		
		 String leadId = LeadIdGenerator.generateLeadId();
		 String name= req.getParameter("name");
		 String email= req.getParameter("email");
		 Long phone = Long.parseLong(req.getParameter("phno"));
		 String location = req.getParameter("location");
		 String source = req.getParameter("source");
		 
		
		LeadForm lf = LeadForm.builder()
				.userId(userId)
				.leadId(leadId)
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
	 
//	 @GetMapping("updatingLead.htm")
//	 public String uLead(HttpServletRequest req, HttpSession ses)
//	 {
//		Long id = Long.parseLong(req.getParameter("leadId"));
//		
//		System.out.println("------------------------------------------");
//		System.out.println(""+id);
//
//		 req.setAttribute("LeadSourceTypes", leadService.getLeadSource());
//		 ses.setAttribute("Lead", id);		
//		 return "lead/UpdateLead";
//		 
//	 }
	 
//	 @PutMapping("updateLead.htm")
//	 public String updateLead(HttpServletRequest req, HttpSession ses)
//	 {
//		
//		 
//		 long lid = (long) ses.getAttribute("Lead");
////		 Long lid = Long.parseLong(req.getParameter("leadId"));
//		 
//		 String userId = (String) ses.getAttribute("userId");
//			
//		 String leadId = LeadIdGenerator.generateLeadId();
//		 String name= req.getParameter("name");
//		 String email= req.getParameter("email");
//		 Long phone = Long.parseLong(req.getParameter("phno"));
//		 String location = req.getParameter("location");
//		 String source = req.getParameter("source");
//		 
//		
//		LeadForm lf = LeadForm.builder()
//				.id(lid)
//				.userId(userId)
//				.leadId(leadId)
//				.leadName(name)
//				.leadEmail(email)
//				.leadPhoneNo(phone)
//				.leadLocation(location)
//				.leadAcqCode(source)
//				.isActive(1)
//				.build();
//		 
//		leadService.saveLead(lf);
//		 
//		 return "redirect:/LeadList.htm";
//	 }
	
	 
	 // Delete Methods
	 
	 @GetMapping("deleteLead.htm")
	 public String deleteLead(HttpServletRequest req)
	 {
		//   String leadId = req.getParameter("leadId");
		 Long Id = Long.parseLong(req.getParameter("leadId"));
		 
		 leadRepo.deleteById(Id);
		 
		 return"redirect:/LeadList.htm"; 
	 }
	 
	 
	 
	 // Update Methods
	 

	    
	    @GetMapping("updatingLead.htm")
	    public String showEditForm( Model model ,HttpServletRequest req) {
	    	
	    	Long id = Long.parseLong(req.getParameter("id"));
	    	req.setAttribute("LeadSourceTypes", leadService.getLeadSource());
	        LeadForm lead = leadserviceupdate.getLeadById(id);
	        model.addAttribute("lead", lead);
	        return "lead/editLead";
	    }
	    

	    @PostMapping("/edit/{id}")
	    public String updateLead(@PathVariable Long id, @ModelAttribute LeadForm updatedLead,HttpServletRequest req) {
	    	leadserviceupdate.updateLead(id, updatedLead,req);
	        return "redirect:/LeadList.htm"; // Redirect to lead list page after updating
	    }

}
