package com.zrgj.oa.dao;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Check;

/**
 * @author song
 *
 *	功能:考勤数据库访问接口
 * 
 *  日期：2016-11-19
 */
public interface CheckDao extends BaseDao<Check>{
	
	public Check getById(Integer id);
	
	public List<Check> getList(int pageIndex, int pageSize);
	
	public List<Check> getListByDate(int pageIndex,int pageSize,String startDate);
	
	public List<Check> getListByEmployeeId(int pageIndex, int pageSize,String number);
	
	public List<Check> getListByEmployeeName(int pageIndex, int pageSize,String name);
	
	public List<Check> getListByIdAll(int pageIndex, int pageSize,String number, String date);
	
	public List<Check> getListByNameAll(int pageIndex, int pageSize,String name, String date);
	
	public int getCounts(String sql, Object[] obj);
	
	public int getPageCounts(int pageSize, String sql, Object[] obj) ;
	
	public int getCount();
	
	public int getPageCount(int pageSize) ;
	
	public List<Check> getByPage(int pageIndex,int pageSize);
	
	/**
	 * 带条件查询记录总数
	 */
	public int getCountAddConndition(Map map);
	
	/**
	 * 带条件分页查询考勤信息
	 */
	public List<Check> getByPageAddConndition(int pageIndex,int pageSize,Map map);
	
	/**
	 * 根据签到时间查看考勤信息
	 */
	public List<Check> getByCheckDate(String checkDate);
	
}
