package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.zrgj.oa.dao.AdminDao;
import com.zrgj.oa.entity.Admin;
import com.zrgj.oa.util.DBUtil;

public class AdminDaoImpl implements AdminDao {

	/**
	 * 根据userName查询对象
	 * 
	 * @param id
	 * @return
	 */
	public Admin getByUserName(String userName) {
		String sql = "select * from admin where name=?";
		Object[] obj = { userName };
		ResultSet rs = DBUtil.getRes(sql, obj);
		Admin admin = null;
		if (rs != null) {
			try {
				while (rs.next()) {
					admin = new Admin();
					admin.setId(rs.getInt("id"));
					admin.setName(userName);
					admin.setPwd(rs.getString("pwd"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return admin;
	}
}
