package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Performance;

public interface UserPerformanceBiz extends BaseBiz<Performance>{
	
	public List<Performance> getList(int pageIndex,int pageSize,int id,String startDate);
	
	public List<Performance> getListAll(int pageIndex,int pageSize,int id);
	
	public int getCounts(int id);
	
	public int getPageCounts(int pageSize,int id);
	
	public int getCounts(int id,String startDate);
	
	public int getPageCounts(int pageSize,int id,String startDate);
}
