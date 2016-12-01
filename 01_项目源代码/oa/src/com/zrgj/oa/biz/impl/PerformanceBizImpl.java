package com.zrgj.oa.biz.impl;

import java.sql.Date;
import java.util.List;

import com.zrgj.oa.biz.PerformanceBiz;
import com.zrgj.oa.dao.PerformanceDao;
import com.zrgj.oa.dao.impl.PerformanceDaoImpl;
import com.zrgj.oa.entity.Performance;

public class PerformanceBizImpl implements PerformanceBiz {
	
		PerformanceDao performanceDao=new PerformanceDaoImpl();
	
		public Performance getById(Integer id) {
		return performanceDao.getById(id);
	}

	public List<Performance> findAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 根据索引，每页行数和绩效表performance中的开始月份来获取Performance实例
	 */
	public List<Performance> getListByDate(int pageIndex, int pageSize,String startDate) {
		return performanceDao.getListByDate(pageIndex,pageSize,startDate);
	}

	public int add(Performance entity) {
		return performanceDao.add(entity);
	}

	public int update(Performance entity) {
		return performanceDao.update(entity);
	}

	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Performance> getList(int pageIndex, int pageSize) {
		return performanceDao.getList(pageIndex, pageSize);
	}
	/**
	 * 根据索引，每页行数和员工id来获取Performance实例
	 */
	public List<Performance> getListByEmployeeId(int pageIndex, int pageSize,
			int id) {
		return performanceDao.getListByEmployeeId(pageIndex, pageSize, id);
	}
	
	/**
	 * 根据索引，每页行数和员工name来获取Performance实例
	 */
	public List<Performance> getListByEmployeeName(int pageIndex, int pageSize,
			String name) {
		return performanceDao.getListByEmployeeName(pageIndex, pageSize, name);
	}

	public List<Performance> getListByIdAll(int pageIndex, int pageSize,
			int id, String date) {
		return performanceDao.getListByIdAll(pageIndex, pageSize, id, date);
	}

	public List<Performance> getListByNameAll(int pageIndex, int pageSize,
			String name, String date) {
		return performanceDao.getListByNameAll(pageIndex, pageSize, name, date);
	}

	

	public int getCounts(String sql,Object[] obj){
		return performanceDao.getCounts(sql, obj);
	}
	
	public int getPageCounts(int pageSize,String sql,Object[] obj){
		return performanceDao.getPageCounts(pageSize, sql, obj);
	}

	public int getCount() {
		return performanceDao.getCount();
	}

	public int getPageCount(int pageSize) {
		return performanceDao.getPageCount(pageSize);
	}
/**
 * 改变提醒的状态
 */
	public int updateRep(Performance performance) {
		return performanceDao.updateRep(performance);
	}

	

	

}
