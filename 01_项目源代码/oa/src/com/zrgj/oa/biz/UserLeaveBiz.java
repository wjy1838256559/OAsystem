package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Leave;

public interface UserLeaveBiz extends BaseBiz<Leave> {
	
public List<Leave> getList(int pageIndex,int pageSize,int id);
	
	public int getCounts(int id);
	
	public int getPageCounts(int pageSize,int id);
}
