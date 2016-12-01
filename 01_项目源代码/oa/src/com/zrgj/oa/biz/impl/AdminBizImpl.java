package com.zrgj.oa.biz.impl;

import com.zrgj.oa.biz.AdminBiz;
import com.zrgj.oa.dao.AdminDao;
import com.zrgj.oa.dao.impl.AdminDaoImpl;
import com.zrgj.oa.entity.Admin;

public class AdminBizImpl implements AdminBiz {
	AdminDao adminDao=new AdminDaoImpl();
	/**
	 * ����userName��ѯ����
	 * @param id
	 * @return
	 */
	public Admin getByUserName(String userName) {
		return adminDao.getByUserName(userName);
	}

}
