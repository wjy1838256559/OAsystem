package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import com.zrgj.oa.dao.DepartmentDao;
import com.zrgj.oa.dao.StationDao;
import com.zrgj.oa.entity.Station;
import com.zrgj.oa.util.DBUtil;

/**
 * 
 * @author song
 * 
 *         功能:岗位数据访问实现类
 * 
 *         2016-11-18
 */
public class StationDaoImpl implements StationDao {
	
	private DepartmentDao departmentDao=new DepartmentDaoImpl();

	public Station getById(Integer id) {
		String sql = "select * from station where id=? and state=1";
		Object[] obj = { id };
		ResultSet rs = DBUtil.getRes(sql, obj);
		List<Station> stationList=rsToSList(rs);
		if(stationList!=null && stationList.size()>0){
			return stationList.get(0);
		}
		return null;
	}

	public int add(Station entity) {
		String sql = "insert into station(dId,sName,description,state) values(?,?,?,1)";
		Object[] obj = { entity.getDepartment().getId(), entity.getsName(),
				entity.getDescription() };
		return DBUtil.add_update_delete(sql, obj);
	}

	public int update(Station entity) {
		String sql = "update station set dId=?,sName=?,description=? where id=? ";
		Object[] obj = { entity.getDepartment().getId(), entity.getsName(),
				entity.getDescription(), entity.getId() };
		return DBUtil.add_update_delete(sql, obj);
	}

	public int delete(Integer id) {
		String sql = "update station set state=0 where id=?";
		Object[] obj = { id };
		return DBUtil.add_update_delete(sql, obj);
	}

	public List<Station> getStationByPage(int pageindex, int pagesize) {
		String sql = "select * from station where state=1 limit ?,? ";
		Object[] obj = { (pageindex - 1) * pagesize, pagesize };
		ResultSet rs = DBUtil.getRes(sql, obj);
		return rsToSList(rs);
	}

	public int getStationCounts() {
		String sql = "select count(*) as counts from station where state=1";
		ResultSet rs = DBUtil.getRes(sql);
		int counts = 0;
		try {
			while (rs.next()) {
				counts = rs.getInt("counts");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return counts;
	}

	public Station getByName(String stationName) {
		String sql="select * from station where sName=?";
		ResultSet rs=DBUtil.getRes(sql, stationName);
		List<Station> stationList=rsToSList(rs);
		if(stationList!=null && stationList.size()>0){
			return stationList.get(0);
		}
		return null;
	}

	private List<Station> rsToSList(ResultSet rs) {
		if (rs != null) {
			List<Station> stationList = new ArrayList<Station>();
			try {
				while (rs.next()) {
					Station station = new Station();
					int dId = rs.getInt("dId");
					station.setDepartment(departmentDao.getById(dId));
					station.setId(rs.getInt("id"));
					station.setsName(rs.getString("sName"));
					station.setDescription(rs.getString("description"));
					stationList.add(station);
				}
				return stationList;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

	public List<Station> findAll() {
		String sql="select * from station";
		ResultSet rs=DBUtil.getRes(sql);
		return rsToSList(rs);
	}

	public List<Station> getByNameAndDId(String sName, int dId) {
		String sql="select * from station where sName=? and dId=?";
		ResultSet rs=DBUtil.getRes(sql, sName,dId);
		List<Station> stationList=rsToSList(rs);
		return stationList;
	}
}
