package com.zrgj.oa.entity;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author song
 * 
 *         功能:员工实体类
 * 
 *         2016-11-16
 */
public class Employee {

	private Integer id;
	private String number;
	private String name;
	private String phoneNumber;
	private String pwd;
	private BigDecimal money;
	private int state;
	private String startDate;
	private String endDate;
	private String workExperience;
	private int loseTime;
	private String image;

	private Station station;
	private Performance performance;
	private Set<Check> checkList = new HashSet<Check>();
	private Set<Role> roleList=new HashSet<Role>();
	
	public boolean hasPrivilegeByName(String name){
		for(Role role:roleList){
			for(Privilege privilege:role.getPrivilegeList()){
				if(privilege.getName().equals(name)){
					return true;
				}
			}
		}
		return false;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public BigDecimal getMoney() {
		return money;
	}

	public void setMoney(BigDecimal money) {
		this.money = money;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(String workExperience) {
		this.workExperience = workExperience;
	}
	
	public int getLoseTime() {
		return loseTime;
	}

	public void setLoseTime(int loseTime) {
		this.loseTime = loseTime;
	}
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Station getStation() {
		return station;
	}

	public void setStation(Station station) {
		this.station = station;
	}

	public Performance getPerformance() {
		return performance;
	}

	public void setPerformance(Performance performance) {
		this.performance = performance;
	}

	public Set<Check> getCheckList() {
		return checkList;
	}

	public void setCheckList(Set<Check> checkList) {
		this.checkList = checkList;
	}

	public Set<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(Set<Role> roleList) {
		this.roleList = roleList;
	}
	
}
