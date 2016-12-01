package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.zrgj.oa.dao.DepartmentDao;
import com.zrgj.oa.entity.Department;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.util.DBUtil;

public class DepartmentDaoImpl implements DepartmentDao {

	public Department getById(Integer id) {
		String sql="select * from department where id=? and state=1";
		Object[] obj={id};
		ResultSet rs=DBUtil.getRes(sql, obj);
		List<Department> dList=rsToDList(rs);
		if(dList!=null && dList.size()>0){
			return dList.get(0);
		}else{
			return null;
		}
	}
	
	public List<Department> getList(int pageIndex,int pageSize){
		String sql="select * from department where state=1 order by id desc limit ?,? ";
		Object[] obj={(pageIndex-1)*pageSize,pageSize};
		ResultSet rs=DBUtil.getRes(sql, obj);
		List<Department> list=rsToDList(rs);
		return list;
	}
	public List<Department> findAll() {
		String sql="select * from department  where state=1 order by id desc";
		ResultSet rs=DBUtil.getRes(sql);
		List<Department> departments=null;
		if(rs!=null){
			departments=new ArrayList<Department>();
			try {
				while(rs.next()){
					Department department=new Department();
					department.setId(rs.getInt("id"));
					department.setdName(rs.getString("dName"));;
					department.setDescription(rs.getString("description"));
					departments.add(department);
				}
				return departments;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

	public int add(Department entity) {
		String sql="insert into department(dName,description,state) values(?,?,1)";
		Object[] obj={entity.getdName(),entity.getDescription()};
		return DBUtil.add_update_delete(sql, obj);
	}

	public int update(Department entity) {
		String sql="update department set dName=?,description=? where id=? ";
		Object []obj={entity.getdName(),entity.getDescription(),entity.getId()};
		return DBUtil.add_update_delete(sql, obj);
	}

	public int delete(Integer id) {
		String sql="update department set state=0 where id=?";
		Object[] obj={id};
		return DBUtil.add_update_delete(sql, obj);
	}
	
	public int getCounts() {
		String sql="select count(*) as counts from department where state=1";
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
	
	public int getCountsAddConndition(Map map) {
		int result=0;
		StringBuilder sql = new StringBuilder(
				"select count(*) as acount from department where 1=1 and state=1");
		Iterator iterator = map.keySet().iterator();
		if (iterator.hasNext()) {
			String key=(String) iterator.next();
			sql.append(" and ").append(key).append(" =")
					.append("'"+map.get(key)+"'");
		}
		ResultSet rs = DBUtil.getRes(sql.toString());
		if(rs!=null){
			try {
				while(rs.next()){
					result=rs.getInt("acount");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public List<Department> getByPageAddConndition(int pageIndex, int pageSize,
			Map map) {
		StringBuilder sql = new StringBuilder(
				"select * from department where 1=1 and state=1");
		Iterator iterator = map.keySet().iterator();
		if (iterator.hasNext()) {
			String key=(String) iterator.next();
			sql.append(" and ").append(key).append(" =")
					.append("'"+map.get(key)+"'");
		}
		sql.append(" order by id desc").append(" limit ?,?");
		ResultSet rs = DBUtil.getRes(sql.toString(),(pageIndex-1)*pageSize,pageSize);
		List<Department> dList = rsToDList(rs);
		return dList;
	}
	
	private List<Department> rsToDList(ResultSet rs){
		if(rs!=null){
			List<Department> dList=new ArrayList<Department>();
			try {
				while(rs.next()){
					Department department=new Department();
					department.setId(rs.getInt("id"));
					department.setdName(rs.getString("dName"));;
					department.setDescription(rs.getString("description"));
					dList.add(department);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return dList;
		}else{
			return Collections.EMPTY_LIST;
		}
	}

	public List<Department> getByName(String dName) {
		String sql="select * from department where state=1 and dName=?";
		ResultSet rs=DBUtil.getRes(sql, dName);
		List<Department> departments=rsToDList(rs);
		return departments;
	}
}
