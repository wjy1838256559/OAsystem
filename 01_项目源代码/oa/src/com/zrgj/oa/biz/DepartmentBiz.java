package com.zrgj.oa.biz;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Department;

/**
 * 部门业务逻辑接口
 * @author song
 *
 *	功能:
 *
 * 	2016-11-18
 */
public interface DepartmentBiz extends BaseBiz<Department> {
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
	public List<Department> getByPageAddConndition(int pageIndex, int pageSize,Map map);

	/**
	 * 查询所有的部门
	 * @return
	 */
	public List<Department> findAll();

	/**
	 * @param dName
	 * @return 
	 */
	public List<Department> getByName(String dName);
}
