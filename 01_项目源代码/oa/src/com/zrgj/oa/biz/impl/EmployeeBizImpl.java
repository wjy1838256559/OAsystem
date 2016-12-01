package com.zrgj.oa.biz.impl;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.dao.impl.EmployeeDaoImpl;
import com.zrgj.oa.entity.Employee;

/**
 * @author song
 * 
 *         功能:员工业务逻辑层的实现类
 * 
 *         2016-11-17
 */
public class EmployeeBizImpl implements EmployeeBiz {

	private EmployeeDao employeeDao = new EmployeeDaoImpl();

	public Employee getById(Integer id) {
		return employeeDao.getById(id);
	}

	public int add(Employee entity) {
		entity.setState(1);
		int result = employeeDao.add(entity);
		if (result > 0) {
			Employee employee = employeeDao.getByNumber(entity.getNumber());
			return employeeDao.initPwd(employee.getId());
		}
		return 0;
	}

	public int update(Employee entity) {
		return employeeDao.update(entity);
	}

	public int delete(Integer id) {
		return employeeDao.delete(id);
	}

	public List<Employee> getByPage(Integer pageIndex, Integer pageSize) {
		return employeeDao.getByPage(pageIndex, pageSize);
	}

	public int getCount() {
		return employeeDao.getCount();
	}

	public int getCountPage(int pageSize) {
		int count = getCount();
		return (count + pageSize - 1) / pageSize;
	}

	public List<Employee> getByPageAddConndition(Integer pageIndex,
			Integer pageSize, Map map) {
		return employeeDao.getByPageAddConndition(pageIndex, pageSize, map);
	}

	public int getCountPageAddConndition(int pageSize, Map map) {
		int count = employeeDao.getCountAddConndition(map);
		return (count + pageSize - 1) / pageSize;
	}

	public int getCountAddConndition(Map map) {
		return employeeDao.getCountAddConndition(map);
	}

	public int initPwd(Integer id) {
		return employeeDao.initPwd(id);
	}

	public Employee getByNumber(String number) {
		return employeeDao.getByNumber(number);
	}

}
