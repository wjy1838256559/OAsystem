package com.zrgj.oa.biz.impl;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.biz.DepartmentBiz;
import com.zrgj.oa.dao.DepartmentDao;
import com.zrgj.oa.dao.impl.DepartmentDaoImpl;
import com.zrgj.oa.entity.Department;

public class DepartmentBizImpl implements DepartmentBiz {
	DepartmentDao departmentDao=new DepartmentDaoImpl();
	public Department getById(Integer id) {
		return departmentDao.getById(id);
	}
	
	public List<Department> getList(int pageIndex,int pageSize){
		return departmentDao.getList(pageIndex, pageSize);
	}

	public int add(Department entity) {
		return departmentDao.add(entity);
	}

	public int update(Department entity) {
		return departmentDao.update(entity);
	}

	public int delete(Integer id) {
		return departmentDao.delete(id);
	}

	public int getCounts() {
		return departmentDao.getCounts();
	}

	public int getCountsAddConndition(Map map) {
		return departmentDao.getCountsAddConndition(map);
	}

	public List<Department> getByPageAddConndition(int pageIndex, int pageSize,
			Map map) {
		return departmentDao.getByPageAddConndition(pageIndex, pageSize,map);
	}

	public List<Department> findAll() {
		return departmentDao.findAll();
	}

	public List<Department> getByName(String dName) {
		return departmentDao.getByName(dName);
	}


}
