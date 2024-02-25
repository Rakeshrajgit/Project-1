package com.main.controller;

import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.model.LeadForm;
import com.main.service.LeadService;
import com.main.utils.MyDateTimeUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class LeadController{

	@Autowired
	private LeadService leadService;

	@GetMapping(value ="LeadAdd.htm")
	public String form(HttpServletRequest req)
	{
		req.setAttribute("LeadSourceTypes", leadService.getLeadSource());
		return "lead/LeadAdd";
	}

	@PostMapping(value="LeadAddSubmit.htm")
	public String AddLead(HttpServletRequest req,HttpSession ses)
	{
		String userId = (String) ses.getAttribute("userId");

		String name= req.getParameter("name");
		String email= req.getParameter("email");
		Long phone = Long.parseLong(req.getParameter("phno"));
		String location = req.getParameter("location");
		String source = req.getParameter("source");
		String bound = req.getParameter("bound");
		String selfAssign = req.getParameter("assign_self");
		
		LeadForm lead = LeadForm.builder()
				.leadName(name)
				.leadEmail(email)
				.leadPhoneNo(phone)
				.leadLocation(location)
				.leadAcqCode(source)
				.bound(bound)
				.build();
		if(selfAssign!=null && selfAssign.equalsIgnoreCase("yes")){
			lead.setUserId(userId);
		}

		leadService.saveLead(lead);

		return "redirect:/LeadList.htm";
	}


	@RequestMapping("LeadList.htm")
	public String getLeads(HttpServletRequest req, HttpSession ses) throws Exception {
		try {
			String userType = (String) ses.getAttribute("UserType");
			List<LeadForm> leadList = new ArrayList<>();
			List<CrmUser> agents = new ArrayList<>();

			String start = req.getParameter("lead_added_from");
			String end = req.getParameter("lead_added_to");
			LocalDate startDate = LocalDate.now().minusMonths(1);
			LocalDate endDate = LocalDate.now();
			if(start!=null){
				startDate = LocalDate.parse(MyDateTimeUtils.regularToSqlDate(start));
				endDate = LocalDate.parse(MyDateTimeUtils.regularToSqlDate(end));
			}

			String leadStatusCode = req.getParameter("lead_status_code");
			if(leadStatusCode==null){
				leadStatusCode = "0";
			}

			String userId ="0";
			if (userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())) {
				if (req.getParameter("userId")!=null) {
					userId = req.getParameter("userId");
				}

				agents = leadService.getUsersByRole(UserTypes.ROLE_AGENT.toString());
			}
			else {
				userId = (String) ses.getAttribute("userId");
				agents.add(leadService.getUsersByUserId(userId));
			}
			leadList = leadService.getLeadsOpen(userId,startDate,endDate,leadStatusCode);
			req.setAttribute("leadStatusList",leadService.getAllLeadStatus());
			req.setAttribute("Agents", agents);
			req.setAttribute("leadList", leadList);
			req.setAttribute("userType", userType);

			req.setAttribute("fromDate", startDate.toString());
			req.setAttribute("endDate", endDate.toString());
			req.setAttribute("agentId", userId );
			req.setAttribute("leadStatusCode", leadStatusCode);
			return "lead/LeadsList";
		} catch (Exception e) {
			e.printStackTrace();
			return "static/error";
		}
	}
	
	@PostMapping("UpdateAgentForLead.htm")
	public @ResponseBody String UpdateAgentForLead(HttpServletRequest req, HttpSession ses) {
		try {
			String leadId = req.getParameter("leadId");
			String agentId = req.getParameter("agentId");
			leadService.updateAgentForLead(leadId, agentId);
			return "Agent assigned successfully !";
		} catch (Exception e) {
			log.error(e.getMessage());
			return "Agent assignment unsuccessful !";
		}
	}
	@RequestMapping("LeadEdit.htm")
	public String LeadEdit(Model model , HttpServletRequest req) {

		String leadId = req.getParameter("lead_id");
		LeadForm lead = leadService.getLeadById(leadId);

		req.setAttribute("LeadSourceTypes", leadService.getLeadSource());
		req.setAttribute("lead", lead);
		return "lead/LeadEdit";
	}

	@PostMapping("LeadEditSubmit.htm")
	public String LeadEditSubmit(HttpServletRequest req) {
		String name= req.getParameter("name");
		String email= req.getParameter("email");
		Long phone = Long.parseLong(req.getParameter("phno"));
		String location = req.getParameter("location");
		String source = req.getParameter("source");
		String bound = req.getParameter("bound");
		String leadId = req.getParameter("lead_id");


		LeadForm lead = LeadForm.builder()
				.leadId(leadId)
				.leadName(name)
				.leadEmail(email)
				.leadPhoneNo(phone)
				.leadLocation(location)
				.leadAcqCode(source)
				.bound(bound)
				.build();

		leadService.updateLead(lead);
		return "redirect:/LeadList.htm"; // Redirect to lead list page after updating
	}
}
