package com.zrgj.oa.entity;

import java.util.Date;

/**
 * @author song
 * 
 *         功能:文章实体类
 * 
 *         2016-11-21
 */
public class Article {

	private Integer id;
	private String title;
	private String content;
	private Employee employee;
	private Date postTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

}
