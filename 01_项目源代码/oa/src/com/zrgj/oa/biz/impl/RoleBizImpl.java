package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.dao.RoleDao;
import com.zrgj.oa.dao.impl.RoleDaoImpl;
import com.zrgj.oa.entity.Role;

/**
 * @author song
 *
 *	功能:角色业务逻辑层实现类
 * 
 *  日期：2016-11-20
 */
public class RoleBizImpl implements RoleBiz {
	
	private RoleDao roleDao=new RoleDaoImpl();

	public Role getById(Integer id) {
		return roleDao.getById(id);
	}

	public int add(Role entity) {
		return roleDao.add(entity);
	}

	public int update(Role entity) {
		return roleDao.update(entity);
	}

	public int delete(Integer id) {
		return roleDao.delete(id);
	}

	public List<Role> findAll() {
		return roleDao.findAll();
	}

	public List<Role> getByPrivilegeId(Integer privilegeId) {
		return roleDao.getByPrivilegeId(privilegeId);
	}

}
