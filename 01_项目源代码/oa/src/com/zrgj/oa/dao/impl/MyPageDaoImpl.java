package com.zrgj.oa.dao.impl;

import com.zrgj.oa.dao.MyPageDao;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.util.DBUtil;

public class MyPageDaoImpl implements MyPageDao{

	public int updateMypage(Employee employee) {
		String sql="UPDATE employee SET phonenumber=?,image=? WHERE number=?";
		Object[] obj={employee.getPhoneNumber(),employee.getImage(),employee.getNumber()};
		int result=DBUtil.add_update_delete(sql, obj);
		return result;
	}

}


