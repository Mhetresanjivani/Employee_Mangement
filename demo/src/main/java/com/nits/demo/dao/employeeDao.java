package com.nits.demo.dao;

import java.util.List;

import com.nits.demo.entity.employee;

public interface employeeDao
{
	public employee loginProcess(employee emp);
	
	public employee saveEmployee(employee emp);
	
	public List<employee> emplist();
	
	public employee fetchempid(int id);
	
	public employee deleteemp(int id);
	
	public employee updateEmployee(employee emp);


}
