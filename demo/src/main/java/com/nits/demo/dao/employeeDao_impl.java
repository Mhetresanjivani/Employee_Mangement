package com.nits.demo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nits.demo.entity.employee;

@Repository
public class employeeDao_impl implements employeeDao
{
	@Autowired
	SessionFactory sf;

	@Override
	public employee loginProcess(employee emp)
	{
		employee empl=null;
		Session session=sf.openSession();
		try {
			Query query=session.createQuery("from employee where email=:email And passward=:pass");
			query.setParameter("email", emp.getEmail());
			query.setParameter("pass", emp.getPassward());
			List<employee> list=query.list();
			
			if(!list.isEmpty())
			{
				empl=list.get(0);
				
			}
			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		finally {
			session.close();
		}
		
		return empl;
	}

	@Override
	public employee saveEmployee(employee emp) {
		
		employee employee =null;
		Session ses=sf.openSession();
		Transaction tx=ses.beginTransaction();
		try {
			ses.save(emp);
			tx.commit();
			employee=emp;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			ses.close();
		}
		return employee;

	}

	@Override
	public List<employee> emplist() {
		List <employee> emp=null;
		Session ses=sf.openSession();
	
		try {
			Query query=ses.createQuery("from employee");
			List<employee>list=query.list();
			emp=list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			ses.close();
		}
		return emp;
	}

	@Override
	public employee fetchempid(int id) {
		
		employee employee=null;
		Session ses=sf.openSession();
		Transaction tx=ses.beginTransaction();
		try {
			employee employees=ses.get(employee.class, id);
		employee=employees;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			ses.close();
		}
		return employee;
	}

	@Override
	public employee deleteemp(int id) {
		employee employee=null;
		Session ses=sf.openSession();
		Transaction ts=ses.beginTransaction();
		try {
			employee employees=ses.get(employee.class, id);
			if(employees!=null) {
				ses.delete(employees);
				ts.commit();
				employee=employees;
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			ses.close();
		}
		return employee;
	}

	@Override
	public employee updateEmployee(employee emp) {
		
		employee employee =null;
		Session ses=sf.openSession();
		Transaction tx=ses.beginTransaction();
		try {
			ses.update(emp);
			tx.commit();
			employee=emp;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			ses.close();
		}
		return employee;

	
	}

}
