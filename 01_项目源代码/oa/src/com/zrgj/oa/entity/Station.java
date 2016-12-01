package com.zrgj.oa.entity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author song
 * 
 *         功能:岗位实体类
 * 
 *         2016-11-16
 */
public class Station {

	private Integer id;
	private String sName;
	private String description;
	private int state;
	
	private Set<Employee> employeeList = new HashSet<Employee>();
	private Department department;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public Set<Employee> getEmployeeList() {
		return employeeList;
	}

	public void setEmployeeList(Set<Employee> employeeList) {
		this.employeeList = employeeList;
	}
	
}
