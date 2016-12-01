package com.zrgj.oa.dao;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Department;

/**
 * �������ݿ���ʽӿ�
 * @author Administrator
 *
 */
public interface DepartmentDao extends BaseDao<Department>{
	
	/**
	 * ��ҳ��ѯ�����б�
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List<Department> getList(int pageIndex,int pageSize);
	
	public int getCounts();
	
	/**
	 * ��ѯ���ż�¼����������
	 * @param map
	 * @return
	 */
	public int getCountsAddConndition(Map map);

	/**
	 * ��ҳ��ѯ������Ϣ������
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
