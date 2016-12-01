package com.zrgj.oa.dao;

import com.zrgj.oa.entity.Admin;

/**
 * 管理员数据库访问接口
 * @author Administrator
 *
 */
public interface AdminDao{

	/**
	 * 根据userName查询对象
	 * @param id
	 * @return
	 */
	public Admin getByUserName(String userName);
	
	
}
