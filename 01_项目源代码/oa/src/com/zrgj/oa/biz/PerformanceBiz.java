package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Performance;

public interface PerformanceBiz extends BaseBiz<Performance>{
	public int updateRep(Performance performance);
	
	public List<Performance> getList(int pageIndex,int pageSize);

	public List<Performance> getListByDate(int pageIndex, int pageSize, String date);
	
	public List<Performance> getListByEmployeeId(int pageIndex, int pageSize,int id);
	
	public List<Performance> getListByEmployeeName(int pageIndex, int pageSize, String name);
	
	public List<Performance> getListByIdAll(int pageIndex, int pageSize, int id,String date);
	
	public List<Performance> getListByNameAll(int pageIndex, int pageSize, String name,String date);
	
	/**
	 * 获取当前查询信息总数counts
	 */
	public int getCounts(String sql,Object[] obj);
	
	/**
	 * 获取当前查询总页数pageCount
	 */
	public int getPageCounts(int pageSize,String sql,Object[] obj);
	
	public int getCount();
	
	public int getPageCount(int pageSize);
	
}
