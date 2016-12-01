package com.zrgj.oa.biz.impl;

import com.zrgj.oa.biz.MyPageBiz;
import com.zrgj.oa.dao.MyPageDao;
import com.zrgj.oa.dao.impl.MyPageDaoImpl;
import com.zrgj.oa.entity.Employee;

public class MyPageBizImpl implements MyPageBiz{
	MyPageDao myPageDao=new MyPageDaoImpl();
	/*
	 * 通过页面返回修改电话号码。
	 */
	public int updateMypage(Employee employee) {
		
		return myPageDao.updateMypage(employee);
	}
	
     
}
