package com.zrgj.oa.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * @author song
 * 
 *         功能:权限角色实体类
 * 
 *         日期：2016-11-20
 */
public class Role {

	private Integer id;
	private String name;
	private String description;

	private Set<Employee> employeeList = new HashSet<Employee>();
	private Set<Privilege> privilegeList = new HashSet<Privilege>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Employee> getEmployeeList() {
		return employeeList;
	}

	public void setEmployeeList(Set<Employee> employeeList) {
		this.employeeList = employeeList;
	}

	public Set<Privilege> getPrivilegeList() {
		return privilegeList;
	}

	public void setPrivilegeList(Set<Privilege> privilegeList) {
		this.privilegeList = privilegeList;
	}

}
