package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Role;

/**
 * @author song
 *
 *	功能:角色业务逻辑层接口
 * 
 *  日期：2016-11-20
 */
public interface RoleBiz extends BaseBiz<Role>{
	
	/**
	 * 查询所有角色信息
	 */
	public List<Role> findAll();
	
	/**
	 * 根据权限Id查询所有的角色
	 */
	public List<Role> getByPrivilegeId(Integer privilegeId);

}
