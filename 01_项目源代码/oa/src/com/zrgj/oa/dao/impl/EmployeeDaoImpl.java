package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;

import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.dao.StationDao;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Station;
import com.zrgj.oa.util.DBUtil;

/**
 * @author song
 * 
 *         功能:员工dao层的是实现类
 * 
 *         2016-11-17
 */
public class EmployeeDaoImpl implements EmployeeDao {
	
	private StationDao stationDao=new StationDaoImpl();

	public Employee getById(Integer id) {
		String sql = "select * from employee where state=1 and id=?";
		ResultSet rs = DBUtil.getRes(sql, id);
		List<Employee> emList = rsToEmList(rs);
		if (emList != null && emList.size() > 0) {
			return emList.get(0);
		}
		return null;
	}

	public List<Employee> findAll() {
		String sql = "select * from employee";
		ResultSet rs = DBUtil.getRes(sql);
		return rsToEmList(rs);
	}

	public int add(Employee entity) {
		String sql = "insert into employee values(null,?,?,?,?,?,null,null,?,?,?,?,?)";
		Integer sId=null;
		if(entity.getStation()!=null){
			sId=entity.getStation().getId();
		}
		Object[] obj = { sId, entity.getNumber(),
				entity.getName(),  entity.getPhoneNumber(),
				entity.getStartDate(),entity.getMoney(),
				entity.getWorkExperience(), entity.getState(),entity.getLoseTime(),entity.getImage() };
		return DBUtil.add_update_delete(sql, obj);
	}

	public int update(Employee entity) {
		String sql = "update employee set sId=?,number=?,name=?,phonenumber=?,startDate=?,endDate=?,pwd=?,money=?,workExperience=?,state=?,loseTime=? where id=?";
		Object[] obj = {
				entity.getStation().getId(),entity.getNumber(),entity.getName(),entity.getPhoneNumber(),entity.getStartDate(),entity.getEndDate(),entity.getPwd(),entity.getMoney(),entity.getWorkExperience(),entity.getState(),entity.getLoseTime(),entity.getId()
		};
		return DBUtil.add_update_delete(sql, obj);
	}

	public int delete(Integer id) {
		Employee employee=getById(id);
		employee.setState(0);
		return update(employee);
	}

	public Employee getByNumber(String number) {
		String sql = "select * from employee where state=1 and number=?";
		ResultSet rs = DBUtil.getRes(sql, number);
		List<Employee> emList = rsToEmList(rs);
		if (emList != null && emList.size() > 0) {
			return emList.get(0);
		}
		return null;
	}

	private List<Employee> rsToEmList(ResultSet rs) {
		if (rs != null) {
			try {
				List<Employee> emList = new ArrayList<Employee>();
				while (rs.next()) {
					Employee employee = new Employee();
					employee.setId(rs.getInt("id"));
					int id=rs.getInt("sId");
					Station station=stationDao.getById(id);
					employee.setStation(station);
					employee.setNumber(rs.getString("number"));
					employee.setName(rs.getString("name"));
					employee.setPwd(rs.getString("pwd"));
					employee.setPhoneNumber(rs.getString("phonenumber"));
					employee.setStartDate(rs.getString("startDate"));
					employee.setEndDate(rs.getString("endDate"));
					employee.setMoney(rs.getBigDecimal("money"));
					employee.setWorkExperience(rs.getString("workExperience"));
					employee.setLoseTime(rs.getInt("loseTime"));
					employee.setImage(rs.getString("image"));
					employee.setState(rs.getInt("state"));
					emList.add(employee);
				}
				return emList;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

	public List<Employee> getByPage(int pageIndex, int pageSize) {
		String sql = "select * from employee where state=?  order by id desc limit ?,?";
		Object[] obj = { 1,(pageIndex - 1) * pageSize, pageSize };
		ResultSet rs = DBUtil.getRes(sql, obj);
		return rsToEmList(rs);
	}

	public int getCount() {
		int result = 0;
		String sql = "select count(*) as acount from employee where state=?";
		ResultSet rs = DBUtil.getRes(sql,1);
		if (rs != null) {
			try {
				while (rs.next()) {
					result = rs.getInt("acount");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public List<Employee> getByPageAddConndition(int pageIndex, int pageSize,
			Map map) {
		StringBuilder sql = new StringBuilder(
				"select * from employee where 1=1 and state=1");
		Iterator iterator = map.keySet().iterator();
		if (iterator.hasNext()) {
			String key=(String) iterator.next();
			sql.append(" and ").append(key).append(" =")
					.append("'"+map.get(key)+"'");
		}
		sql.append(" order by id desc").append(" limit ?,?");
		ResultSet rs = DBUtil.getRes(sql.toString(),(pageIndex-1)*pageSize,pageSize);
		List<Employee> emList = rsToEmList(rs);
		return emList;
	}

	public int getCountAddConndition(Map map) {
		int result=0;
		StringBuilder sql = new StringBuilder(
				"select count(*) as acount from employee where 1=1 and state=1");
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

	public int initPwd(Integer id) {
		Employee employee=getById(id);
		String temp=DigestUtils.md5Hex(new String("000000").getBytes());
		employee.setPwd(temp);
		return update(employee);
	}

}
