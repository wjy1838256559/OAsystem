package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Forum;

/**
 * @author song
 *
 *	功能:板块数据库访问层接口
 *
 * 	2016-11-21
 */
public interface ForumDao extends BaseDao<Forum> {
	
	/**
	 * 板块上移
	 */
	public void moveUp(Integer forumId);
	
	/**
	 * 板块下移
	 */
	public void moveDown(Integer forumId);
	
	/**
	 * 查询所有
	 */
	public List<Forum> findAll();
	
	/**
	 * 查询所有带分页
	 */
	public List<Forum> findAllByPage(int pageIndex,int pageSize);
	
	/**
	 * 查询所有的记录数
	 */
	public int getCount();
	
	/**
	 * 查询最后一个记录的位置
	 */
	public int getLastPosition();

	/**
	 * @param name
	 * @return
	 */
	public List<Forum> getByName(String name);

}
