package com.main.controller;

import com.main.service.AdminService;

import com.main.service.CrmUserService;
import com.main.service.UserServiceUpdate;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.model.LeadForm;
import com.main.repository.AdminRepo;


@Controller
public class AdminController {

	@Autowired
	private AdminRepo adminrepo;
	@Autowired
	private AdminService adminservive;
	
	@Autowired
	private CrmUserService crmUserService;
	
	@Autowired
	private UserServiceUpdate userserviceupdate;

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
				.isActive(1)
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

	@GetMapping("AddUser.htm")
	public String Adduser(HttpServletRequest req, HttpSession ses) throws Exception {
		try {
			String userType = (String) ses.getAttribute("UserType");
			req.setAttribute("userType", userType);
			return "admin/UserReg";
		} catch (Exception e) {
			return "static/error";
		}
	}
	
	
	// Admin List 
	
	
	
	 @GetMapping("UserList.htm")
	    public String getCustomers(HttpServletRequest req, HttpSession ses) throws Exception {
	        try {
	            String userType = (String) ses.getAttribute("UserType");
	            String userId = (String) ses.getAttribute("userId");
	            List<CrmUser> adminList = new ArrayList<>();
	            List<CrmUser> agents = new ArrayList<>();
	            if (userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())
	                   ) {
	            	
	                userId = req.getParameter("userId");
	                
	                if (userId == null) 
	                {
	                    adminList = adminservive.getAllUsers();
	                }
	                else if (userId.equalsIgnoreCase("UnAssigned")) {
	                	adminList = adminservive.getUsersIfUserIdIsNull();
	                }
	                else
	                {
	                	adminList = adminservive.getUsersByUserId(userId);
	                }
	                agents = crmUserService.getUsersByRole(UserTypes.ROLE_AGENT.toString());
	            }
	            else
	            {
	                agents.add(crmUserService.getUsersByUserId(userId));
	                adminList = adminservive.getUsersByUserId(userId);
	            }
	            
	           
	            req.setAttribute("Agents", agents);
	            req.setAttribute("AdminList", adminList);
	            req.setAttribute("userType", userType);
	            return "admin/UserList";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "static/error";
	        }
	    }
	 
	 // Delete Method
	 
	 
	 @GetMapping("deleteUser.htm")
	 public String deleteLead(HttpServletRequest req)
	 {
		//   String leadId = req.getParameter("leadId");
		 Long Id = Long.parseLong(req.getParameter("UserId"));
		 
		 adminrepo.deleteById(Id);
		 
		 return"redirect:/UserList.htm"; 
	 }
	 
	 
	 //Updating User Methods
	 
	 
	 
	  @GetMapping("updatingUser.htm")
	    public String showEditForm( Model model ,HttpServletRequest req) {
	    	
	    	Long id = Long.parseLong(req.getParameter("id"));
	    	
	        CrmUser user = userserviceupdate.getUserById(id);
	        model.addAttribute("user", user);
	        return "admin/UpdateUser";
	    }
	  
	  @PostMapping("/editing/{id}")
	    public String updateUser(@PathVariable Long id, @ModelAttribute CrmUser updatedUser,HttpServletRequest req) {
		  userserviceupdate.updateUser(id, updatedUser,req);
	        return "redirect:/UserList.htm"; // Redirect to lead list page after updating
	    }


}
