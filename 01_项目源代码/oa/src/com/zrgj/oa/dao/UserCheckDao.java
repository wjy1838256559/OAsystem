package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Check;

/**
 * 用戶考勤数据库访问接口
 * @author Administrator
 *
 */
public interface UserCheckDao extends BaseDao<Check>{
	
	public List<Check> getList(int pageIndex,int pageSize,int id,String startDate);
	
	public List<Check> getListAll(int pageIndex,int pageSize,int id);
	
	public int getCounts(int id);
	
	public int getPageCounts(int pageSize,int id);
	
	public int getCounts(int id,String startDate);
	
	public int getPageCounts(int pageSize,int id,String startDate);
}
