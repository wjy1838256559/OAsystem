package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.dao.UserPerformanceDao;
import com.zrgj.oa.entity.Performance;
import com.zrgj.oa.util.DBUtil;

public class UserPerformanceDaoImpl implements UserPerformanceDao {
	
	public Performance getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int add(Performance entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(Performance entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Performance> getList(int pageIndex,int pageSize,int id,String startDate){
		String sql="select employee.id as eId,employee.name,performance.* from performance,employee where performance.eId=employee.id and employee.id=? and performance.startDate=? limit ?,?";
		Object[] obj={id,startDate,(pageIndex-1)*pageSize,pageSize};
		List<Performance> list=new ArrayList<Performance>();
		Performance performance=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				performance=new Performance();
				EmployeeDao employeeDao=new EmployeeDaoImpl();
				performance.setId(rs.getInt("id"));
				performance.setExpectNum(rs.getBigDecimal("expectNum"));
				performance.setFinishNum(rs.getBigDecimal("finishNum"));
				performance.setStartDate(rs.getDate("startDate"));
				performance.setEndDate(rs.getDate("endDate"));
				performance.setBonus(rs.getBigDecimal("bonus"));
				performance.setState(rs.getInt("state"));
				performance.setRepState(rs.getInt("repState"));
			    performance.setEmployee(employeeDao.getById(rs.getInt("eId")));
			    list.add(performance);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getCounts(int id,String startDate) {
		String sql="select count(*) as counts from performance,employee where performance.eId=employee.id and employee.id=? and performance.startDate=? ";
		Object[] obj={id,startDate};
		ResultSet rs=DBUtil.getRes(sql,obj);
		int counts=0;
		try {
			while(rs.next()){
				counts = rs.getInt("counts");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return counts;
	}

	public int getPageCounts(int pageSize,int id,String startDate) {
		int count=getCounts(id,startDate);
		if(count%pageSize==0){
			return count/pageSize;
		}
		else
			return count/pageSize+1;
	}

	public List<Performance> getListAll(int pageIndex, int pageSize,int id) {
		String sql="select employee.id as eId,employee.name,performance.* from performance,employee where performance.eId=employee.id and employee.id=? limit ?,?";
		Object[] obj={id,(pageIndex-1)*pageSize,pageSize};
		List<Performance> list=new ArrayList<Performance>();
		Performance performance=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				performance=new Performance();
				EmployeeDao employeeDao=new EmployeeDaoImpl();
				performance.setId(rs.getInt("id"));
				performance.setExpectNum(rs.getBigDecimal("expectNum"));
				performance.setFinishNum(rs.getBigDecimal("finishNum"));
				performance.setStartDate(rs.getDate("startDate"));
				performance.setEndDate(rs.getDate("endDate"));
				performance.setBonus(rs.getBigDecimal("bonus"));
				performance.setState(rs.getInt("state"));
				performance.setRepState(rs.getInt("repState"));
			    performance.setEmployee(employeeDao.getById(rs.getInt("eId")));
			    list.add(performance);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getCounts(int id) {
		String sql="select count(*) as counts from performance,employee where performance.eId=employee.id and employee.id=?";
		Object[] obj={id};
		ResultSet rs=DBUtil.getRes(sql,obj);
		int counts=0;
		try {
			while(rs.next()){
				counts = rs.getInt("counts");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return counts;
	}

	public int getPageCounts(int pageSize,int id) {
		int count=getCounts(id);
		if(count%pageSize==0){
			return count/pageSize;
		}
		else
			return count/pageSize+1;
	}


}
