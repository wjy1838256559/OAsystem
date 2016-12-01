package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.dao.PerformanceDao;
import com.zrgj.oa.entity.Performance;
import com.zrgj.oa.util.DBUtil;

public class PerformanceDaoImpl implements PerformanceDao {
	EmployeeDao employeeDao=new EmployeeDaoImpl();
	
	
	
	public Performance getById(Integer id) {
		String sql="select * from performance,employee where performance.id=? and employee.state=1";
		Object[] obj={id};
		ResultSet rs=DBUtil.getRes(sql, obj);
		Performance performance=null;
		try {
			while(rs.next()){
				performance=new Performance();
				performance.setId(rs.getInt("id"));
				performance.setExpectNum(rs.getBigDecimal("expectNum"));
				performance.setFinishNum(rs.getBigDecimal("finishNum"));
				performance.setStartDate(rs.getDate("startDate"));
				performance.setEndDate(rs.getDate("endDate"));
				performance.setBonus(rs.getBigDecimal("bonus"));
				performance.setState(rs.getInt("state"));
				performance.setRepState(rs.getInt("repState"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return performance;
	}

	public List<Performance> findAll() {
		return null;
	}
	
	public List<Performance> getListByDate(int pageIndex,int pageSize,String startDate){
		String sql="select employee.id as eId,employee.name,performance.* from performance,employee where performance.eId=employee.id and performance.startDate=? and employee.state=1 order by performance.id desc limit ?,?";
		Object[] obj={startDate,(pageIndex-1)*pageSize,pageSize};
		List<Performance> list=new ArrayList<Performance>();
		Performance performance=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				performance=new Performance();
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

	public int add(Performance entity) {
		String sql="insert into performance(eId,startDate,endDate,expectNum) values(?,?,?,?)";
		Object[] obj={entity.getEmployee().getId(),entity.getStartDate(),entity.getEndDate(),entity.getExpectNum()};
		int result=DBUtil.add_update_delete(sql, obj);
		return result;
	}

	public int update(Performance entity) {
		String sql="update performance set state=1 where id=?";
		Object[] obj={entity.getId()};
		int result=DBUtil.add_update_delete(sql, obj);
		return result;
	}
	
	public int updateRep(Performance performance){
		String sql="update performance set repState=1 where id=?";
		Object[] obj={performance.getId()};
		int result=DBUtil.add_update_delete(sql, obj);
		return result;
	}

	public int delete(Integer id) {
		return 0;
	}

	public List<Performance> getList(int pageIndex, int pageSize) {
		String sql="select employee.id as eId,employee.name,performance.* from performance,employee where employee.id=performance.eId and employee.state=1 order by performance.id desc limit ?,?";
		Object[] obj={(pageIndex-1)*pageSize,pageSize};
		List<Performance> list=new ArrayList<Performance>();
		Performance performance=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				performance=new Performance();
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





	public List<Performance> getListByEmployeeId(int pageIndex, int pageSize,
			int number) {
		String sql="select employee.id as eId,employee.name,performance.* from performance,employee where performance.eId=employee.id and employee.state=1 and employee.number=?  order by performance.id desc limit ?,?";
		Object[] obj={number,(pageIndex-1)*pageSize,pageSize};
		List<Performance> list=new ArrayList<Performance>();
		Performance performance=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				performance=new Performance();
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

	public List<Performance> getListByEmployeeName(int pageIndex, int pageSize,
			String name) {
		String sql="select employee.id as eId,employee.name,performance.* from performance,employee where performance.eId=employee.id and employee.name=? and employee.state=1 order by performance.id desc limit ?,?";
		Object[] obj={name,(pageIndex-1)*pageSize,pageSize};
		List<Performance> list=new ArrayList<Performance>();
		Performance performance=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				performance=new Performance();
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

	public List<Performance> getListByIdAll(int pageIndex, int pageSize,
			int number, String date) {
		String sql="select employee.id as eId,employee.name,performance.* from performance,employee where performance.eId=employee.id and employee.number=? and performance.startDate=? and employee.state=1 order by performance.id desc  limit ?,?";
		Object[] obj={number,date,(pageIndex-1)*pageSize,pageSize};
		List<Performance> list=new ArrayList<Performance>();
		Performance performance=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				performance=new Performance();
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

	public List<Performance> getListByNameAll(int pageIndex, int pageSize,
			String name, String date) {
		String sql="select employee.id as eId,employee.name,performance.* from performance,employee where performance.eId=employee.id and employee.name=? and performance.startDate=? and employee.state=1 order by performance.id desc limit ?,?";
		Object[] obj={name,date,(pageIndex-1)*pageSize,pageSize};
		List<Performance> list=new ArrayList<Performance>();
		Performance performance=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				performance=new Performance();
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

	

	public int getCounts(String sql, Object[] obj) {
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

	public int getPageCounts(int pageSize, String sql, Object[] obj) {
		int count=getCounts(sql,obj);
		if(count%pageSize==0){
			return count/pageSize;
		}
		else
			return count/pageSize+1;
	}

	public int getCount() {
		String sql="select count(*) as counts from performance,employee where performance.eId=employee.id and employee.state=1";
		ResultSet rs=DBUtil.getRes(sql);
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

	public int getPageCount(int pageSize) {
		int count=getCount();
		if(count%pageSize==0){
			return count/pageSize;
		}
		else
			return count/pageSize+1;
	}

	

	

	
	
}
