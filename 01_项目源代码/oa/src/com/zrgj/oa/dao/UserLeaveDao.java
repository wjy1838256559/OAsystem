package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Leave;
/**
 * �û��������ݿ���ʽӿ�
 * @author Administrator
 *
 */
public interface UserLeaveDao extends BaseDao<Leave> {
	public List<Leave> getList(int pageIndex,int pageSize,int id);
	
	public int getCounts(int id);
	
	public int getPageCounts(int pageSize,int id);
}
