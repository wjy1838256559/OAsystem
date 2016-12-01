package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.biz.UserPerformanceBiz;
import com.zrgj.oa.dao.UserPerformanceDao;
import com.zrgj.oa.dao.impl.UserPerformanceDaoImpl;
import com.zrgj.oa.entity.Performance;

public  class UserPerformanceBizImpl implements UserPerformanceBiz {
	UserPerformanceDao userPerformanceDao=new UserPerformanceDaoImpl();
	public Performance getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int add(Performance entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(Performance entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Performance> getList(int pageIndex, int pageSize, int id,
			String startDate) {
		return userPerformanceDao.getList(pageIndex, pageSize, id, startDate);
	}

	public List<Performance> getListAll(int pageIndex, int pageSize, int id) {
		return userPerformanceDao.getListAll(pageIndex, pageSize, id);
	}

	public int getCounts(int id) {
		return userPerformanceDao.getCounts(id);
	}

	public int getPageCounts(int pageSize, int id) {
		return userPerformanceDao.getPageCounts(pageSize, id);
	}

	public int getCounts(int id, String startDate) {
		return userPerformanceDao.getCounts(id, startDate);
	}

	public int getPageCounts(int pageSize, int id, String startDate) {
		return userPerformanceDao.getPageCounts(pageSize, id, startDate);
	}
	
	
}
