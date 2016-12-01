package com.zrgj.oa.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author song
 * 
 *         功能:考勤实体类
 * 
 *         2016-11-16
 */
public class Check implements Serializable {

	private Integer id;
	private int state;
	private Date checkDate;

	private Employee employee;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}


	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
}
