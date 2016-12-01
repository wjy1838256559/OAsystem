package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Role;

/**
 * @author song
 *
 *	功能:角色数据库操作层接口
 * 
 *  日期：2016-11-20
 */
public interface RoleDao extends BaseDao<Role>{
	
	/**
	 * 查询所有角色信息
	 */
	public List<Role> findAll();
	
	/**
	 * 根据权限Id查询所有的角色
	 */
	public List<Role> getByPrivilegeId(Integer privilegeId);
	
}
