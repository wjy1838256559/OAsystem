package com.zrgj.oa.entity;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author song
 * 
 *         功能:部门实体类
 * 
 *         2016-11-16
 */
public class Department {

	private Integer id;
	private String dName;
	private String description;

	private Set<Station> stationList = new HashSet<Station>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Station> getStationList() {
		return stationList;
	}

	public void setStationList(Set<Station> stationList) {
		this.stationList = stationList;
	}
	
}
