package com.nits.demo.controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
//import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.nits.demo.entity.employee;
import com.nits.demo.service.employeeService;

import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;


@RestController
//@Controller
public class demo 
{
	@Autowired
	employeeService service;
	
	@GetMapping(value="/")
	public ModelAndView login()
	{
		System.out.println("in login page");
		return new ModelAndView("login");
	}

	@PostMapping(value="loginProcess")
	public ModelAndView loginProcess(@ModelAttribute employee emp , HttpSession session)
	{
		System.out.println(emp);
		employee empl=service.loginProcess(emp);
		
		if(empl!=null)
		{
			session.setAttribute("name", empl.getEmployeeName());
			session.setAttribute("Id",empl.getEmployeeId());
			session.setAttribute("role",empl.getRole());
			
			return new ModelAndView("homePage");
		}
		else
		{
          
            return new ModelAndView("login","msg","Invalid email or password");

			

		}
	
	}
		@PostMapping(value="/saveEmployee")
	public ModelAndView saveEmployee(@ModelAttribute employee employee,
									 @RequestParam("Pic") MultipartFile file)
	{
		System.out.println("am in save employyee"+employee);
		
		System.out.println("sanju"+file.getOriginalFilename());
		
		if(file!=null&&!file.isEmpty())
		{
			
			String photoName=genrateUniqeFileName(file.getOriginalFilename());
			System.out.println(photoName);
			employee.setPhoto(photoName);
			try {
				Files.copy(file.getInputStream(),Paths.get("src/main/webapp/resourses/uploads").resolve(photoName));
			} catch (IOException e) {
			
				e.printStackTrace();
			}

		}
		
		System.out.println(employee);
		
		employee emp=service.saveEmployee(employee);
		
		if(emp!=null)
		{
			return new ModelAndView("redirect:/emplist");
		}
		else
		{
			return new ModelAndView("redirect:/emplist");

		}
			
		
	}
	
	
	public String genrateUniqeFileName(String fileName )
	{
		String baseName=FilenameUtils.getBaseName(fileName);
		String getExtenssion=FilenameUtils.getExtension(fileName);
		String timeStamp=String.valueOf(System.currentTimeMillis());
		return baseName+"_"+timeStamp+"."+getExtenssion;
		
	}
	
	
	@GetMapping(value="emplist")
	public ModelAndView emplist()
	{
	   List<employee> employees= service.empList();
		System.out.println(employees);
		
		for(employee emp:employees)
		{
			System.out.println(emp);
		}

	   
		return new ModelAndView("employeeList","list",employees);
	}
	
	@GetMapping(value="/fetchempid/{id}")
	public ModelAndView fetchempid(@PathVariable int id)
	{
		employee employees=service.fetchempid(id);
		return new ModelAndView("redirect:/emplist","id",employees);
			
	}
	
	
	@RequestMapping(value="/deleteemp/{id}")
	public ModelAndView deleteemp(@PathVariable int id)
	{
		employee employees=service.deleteemp(id);
		if(employees!=null) {
			return new ModelAndView("redirect:/emplist");
		}
		else
		{
			return new ModelAndView("redirect:/emplist");

		}
	
	}
	

	@PostMapping(value="/updateEmployee")
    public ModelAndView updateEmployee(@ModelAttribute employee employee,
								 @RequestParam("pic") MultipartFile file)
{
	System.out.println("am in update employee"+employee);
	
	System.out.println("sanju"+file.getOriginalFilename());
	

	
	if(file!=null&&!file.isEmpty())
	{
	
	String photoName=genrateUniqeFileName(file.getOriginalFilename());
	employee.setPhoto(photoName);
	try {
	Files.copy(file.getInputStream(),Paths.get("src/main/webapp/resources/uploads").resolve(photoName));
	} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	}
	
	employee emp=service.updateEmployee(employee);
	
	
	if(emp!=null)
	{
		return new ModelAndView("redirect:/emplist");
	}
	else
	{
		return new ModelAndView("redirect:/emplist");

	}
		
	
}


public String genrateUniqeFileName1(String fileName )
{
	String baseName=FilenameUtils.getBaseName(fileName);
	String getExtenssion=FilenameUtils.getExtension(fileName);
	String timeStamp=String.valueOf(System.currentTimeMillis());
	return baseName+"_"+timeStamp+"."+getExtenssion;
	
}

@GetMapping(value="/getEmpById/{id}")
public ModelAndView getEmpById(@PathVariable int id)
{
	employee employees=service.fetchempid(id);
	return new ModelAndView("profile","employees",employees);
		
}

@GetMapping(value="/logout")
public ModelAndView logout()
{

return new ModelAndView("login");
	

}
}















