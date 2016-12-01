package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.biz.UserLeaveBiz;
import com.zrgj.oa.dao.UserLeaveDao;
import com.zrgj.oa.dao.impl.UserLeaveDaoImpl;
import com.zrgj.oa.entity.Leave;

public class UserLeaveBizImpl implements UserLeaveBiz {
	UserLeaveDao userLeaveDao=new UserLeaveDaoImpl();
	public Leave getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int add(Leave entity) {
		return userLeaveDao.add(entity);
	}

	public int update(Leave entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Integer id) {
		return userLeaveDao.delete(id);
	}

	public List<Leave> getList(int pageIndex, int pageSize,int id) {
		return userLeaveDao.getList(pageIndex, pageSize,id);
	}

	public int getCounts(int id) {
		return userLeaveDao.getCounts(id);
	}

	public int getPageCounts(int pageSize,int id) {
		return userLeaveDao.getPageCounts(pageSize,id);
	}

}
