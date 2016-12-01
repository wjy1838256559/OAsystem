package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Forum;

/**
 * @author song
 *
 *	功能:板块业务逻辑层接口
 *
 * 	2016-11-21
 */
public interface ForumBiz extends BaseBiz<Forum> {

	/**
	 * 板块上移
	 */
	public void moveUp(Integer forumId);
	
	/**
	 * 板块下移
	 */
	public void moveDown(Integer forumId);
	
	/**
	 * 查询所有带分页
	 */
	public List<Forum> findAllByPage(int pageIndex,int pageSize);
	
	/**
	 * 查询所有的记录数
	 */
	public int getCount();

	/**
	 * @param name
	 * @return
	 */
	public List<Forum> getByName(String name);

}
