package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Role;

/**
 * @author song
 *
 *	����:��ɫҵ���߼���ӿ�
 * 
 *  ���ڣ�2016-11-20
 */
public interface RoleBiz extends BaseBiz<Role>{
	
	/**
	 * ��ѯ���н�ɫ��Ϣ
	 */
	public List<Role> findAll();
	
	/**
	 * ����Ȩ��Id��ѯ���еĽ�ɫ
	 */
	public List<Role> getByPrivilegeId(Integer privilegeId);

}
