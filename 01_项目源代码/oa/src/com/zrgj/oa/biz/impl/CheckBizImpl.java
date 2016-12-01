package com.zrgj.oa.biz.impl;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.biz.CheckBiz;
import com.zrgj.oa.dao.CheckDao;
import com.zrgj.oa.dao.impl.CheckDaoImpl;
import com.zrgj.oa.entity.Check;

/**
 * @author song
 *
 *	功能:考勤业务逻辑层实现类
 * 
 *  日期：2016-11-19
 */
public class CheckBizImpl implements CheckBiz{
	
	private CheckDao checkDao=new CheckDaoImpl();

	public Check getById(Integer id) {
		return checkDao.getById(id);
	}

	public int add(Check entity) {
		entity.setState(1);
		return checkDao.add(entity);
	}

	public int update(Check entity) {
		return checkDao.update(entity);
	}

	public int delete(Integer id) {
		return checkDao.delete(id);
	}


	public List<Check> getByPage(int pageIndex, int pageSize) {
		return checkDao.getByPage(pageIndex, pageSize);
	}

	public int getCountAddConndition(Map map) {
		return checkDao.getCountAddConndition(map);
	}

	public List<Check> getByPageAddConndition(int pageIndex, int pageSize,
			Map map) {
		return checkDao.getByPageAddConndition(pageIndex, pageSize, map);
	}

	public List<Check> getByCheckDate(String checkDate) {
		return checkDao.getByCheckDate(checkDate);
	}

	public List<Check> getList(int pageIndex, int pageSize) {
		return checkDao.getList(pageIndex, pageSize);
	}

	public List<Check> getListByDate(int pageIndex, int pageSize,
			String startDate) {
		return checkDao.getListByDate(pageIndex, pageSize, startDate);
	}

	public List<Check> getListByEmployeeId(int pageIndex, int pageSize,
			String number) {
		return checkDao.getListByEmployeeId(pageIndex, pageSize, number);
	}

	public List<Check> getListByEmployeeName(int pageIndex, int pageSize,
			String name) {
		return checkDao.getListByEmployeeName(pageIndex, pageSize, name);
	}

	public List<Check> getListByIdAll(int pageIndex, int pageSize, String number,
			String date) {
		return checkDao.getListByIdAll(pageIndex, pageSize, number, date);
	}

	public List<Check> getListByNameAll(int pageIndex, int pageSize,
			String name, String date) {
		return checkDao.getListByNameAll(pageIndex, pageSize, name, date);
	}

	public int getCounts(String sql, Object[] obj) {
		return checkDao.getCounts(sql, obj);
	}

	public int getPageCounts(int pageSize, String sql, Object[] obj) {
		return checkDao.getPageCounts(pageSize, sql, obj);
	}

	public int getCount() {
		return checkDao.getCount();
	}
	
	public int getPageCount(int pageSize) {
		return checkDao.getPageCount(pageSize);
	}

}
