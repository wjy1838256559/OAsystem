package com.zrgj.oa.biz;

import com.zrgj.oa.entity.Admin;

public interface AdminBiz {
	/**
	 * ����userName��ѯ����
	 * @param id
	 * @return
	 */
	public Admin getByUserName(String userName);
}
