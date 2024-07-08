package com.nits.demo.service;

import java.util.List;

import com.nits.demo.entity.employee;

public interface employeeService 
{
	public employee loginProcess(employee emp);
	
	public employee saveEmployee(employee emp);
	
	public List<employee> empList();
	
	public employee fetchempid(int id);
	
	public employee deleteemp(int id);
	
	public employee updateEmployee(employee emp);

}
