package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.biz.LeaveListBiz;
import com.zrgj.oa.dao.LeaveListDao;
import com.zrgj.oa.dao.impl.LeavelistDaoImpl;
import com.zrgj.oa.entity.LeaveList;
import com.zrgj.oa.util.DBUtil;

public class LeaveListBizImpl implements LeaveListBiz {
          LeaveListDao leaveDao=new LeavelistDaoImpl();
	public List<LeaveList> getLeaveByPage(int pageindex, int pagesize) {
		
		return leaveDao.getLeaveByPage(pageindex, pagesize);
	}

	public int getLeaveCounts() {
		
		return leaveDao.getLeaveCounts();
	}
 
	public int updateT(Integer id) {
		return leaveDao.updateT(id);
	}
	
	public int updateJ(Integer id) {
		return leaveDao.updateJ(id);
	}
	
	public int updateH(Integer id) {
	return leaveDao.updateH(id);
	}

	public LeaveList getById(int id) {
		return leaveDao.getById(id);
	}
}
