package com.zrgj.oa.dao;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Employee;

/**
 * @author song
 *
 *	功能:员工数据库访问接口
 *
 * 	2016-11-17
 */
public interface EmployeeDao extends BaseDao<Employee> {
	
	/**
	 * 根据员工号查询对象
	 */
	public Employee getByNumber(String number);
	
	/**
	 * 分页查询实体类信息
	 */
	public List<Employee> getByPage(int pageIndex,int pageSize);
	
	/**
	 * 分页查询带条件
	 */
	public List<Employee> getByPageAddConndition(int pageIndex,int pageSize,Map map);
	
	/**
	 * 查询实体类总数
	 */
	public int getCount();
	
	/**
	 * 根据条件查询实体类总数
	 */
	public int getCountAddConndition(Map map);
	
	/**
	 * 初始化密码
	 */
	public int initPwd(Integer id);

}
