package com.main.controller;

import com.main.configs.enums.UserTypes;
import com.main.model.CrmUser;
import com.main.service.CrmUserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;


@Controller
public class AdminController {

	@Autowired
	private CrmUserService crmUserService;

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
	public String UserReg(HttpServletRequest req, RedirectAttributes redir,HttpSession ses)
	{
		String role=req.getParameter("role");
		String userType = (String) ses.getAttribute("UserType");
		if(userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString()  )){
			if(role.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())){
				redir.addAttribute("failureMessage", "Admin cannot add another Admin");
				return "redirect:/UserList.htm";
			}
		}
		if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())  ){
			if(role.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || role.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())){
				redir.addAttribute("failureMessage", "Manager cannot add Manager (or) Admin");
				return "redirect:/UserList.htm";
			}
		}

		String userName=req.getParameter("username");
		 String userEmail=req.getParameter("email");
		 String password=req.getParameter("password");

		 CrmUser crmUser= CrmUser.builder()
				.userName(userName)
				.userEmail(userEmail)
				.password(password)
				.role(role)
				.isActive(1)
				.build();
		crmUser = crmUserService.saveCrmUser(crmUser);

		if (crmUser != null) {
			redir.addAttribute("successMessage", "User added Successfully");
		} else {
			redir.addAttribute("failureMessage", "User adding Unsuccessful");
		}
		return "redirect:/UserList.htm";
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
	    public String UserList(HttpServletRequest req, HttpSession ses) throws Exception {
	        try {
	            String userType = (String) ses.getAttribute("UserType");
	            List<CrmUser> adminList = new ArrayList<>();
	            if (userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())
				|| userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())) {
	                adminList = crmUserService.getAllUsers();
				}

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
	 public String deleteLead(HttpServletRequest req, RedirectAttributes redir)
	 {
		 String userId = req.getParameter("userId");
		 long result = crmUserService.deleteUser(userId);
		 if (result!=0) {
			 redir.addAttribute("successMessage", "User Deleted Successfully");
		 } else {
			 redir.addAttribute("failureMessage", "User Delete Unsuccessful");
		 }
		 return"redirect:/UserList.htm"; 
	 }

	 //Updating User Methods

	  @GetMapping("updatingUser.htm")
	    public String showEditForm( Model model ,HttpServletRequest req) {

		  String userId = req.getParameter("userId");
		  CrmUser user = crmUserService.getUsersByUserId(userId);
		  req.setAttribute("user", user);
	        return "admin/UpdateUser";
	    }
	  
	  @PostMapping("UserEditSubmit.htm")
	    public String updateUser(HttpServletRequest req, RedirectAttributes redir) {
		  String userName=req.getParameter("username");
		  String userEmail=req.getParameter("email");
		  String password=req.getParameter("password");
		  String role=req.getParameter("role");
		  String userId = req.getParameter("userId");

		  CrmUser crmUser= CrmUser.builder()
				  .userId(userId)
				  .userName(userName)
				  .userEmail(userEmail)
				  .password(password)
				  .role(role)
				  .isActive(1)
				  .build();

		  long result = crmUserService.updateUser(crmUser);
		  if (result!=0) {
			  redir.addAttribute("successMessage", "User updated Successfully");
		  } else {
			  redir.addAttribute("failureMessage", "User update Unsuccessful");
		  }
	        return "redirect:/UserList.htm"; // Redirect to lead list page after updating
	    }


}
