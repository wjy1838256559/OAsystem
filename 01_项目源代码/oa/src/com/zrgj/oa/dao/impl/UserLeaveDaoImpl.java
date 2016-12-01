package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.dao.UserLeaveDao;
import com.zrgj.oa.entity.Leave;
import com.zrgj.oa.entity.Leave;
import com.zrgj.oa.util.DBUtil;

public class UserLeaveDaoImpl implements UserLeaveDao {

	public Leave getById(Integer id) {
		String sql="select * from leavelist where id=? and state=1";
		Object[] obj={id};
		ResultSet rs=DBUtil.getRes(sql, obj);
		Leave leave=null;
		EmployeeDao employeeDao=new EmployeeDaoImpl();
		try {
			while(rs.next()){
				leave=new Leave();
				leave.setId(rs.getInt("id"));
				leave.setDate(rs.getDate("date"));
				leave.setState(rs.getInt("state"));
				leave.setReason(rs.getString("reason"));
				leave.setEmployee(employeeDao.getById(rs.getInt("eId")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return leave;
	}
	
	
	public List<Leave> getList(int pageIndex,int pageSize,int id){
		String sql="select leavelist.* from employee,leavelist where employee.id=leavelist.eId and employee.id=? and leavelist.cstate=1 limit ?,?";
		Object[] obj={id,(pageIndex-1)*pageSize,pageSize};
		List<Leave> list=new ArrayList<Leave>();
		EmployeeDao employeeDao=new EmployeeDaoImpl();
		Leave leave=null;
		ResultSet rs=DBUtil.getRes(sql, obj);
		if(rs!=null){
			try {
				while(rs.next()){
					leave=new Leave();
					leave.setId(rs.getInt("id"));
					leave.setDate(rs.getDate("date"));
					leave.setState(rs.getInt("state"));
					leave.setReason(rs.getString("reason"));
					leave.setEmployee(employeeDao.getById(rs.getInt("eId")));
					list.add(leave);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int getCounts(int id) {
		String sql="select count(*) as counts from leavelist,employee where leavelist.eId=employee.id and employee.id=? and leavelist.cstate=1";
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

	public int add(Leave entity) {
		String sql="insert into leavelist(eId,reason,date) values(?,?,?)";
		Object[] obj={entity.getEmployee().getId(),entity.getReason(),entity.getDate()};
		int result=DBUtil.add_update_delete(sql, obj);
		return result;
	}

	public int update(Leave entity) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int delete(Integer id) {
		String sql="update leavelist set cstate=0 where id=?";
		Object[] obj={id};
		return DBUtil.add_update_delete(sql, obj);
	}

}
