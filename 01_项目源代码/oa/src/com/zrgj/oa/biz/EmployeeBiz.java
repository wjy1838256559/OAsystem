package com.zrgj.oa.biz;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Employee;

/**
 * @author song
 *
 *	功能:员工业务逻辑层接口
 *
 * 	2016-11-17
 */
public interface EmployeeBiz extends BaseBiz<Employee>{
	
	/**
	 * 分页查询员工信息
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List<Employee> getByPage(Integer pageIndex,Integer pageSize);
	
	/**
	 * 查询员工记录总数
	 * @return
	 */
	public int getCount();
	
	
	/**
	 * 带条件查询分页员工信息
	 */
	public List<Employee> getByPageAddConndition(Integer pageIndex,Integer pageSize,Map map);
	
	/**
	 * 带条件查询总记录数
	 */
	public int getCountAddConndition(Map map);
	
	/**
	
	/**
	 * 初始化密码
	 */
	public int initPwd(Integer id);

	/**
	 * @param userName
	 * @return
	 */
	public Employee getByNumber(String userName);
	
}
