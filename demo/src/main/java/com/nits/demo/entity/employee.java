package com.nits.demo.entity;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class employee 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	int employeeId;
	String employeeName;
	String employeeAddress;
	String employeeDesignation;
	Long mobile;
	String email;
	Double salary;
	String passward;
	String Gender;
	Date dob;
    Date doj;
	String role;
	String Department;
	String Photo;
	String status="Inactive";
	public employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public employee(int employeeId, String employeeName, String employeeAddress, String employeeDesignation,
			Long mobile, String email, Double salary, String passward, String gender, Date dob, Date doj, String role,
			String department, String photo, String status) {
		super();
		this.employeeId = employeeId;
		this.employeeName = employeeName;
		this.employeeAddress = employeeAddress;
		this.employeeDesignation = employeeDesignation;
		this.mobile = mobile;
		this.email = email;
		this.salary = salary;
		this.passward = passward;
		Gender = gender;
		this.dob = dob;
		this.doj = doj;
		this.role = role;
		Department = department;
		Photo = photo;
		this.status = status;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeeAddress() {
		return employeeAddress;
	}
	public void setEmployeeAddress(String employeeAddress) {
		this.employeeAddress = employeeAddress;
	}
	public String getEmployeeDesignation() {
		return employeeDesignation;
	}
	public void setEmployeeDesignation(String employeeDesignation) {
		this.employeeDesignation = employeeDesignation;
	}
	public Long getMobile() {
		return mobile;
	}
	public void setMobile(Long mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Double getSalary() {
		return salary;
	}
	public void setSalary(Double salary) {
		this.salary = salary;
	}
	public String getPassward() {
		return passward;
	}
	public void setPassward(String passward) {
		this.passward = passward;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public Date getDoj() {
		return doj;
	}
	public void setDoj(Date doj) {
		this.doj = doj;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "employee [employeeId=" + employeeId + ", employeeName=" + employeeName + ", employeeAddress="
				+ employeeAddress + ", employeeDesignation=" + employeeDesignation + ", mobile=" + mobile + ", email="
				+ email + ", salary=" + salary + ", passward=" + passward + ", Gender=" + Gender + ", dob=" + dob
				+ ", doj=" + doj + ", role=" + role + ", Department=" + Department + ", Photo=" + Photo + ", status="
				+ status + "]";
	}
	
	
}