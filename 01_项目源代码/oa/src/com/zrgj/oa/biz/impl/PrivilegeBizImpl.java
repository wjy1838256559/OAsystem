package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.biz.PrivilegeBiz;
import com.zrgj.oa.dao.PrivilegeDao;
import com.zrgj.oa.dao.impl.PrivilegeDaoImpl;
import com.zrgj.oa.entity.Privilege;

/**
 * @author song
 *
 *	功能:权限业务逻辑层实现类
 * 
 *  日期：2016-11-20
 */
public class PrivilegeBizImpl implements PrivilegeBiz{
	
	private PrivilegeDao privilegeDao=new PrivilegeDaoImpl();

	public Privilege getById(Integer id) {
		return privilegeDao.getById(id);
	}

	public int add(Privilege entity) {
		return privilegeDao.add(entity);
	}

	public int update(Privilege entity) {
		return privilegeDao.update(entity);
	}

	public int delete(Integer id) {
		return 0;
	}

	public List<Privilege> findAll() {
		return privilegeDao.findAll();
	}

	public List<Privilege> getPrivilegeByIds(Long[] ids) {
		return privilegeDao.getPrivilegeByIds(ids);
	}

	public List<Privilege> getTopList() {
		return privilegeDao.getTopList();
	}

	public List<String> getAllPrivilegeUrls() {
		return privilegeDao.getAllPrivilegeUrls();
	}

	public List<Privilege> getChildren(Integer parentId) {
		return privilegeDao.getChildren(parentId);
	}

	public List<Privilege> getByRoleId(Integer roleId) {
		return privilegeDao.getByRoleId(roleId);
	}

}
