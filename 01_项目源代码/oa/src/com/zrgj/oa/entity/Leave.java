package com.zrgj.oa.entity;

import java.util.Date;

/**
 * @author song
 * 
 *         功能:假条实体类
 * 
 *         2016-11-16
 */
public class Leave {

	private Integer id;
	private String reason;
	private Date date;
	private int state;

	private Employee employee;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}


	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
