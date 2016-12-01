package com.zrgj.oa.dao;

import java.util.Collection;
import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Privilege;

/**
 * @author song
 *
 *	����:Ȩ�����ݿ���ʲ�ӿ�
 * 
 *  ���ڣ�2016-11-20
 */
public interface PrivilegeDao extends BaseDao<Privilege>{
	
	/**
	 * ��ѯ���е�Ȩ��
	 */
	public List<Privilege> findAll();
	
	/***
	 * ����һ��Ȩ��id��ѯȨ���б�
	 */
	public List<Privilege> getPrivilegeByIds(Long[] ids);
	
	/**
	 * ��ѯ���еĸ���Ȩ���б�
	 */
	public List<Privilege> getTopList();
	
	/**
	 * ��ѯ����Ȩ�޵�URL
	 */
	public List<String> getAllPrivilegeUrls();
	
	/**
	 * ��ѯ���е���Ȩ���б�
	 */
	public List<Privilege> getChildren(Integer parentId);
	
	/**
	 * ���ݽ�ɫId��ѯ���е�Ȩ��
	 */
	public List<Privilege> getByRoleId(Integer roleId);
}
