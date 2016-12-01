package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.zrgj.oa.dao.CheckDao;
import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.entity.Check;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.util.DBUtil;

/**
 * @author song
 *
 *	功能:考勤数据库访问实现类
 * 
 *  日期：2016-11-19
 */
public class CheckDaoImpl implements CheckDao {
	
	 EmployeeDao employeeDao=new EmployeeDaoImpl();
		
		
		
		public Check getById(Integer id) {
			String sql="select * from checker,employee where checker.id=? and employee.state=1";
			Object[] obj={id};
			ResultSet rs=DBUtil.getRes(sql, obj);
			Check check=null;
			try {
				while(rs.next()){
					check=new Check();
					check.setId(rs.getInt("id"));
					check.setCheckDate(rs.getDate("checkDate"));
					check.setState(rs.getInt("state"));
					check.setEmployee(employeeDao.getById(rs.getInt("eId")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return check;
		}

		public List<Check> findAll() {
			return null;
		}
		
		public List<Check> getListByDate(int pageIndex,int pageSize,String startDate){
			String sql="select employee.id as eId,employee.name,checker.* from checker,employee where checker.eId=employee.id and checker.checkDate=? and employee.state=1 limit ?,?";
			Object[] obj={startDate,(pageIndex-1)*pageSize,pageSize};
			List<Check> list=new ArrayList<Check>();
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

		public int add(Check entity) {
			String sql="insert into checker(eId,checkDate) values(?,?)";
			Object[] obj={entity.getEmployee().getId(),entity.getCheckDate()};
			int result=DBUtil.add_update_delete(sql, obj);
			return result;
		}

		
		public int update(Check check){
			String sql="update checker set state=1 where id=?";
			Object[] obj={check.getId()};
			int result=DBUtil.add_update_delete(sql, obj);
			return result;
		}

		public int delete(Integer id) {
			return 0;
		}

		public List<Check> getList(int pageIndex, int pageSize) {
			String sql="select employee.id as eId,employee.name,checker.* from checker,employee where employee.id=checker.eId and employee.state=1 limit ?,?";
			Object[] obj={(pageIndex-1)*pageSize,pageSize};
			List<Check> list=new ArrayList<Check>();
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





		public List<Check> getListByEmployeeId(int pageIndex, int pageSize,
				String number) {
			String sql="select employee.id as eId,employee.name,checker.* from checker,employee where checker.eId=employee.id and employee.number=? and employee.state=1 limit ?,?";
			Object[] obj={number,(pageIndex-1)*pageSize,pageSize};
			List<Check> list=new ArrayList<Check>();
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

		public List<Check> getListByEmployeeName(int pageIndex, int pageSize,String name) {
			String sql="select employee.id as eId,employee.name,checker.* from checker,employee where checker.eId=employee.id and employee.name=? and employee.state=1 limit ?,?";
			Object[] obj={name,(pageIndex-1)*pageSize,pageSize};
			List<Check> list=new ArrayList<Check>();
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

		public List<Check> getListByIdAll(int pageIndex, int pageSize,String number, String date) {
			String sql="select employee.id as eId,employee.name,checker.* from checker,employee where checker.eId=employee.id and employee.number=? and checker.checkDate=? and employee.state=1 limit ?,?";
			Object[] obj={number,date,(pageIndex-1)*pageSize,pageSize};
			List<Check> list=new ArrayList<Check>();
			Check check=null;
			ResultSet rs=DBUtil.getRes(sql, obj);
			if(rs!=null){
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
			}
			return list;
		}

		public List<Check> getListByNameAll(int pageIndex, int pageSize,
				String name, String date) {
			String sql="select employee.id as eId,employee.name,checker.* from checker,employee where checker.eId=employee.id and employee.name=? and checker.checkDate=? and employee.state=1 limit ?,?";
			Object[] obj={name,date,(pageIndex-1)*pageSize,pageSize};
			List<Check> list=new ArrayList<Check>();
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
			String sql="select count(*) as counts from checker,employee where checker.eId=employee.id and employee.state=1";
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
	
	private List<Check> rsToList(ResultSet rs) {
		List<Check> checkList=null;
		if(rs!=null){
			checkList=new ArrayList<Check>();
			try {
				while(rs.next()){
					Check check=new Check();
					check.setId(rs.getInt("id"));
					check.setCheckDate(rs.getDate("checkDate"));
					int eId=rs.getInt("eId");
					Employee employee=employeeDao.getById(eId);
					check.setEmployee(employee);
					check.setState(rs.getInt("state"));
					checkList.add(check);
				}
				return checkList;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

	

	public List<Check> getByPage(int pageIndex, int pageSize) {
		String sql="select * from checker,employee where checker.state=1 and employee.state=1 order by checkDate desc limit ?,?";
		ResultSet rs=DBUtil.getRes(sql, (pageIndex-1)*pageSize,pageSize);
		return rsToList(rs);
	}

	public int getCountAddConndition(Map map) {
		int result=0;
		Iterator iterator = map.keySet().iterator();
		StringBuilder sb=new StringBuilder();
		if(iterator!=null && iterator.hasNext()){
			String key=(String) iterator.next();
			String sql="select count(*) as amount from checker,employee where checker.state=1 and employee.state=1";
			sb.append(sql);
			sb.append(" and ").append(key).append(" =").append("'"+map.get(key)+"'");
		}
		ResultSet rs=DBUtil.getRes(sb.toString());
		if(rs!=null){
			try {
				while(rs.next()){
					result=rs.getInt("amount");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public List<Check> getByPageAddConndition(int pageIndex,int pageSize,Map map) {
		Iterator iterator = map.keySet().iterator();
		StringBuilder sb=new StringBuilder();
		if(iterator!=null && iterator.hasNext()){
			String key=(String) iterator.next();
			String sql="select * from checker where state=1";
			sb.append(sql);
			sb.append(" and ").append(key).append(" =").append("'"+map.get(key)+"'").append(" order by checkDate desc").append(" limit ?,?");
		}
		ResultSet rs=DBUtil.getRes(sb.toString(),(pageIndex-1)*pageSize,pageSize);
		return rsToList(rs);
	}

	public List<Check> getByCheckDate(String checkDate) {
		String sql="select * from checker,employee where checker.state=1 and checkDate=? and employee.state=1";
		ResultSet rs=DBUtil.getRes(sql, checkDate);
		return rsToList(rs);
	}

}
