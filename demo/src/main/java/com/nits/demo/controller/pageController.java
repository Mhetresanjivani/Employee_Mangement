package com.nits.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class pageController 
{
	@GetMapping(value="/home")
	public String home()
	{
       return "home";		
	}
	
	@GetMapping(value="/addEmployee")
	public String addEmployee()
	{
		return "addEmployee";
	}
	
	@GetMapping(value="/profile")
	public String proEmployee()
	{
		return "profile";
	}

	

}
    