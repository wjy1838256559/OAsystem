package com.zrgj.oa.biz.impl;

import com.zrgj.oa.biz.AdminBiz;
import com.zrgj.oa.dao.AdminDao;
import com.zrgj.oa.dao.impl.AdminDaoImpl;
import com.zrgj.oa.entity.Admin;

public class AdminBizImpl implements AdminBiz {
	AdminDao adminDao=new AdminDaoImpl();
	/**
	 * 根据userName查询对象
	 * @param id
	 * @return
	 */
	public Admin getByUserName(String userName) {
		return adminDao.getByUserName(userName);
	}

}
