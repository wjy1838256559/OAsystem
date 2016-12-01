package com.zrgj.oa.dao;

import java.util.Collection;
import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Privilege;

/**
 * @author song
 *
 *	功能:权限数据库访问层接口
 * 
 *  日期：2016-11-20
 */
public interface PrivilegeDao extends BaseDao<Privilege>{
	
	/**
	 * 查询所有的权限
	 */
	public List<Privilege> findAll();
	
	/***
	 * 根据一组权限id查询权限列表
	 */
	public List<Privilege> getPrivilegeByIds(Long[] ids);
	
	/**
	 * 查询所有的父级权限列表
	 */
	public List<Privilege> getTopList();
	
	/**
	 * 查询所有权限的URL
	 */
	public List<String> getAllPrivilegeUrls();
	
	/**
	 * 查询所有的子权限列表
	 */
	public List<Privilege> getChildren(Integer parentId);
	
	/**
	 * 根据角色Id查询所有的权限
	 */
	public List<Privilege> getByRoleId(Integer roleId);
}
