package com.zrgj.oa.dao;

import com.zrgj.oa.entity.Admin;

/**
 * ����Ա���ݿ���ʽӿ�
 * @author Administrator
 *
 */
public interface AdminDao{

	/**
	 * ����userName��ѯ����
	 * @param id
	 * @return
	 */
	public Admin getByUserName(String userName);
	
	
}
