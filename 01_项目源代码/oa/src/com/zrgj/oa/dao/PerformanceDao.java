package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Performance;
/**
 * 绩效数据库访问接口
 * @author Administrator
 *
 */
public interface PerformanceDao extends BaseDao<Performance>{
	/**
	 * 改变提醒的状态
	 */
	public int updateRep(Performance performance);
	
	public int getCount();
	
	public int getPageCount(int pageSize);
	/**
	 * 获取当前页面查询信息总数
	 */
	public int getCounts(String sql,Object[] obj);
	
	/**
	 * 获取当前页面的页数
	 */
	public int getPageCounts(int pageSize,String sql,Object[] obj);
	
	/**
	 * 获取所有的绩效实例
	 */
	public List<Performance> getList(int pageIndex,int pageSize);
		
	
	
	
	/**
	 * 根据索引，每页行数和开始时间来查询所有实体
	 */
	public List<Performance> getListByDate(int pageIndex,int pageSize,String startDate);
	
	/**
	 * 根据索引，每页行数和员工号来查询所有实体
	 */
	public List<Performance> getListByEmployeeId(int pageIndex,int pageSize,int id);
	
	/**
	 * 根据索引，每页行数和员工姓名来查询所有实体
	 */
	public List<Performance> getListByEmployeeName(int pageIndex,int pageSize,String name);
	
	/**
	 * 根据索引，每页行数，员工id和绩效月份来查询所有实体
	 */
	public List<Performance> getListByIdAll(int pageIndex,int pageSize,int id,String date);

	/**
	 * 根据索引，每页行数，员工姓名和绩效月份来查询所有实体
	 */
	
	public List<Performance> getListByNameAll(int pageIndex,int pageSize,String name,String date);

	
}
