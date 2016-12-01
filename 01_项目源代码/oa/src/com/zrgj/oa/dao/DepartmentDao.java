package com.zrgj.oa.dao;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Department;

/**
 * 部门数据库访问接口
 * @author Administrator
 *
 */
public interface DepartmentDao extends BaseDao<Department>{
	
	/**
	 * 分页查询部门列表
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List<Department> getList(int pageIndex,int pageSize);
	
	public int getCounts();
	
	/**
	 * 查询部门记录总数带条件
	 * @param map
	 * @return
	 */
	public int getCountsAddConndition(Map map);

	/**
	 * 分页查询部门信息带条件
	 * @param pageIndex
	 * @param pageSize
	 * @param map
	 * @return
	 */
	public List<Department> getByPageAddConndition(int pageIndex, int pageSize,
			Map map);
	
	public List<Department> findAll();

	/**
	 * @param dName
	 * @return
	 */
	public List<Department> getByName(String dName);

}
