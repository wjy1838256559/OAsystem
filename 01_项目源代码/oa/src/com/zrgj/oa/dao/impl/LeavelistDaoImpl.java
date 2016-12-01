package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.dao.LeaveListDao;
import com.zrgj.oa.entity.LeaveList;
import com.zrgj.oa.util.DBUtil;

public class LeavelistDaoImpl implements LeaveListDao{
	public int getLeaveCounts() {
		String sql="select count(*) as counts from leavelist";
		ResultSet rs=DBUtil.getRes(sql);
		int counts=0;
		if(rs!=null){
			try {
				while(rs.next()){
					counts = rs.getInt("counts");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return counts;
	}


	public List<LeaveList> getLeaveByPage(int pageindex, int pagesize) {
			String sql="select * from leavelist order by state asc,date desc LIMIT ?,?";
			Object[] obj={(pageindex-1)*pagesize,pagesize};
			List<LeaveList> leaveList=new ArrayList<LeaveList>();
			ResultSet rs=DBUtil.getRes(sql, obj);
			LeaveList leavelist=null;
			try {
				if(rs!=null){
					while(rs.next()){
						leavelist=new LeaveList();
						EmployeeDao employeeDao=new EmployeeDaoImpl();
						leavelist.setEmployee(employeeDao.getById(rs.getInt("eId")));
						leavelist.setId(rs.getInt("id"));
						leavelist.setDate(rs.getString("date"));
						leavelist.setReason(rs.getString("reason"));
						leavelist.setState(rs.getInt("state"));
						if(leavelist.getState()==1){
							leavelist.setStateName("待审批");
						}else if(leavelist.getState()==2){
							leavelist.setStateName("已通过");
						}else if(leavelist.getState()==3){
							leavelist.setStateName("已拒绝");
						}else{
							leavelist.setStateName("已过期");
						}
						leaveList.add(leavelist);	
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return leaveList;
		}


	public int updateT(Integer id) {
		String sql="update leavelist set state=2 where id=?";
		Object[] obj={id};
		return DBUtil.add_update_delete(sql, obj);
	}


	public int updateJ(Integer id) {
		String sql="update leavelist set state=3 where id=?";
		Object[] obj={id};
		return DBUtil.add_update_delete(sql, obj);
	}


	public int updateH(Integer id) {
		String sql="update leavelist set state=4 where id=?";
		Object[] obj={id};
		return DBUtil.add_update_delete(sql, obj);
	
	   }


	public LeaveList getById(int id) {
		String sql="SELECT * FROM leavelist WHERE id=?";
		Object[] obj={id};
		ResultSet rs=DBUtil.getRes(sql, obj);
		LeaveList leaveList=null;
		try {
			while(rs.next()){
				leaveList=new LeaveList();
				EmployeeDao employeeDao=new EmployeeDaoImpl();
				leaveList.setEmployee(employeeDao.getById(rs.getInt("eId")));
				leaveList.setReason(rs.getString("reason"));
				leaveList.setDate(rs.getString("date"));
				int state=rs.getInt("state");
				leaveList.setState(state);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return leaveList;
	}
	}
