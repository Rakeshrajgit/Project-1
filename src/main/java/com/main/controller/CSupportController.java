package com.main.controller;




import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.main.model.CSupport;
import com.main.repository.CSRepo;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class CSupportController {
	
	@Autowired
	CSRepo cr;
	
	@GetMapping("csupportReg")
	public ModelAndView m1()
	{
		return new ModelAndView("CSReg");
	}
	
	
	
	@PostMapping("csregister")
	public ModelAndView m2(HttpServletRequest req)
	{
		
		Random rd = new Random();
		
		String s = rd+"";
		
		
		String cid=s;
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		ModelAndView mv = new ModelAndView("dashboard");
		
		CSupport cs = new CSupport(cid,name,email,password);
		cr.save(cs);
		 
		return mv;
		
			
	}
	
	
	@GetMapping("CusSupport")
	public ModelAndView m4()
	{
		return new ModelAndView("CSLogin");
	}
	
	
	@GetMapping("csLogin")
	public ModelAndView Login(HttpServletRequest req)
	{
		ModelAndView mv = null;
		String em = req.getParameter("email");
		String pw = req.getParameter("password");
		
		if(cr.findByEmailAndPassword(em, pw)!=null)
		{
			
			mv= new ModelAndView("HomePage");
		}
		else
		{
			mv = new ModelAndView("CSLogin");
		}
		
		return mv;
		  
	}
	
	
	
	

}
