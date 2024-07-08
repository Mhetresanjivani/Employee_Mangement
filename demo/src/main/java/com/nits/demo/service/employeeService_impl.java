package com.nits.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nits.demo.dao.employeeDao;
import com.nits.demo.entity.employee;

@Service
public class employeeService_impl implements employeeService
{

	@Autowired
	employeeDao dao;
	
	@Override
	public employee loginProcess(employee emp) {
		
	employee empl=dao.loginProcess(emp);
	
		return empl;
	}

	@Override
	public employee saveEmployee(employee emp) {
		
		employee employee=dao.saveEmployee(emp);

		return employee;
	}

	@Override
	public List<employee> empList() {
		List<employee> employees=dao.emplist();
		System.out.println("in service"+employees);
		return employees;
	}

	@Override
	public employee fetchempid(int id) {
		employee employees=dao.fetchempid(id);
		return employees;
	}

	@Override
	public employee deleteemp(int id) {
		
		employee employees=dao.deleteemp(id);
		return employees ;
	}

	@Override
	public employee updateEmployee(employee emp) {
    employee employee=dao.updateEmployee(emp);
		return null;
	}

	

}
