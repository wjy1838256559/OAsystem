package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Performance;
/**
 * �û���Ч���ݿ���ʽӿ�
 * @author Administrator
 *
 */
public interface UserPerformanceDao extends BaseDao<Performance>{
	
	public List<Performance> getList(int pageIndex,int pageSize,int id,String startDate);
	
	public List<Performance> getListAll(int pageIndex,int pageSize,int id);
	
	public int getCounts(int id);
	
	public int getPageCounts(int pageSize,int id);
	
	public int getCounts(int id,String startDate);
	
	public int getPageCounts(int pageSize,int id,String startDate);
}
