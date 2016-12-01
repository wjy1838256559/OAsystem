package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Privilege;

/**
 * @author song
 *
 *	����:Ȩ��ҵ���߼��ӿ�
 * 
 *  ���ڣ�2016-11-20
 */
public interface PrivilegeBiz extends BaseBiz<Privilege>{

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
