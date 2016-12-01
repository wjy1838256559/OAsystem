package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Role;

/**
 * @author song
 *
 *	����:��ɫ���ݿ������ӿ�
 * 
 *  ���ڣ�2016-11-20
 */
public interface RoleDao extends BaseDao<Role>{
	
	/**
	 * ��ѯ���н�ɫ��Ϣ
	 */
	public List<Role> findAll();
	
	/**
	 * ����Ȩ��Id��ѯ���еĽ�ɫ
	 */
	public List<Role> getByPrivilegeId(Integer privilegeId);
	
}
