package com.zrgj.oa.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * @author song
 * 
 *         功能:权限实体类
 * 
 *         2016-11-16
 */
public class Privilege {

	private Integer id;
	private String name;
	private String url;
	
	private Set<Role> roles=new HashSet<Role>();
	private Privilege parent;
	private Set<Privilege> children=new HashSet<Privilege>();

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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Privilege getParent() {
		return parent;
	}

	public void setParent(Privilege parent) {
		this.parent = parent;
	}

	public Set<Privilege> getChildren() {
		return children;
	}

	public void setChildren(Set<Privilege> children) {
		this.children = children;
	}

	public Privilege(String name, String url, Privilege parent) {
		this.name = name;
		this.url = url;
		this.parent = parent;
	}
	
	public Privilege() {}
	
}
