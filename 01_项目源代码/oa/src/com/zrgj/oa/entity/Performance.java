package com.zrgj.oa.entity;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author song
 * 
 *         功能:绩效实体类
 * 
 *         2016-11-16
 */
public class Performance {

	private Integer id;
	private BigDecimal expectNum;
	private BigDecimal finishNum;
	private Date startDate;
	private Date endDate;
	private BigDecimal bonus;
	private int state;
	private int repState;
	
	private Employee employee;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public BigDecimal getExpectNum() {
		return expectNum;
	}

	public void setExpectNum(BigDecimal expectNum) {
		this.expectNum = expectNum;
	}

	public BigDecimal getFinishNum() {
		return finishNum;
	}

	public void setFinishNum(BigDecimal finishNum) {
		this.finishNum = finishNum;
	}


	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getRepState() {
		return repState;
	}

	public void setRepState(int repState) {
		this.repState = repState;
	}

	public BigDecimal getBonus() {
		return bonus;
	}

	public void setBonus(BigDecimal bonus) {
		this.bonus = bonus;
	}
	
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}



}
