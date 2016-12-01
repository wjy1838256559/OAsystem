package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.dao.UserCheckDao;
import com.zrgj.oa.entity.Check;
import com.zrgj.oa.util.DBUtil;

public class UserCheckDaoImpl implements UserCheckDao {

	public Check getById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public int add(Check entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int update(Check entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	public List<Check> getList(int pageIndex,int pageSize,int id,String startDate){
		String sql="select checker.* from employee,checker where employee.id=checker.eId and employee.id=? and checker.checkDate=? order by checker.id desc limit ?,?";
		Object[] obj={id,startDate,(pageIndex-1)*pageSize,pageSize};
		List<Check> list=new ArrayList<Check>();
		EmployeeDao employeeDao=new EmployeeDaoImpl();
		Check check=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				check=new Check();
				check.setId(rs.getInt("id"));
				check.setCheckDate(rs.getDate("checkDate"));
				check.setState(rs.getInt("state"));
				check.setEmployee(employeeDao.getById(rs.getInt("eId")));
			    list.add(check);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getCounts(int id,String startDate) {
		String sql="select count(*) as counts from employee,checker where checker.eId=employee.id and employee.id=? and checker.checkDate=? ";
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

	public List<Check> getListAll(int pageIndex, int pageSize,int id) {
		String sql="select checker.* from employee,checker where employee.id=checker.eId and employee.id=? order by checker.id desc limit ?,?";
		Object[] obj={id,(pageIndex-1)*pageSize,pageSize};
		List<Check> list=new ArrayList<Check>();
		EmployeeDao employeeDao=new EmployeeDaoImpl();
		Check check=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		try {
			while(rs.next()){
				check=new Check();
				check.setId(rs.getInt("id"));
				check.setCheckDate(rs.getDate("checkDate"));
				check.setState(rs.getInt("state"));
				check.setEmployee(employeeDao.getById(rs.getInt("eId")));
			    list.add(check);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public int getCounts(int id) {
		String sql="select count(*) as counts from checker,employee where checker.eId=employee.id and employee.id=?";
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
