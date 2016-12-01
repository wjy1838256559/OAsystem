package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.biz.UserCheckBiz;
import com.zrgj.oa.dao.UserCheckDao;
import com.zrgj.oa.dao.impl.UserCheckDaoImpl;
import com.zrgj.oa.entity.Check;

public class UserCheckBizImpl implements UserCheckBiz {
	UserCheckDao userCheckDao=new UserCheckDaoImpl();
	public Check getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int add(Check entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(Check entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public List<Check> getList(int pageIndex, int pageSize, int id,
			String startDate) {
		return userCheckDao.getList(pageIndex, pageSize, id, startDate);
	}

	public List<Check> getListAll(int pageIndex, int pageSize, int id) {
		return userCheckDao.getListAll(pageIndex, pageSize, id);
	}

	public int getCounts(int id) {
		return userCheckDao.getCounts(id);
	}

	public int getPageCounts(int pageSize, int id) {
		return userCheckDao.getPageCounts(pageSize, id);
	}

	public int getCounts(int id, String startDate) {
		return userCheckDao.getCounts(id, startDate);
	}

	public int getPageCounts(int pageSize, int id, String startDate) {
		return userCheckDao.getPageCounts(pageSize, id, startDate);
	}
}
