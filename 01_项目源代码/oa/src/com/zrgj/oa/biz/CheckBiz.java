package com.zrgj.oa.biz;

import java.util.List;
import java.util.Map;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Check;

/**
 * @author song
 *
 *	功能:考勤业务逻辑层接口
 * 
 *  日期：2016-11-19
 */
public interface CheckBiz extends BaseBiz<Check>{
	
public Check getById(Integer id);
	
	public List<Check> getList(int pageIndex, int pageSize);
	
	public List<Check> getListByDate(int pageIndex,int pageSize,String startDate);
	
	public List<Check> getListByEmployeeId(int pageIndex, int pageSize,String number);
	
	public List<Check> getListByEmployeeName(int pageIndex, int pageSize,String name);
	
	public List<Check> getListByIdAll(int pageIndex, int pageSize,String number, String date);
	
	public List<Check> getListByNameAll(int pageIndex, int pageSize,String name, String date);
	
	public int getCounts(String sql, Object[] obj);
	
	public int getPageCounts(int pageSize, String sql, Object[] obj) ;
	
	public int getCount();
	
	public int getPageCount(int pageSize) ;
	
	public List<Check> getByPage(int pageIndex,int pageSize);
	
	public int getCountAddConndition(Map map);
	
	public List<Check> getByPageAddConndition(int pageIndex,int pageSize,Map map);
	
	public List<Check> getByCheckDate(String checkDate);
	
}
