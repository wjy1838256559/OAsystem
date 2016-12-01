package com.zrgj.oa.entity;

/**
 * @author song
 * 
 *         功能:假条实体类
 * 
 *         2016-11-16
 */
public class LeaveList {

	private Integer id;
	private String reason;
	private String date;
	private int state;
	private String stateName;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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

	public LeaveList(Integer id, String reason, String date, int state,
			Employee employee) {
		this.id = id;
		this.reason = reason;
		this.date = date;
		this.state = state;
		this.employee = employee;
	}

	public LeaveList() {
	}

	@Override
	public String toString() {
		return "Leave [id=" + id + ", reason=" + reason + ", date=" + date
				+ ", state=" + state + ", employee=" + employee + "]";
	}

	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	
}
