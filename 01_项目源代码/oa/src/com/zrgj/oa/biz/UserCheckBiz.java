package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Check;

public interface UserCheckBiz extends BaseBiz<Check> {
	public List<Check> getList(int pageIndex,int pageSize,int id,String startDate);
	
	public List<Check> getListAll(int pageIndex,int pageSize,int id);
	
	public int getCounts(int id);
	
	public int getPageCounts(int pageSize,int id);
	
	public int getCounts(int id,String startDate);
	
	public int getPageCounts(int pageSize,int id,String startDate);
}
