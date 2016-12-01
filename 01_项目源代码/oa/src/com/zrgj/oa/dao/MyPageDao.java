package com.zrgj.oa.dao;

import com.zrgj.oa.entity.Employee;
/**
 * 个人中心数据库访问接口
 * @author Administrator
 *
 */
public interface MyPageDao {
	/**
	 * 通过页面返回修改电话号码。
	 */
	public int updateMypage(Employee employee);

}
