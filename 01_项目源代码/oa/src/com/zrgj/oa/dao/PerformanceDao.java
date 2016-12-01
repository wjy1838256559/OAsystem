package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Performance;
/**
 * ��Ч���ݿ���ʽӿ�
 * @author Administrator
 *
 */
public interface PerformanceDao extends BaseDao<Performance>{
	/**
	 * �ı����ѵ�״̬
	 */
	public int updateRep(Performance performance);
	
	public int getCount();
	
	public int getPageCount(int pageSize);
	/**
	 * ��ȡ��ǰҳ���ѯ��Ϣ����
	 */
	public int getCounts(String sql,Object[] obj);
	
	/**
	 * ��ȡ��ǰҳ���ҳ��
	 */
	public int getPageCounts(int pageSize,String sql,Object[] obj);
	
	/**
	 * ��ȡ���еļ�Чʵ��
	 */
	public List<Performance> getList(int pageIndex,int pageSize);
		
	
	
	
	/**
	 * ����������ÿҳ�����Ϳ�ʼʱ������ѯ����ʵ��
	 */
	public List<Performance> getListByDate(int pageIndex,int pageSize,String startDate);
	
	/**
	 * ����������ÿҳ������Ա��������ѯ����ʵ��
	 */
	public List<Performance> getListByEmployeeId(int pageIndex,int pageSize,int id);
	
	/**
	 * ����������ÿҳ������Ա����������ѯ����ʵ��
	 */
	public List<Performance> getListByEmployeeName(int pageIndex,int pageSize,String name);
	
	/**
	 * ����������ÿҳ������Ա��id�ͼ�Ч�·�����ѯ����ʵ��
	 */
	public List<Performance> getListByIdAll(int pageIndex,int pageSize,int id,String date);

	/**
	 * ����������ÿҳ������Ա�������ͼ�Ч�·�����ѯ����ʵ��
	 */
	
	public List<Performance> getListByNameAll(int pageIndex,int pageSize,String name,String date);

	
}
