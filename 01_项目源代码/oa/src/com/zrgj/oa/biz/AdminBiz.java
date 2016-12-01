package com.zrgj.oa.biz;

import com.zrgj.oa.entity.Admin;

public interface AdminBiz {
	/**
	 * 根据userName查询对象
	 * @param id
	 * @return
	 */
	public Admin getByUserName(String userName);
}
