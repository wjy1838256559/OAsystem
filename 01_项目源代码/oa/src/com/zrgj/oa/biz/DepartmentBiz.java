package com.zrgj.oa.biz;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Department;

/**
 * ����ҵ���߼��ӿ�
 * @author song
 *
 *	����:
 *
 * 	2016-11-18
 */
public interface DepartmentBiz extends BaseBiz<Department> {
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
	public List<Department> getByPageAddConndition(int pageIndex, int pageSize,Map map);

	/**
	 * ��ѯ���еĲ���
	 * @return
	 */
	public List<Department> findAll();

	/**
	 * @param dName
	 * @return 
	 */
	public List<Department> getByName(String dName);
}
