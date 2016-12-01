package com.zrgj.oa.dao;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Employee;

/**
 * @author song
 *
 *	����:Ա�����ݿ���ʽӿ�
 *
 * 	2016-11-17
 */
public interface EmployeeDao extends BaseDao<Employee> {
	
	/**
	 * ����Ա���Ų�ѯ����
	 */
	public Employee getByNumber(String number);
	
	/**
	 * ��ҳ��ѯʵ������Ϣ
	 */
	public List<Employee> getByPage(int pageIndex,int pageSize);
	
	/**
	 * ��ҳ��ѯ������
	 */
	public List<Employee> getByPageAddConndition(int pageIndex,int pageSize,Map map);
	
	/**
	 * ��ѯʵ��������
	 */
	public int getCount();
	
	/**
	 * ����������ѯʵ��������
	 */
	public int getCountAddConndition(Map map);
	
	/**
	 * ��ʼ������
	 */
	public int initPwd(Integer id);

}
