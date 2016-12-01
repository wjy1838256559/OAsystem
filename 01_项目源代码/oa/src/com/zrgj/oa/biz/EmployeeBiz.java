package com.zrgj.oa.biz;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Employee;

/**
 * @author song
 *
 *	����:Ա��ҵ���߼���ӿ�
 *
 * 	2016-11-17
 */
public interface EmployeeBiz extends BaseBiz<Employee>{
	
	/**
	 * ��ҳ��ѯԱ����Ϣ
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	public List<Employee> getByPage(Integer pageIndex,Integer pageSize);
	
	/**
	 * ��ѯԱ����¼����
	 * @return
	 */
	public int getCount();
	
	
	/**
	 * ��������ѯ��ҳԱ����Ϣ
	 */
	public List<Employee> getByPageAddConndition(Integer pageIndex,Integer pageSize,Map map);
	
	/**
	 * ��������ѯ�ܼ�¼��
	 */
	public int getCountAddConndition(Map map);
	
	/**
	
	/**
	 * ��ʼ������
	 */
	public int initPwd(Integer id);

	/**
	 * @param userName
	 * @return
	 */
	public Employee getByNumber(String userName);
	
}
