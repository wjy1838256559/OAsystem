package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.biz.ForumBiz;
import com.zrgj.oa.dao.ForumDao;
import com.zrgj.oa.dao.impl.ForumDaoImpl;
import com.zrgj.oa.entity.Forum;

/**
 * @author song
 * 
 *         功能:板块业务逻辑层实现类
 * 
 *         2016-11-21
 */
public class ForumBizImpl implements ForumBiz {

	private ForumDao forumDao = new ForumDaoImpl();

	public Forum getById(Integer id) {
		return forumDao.getById(id);
	}

	public int add(Forum entity) {
		entity.setState(1);
		int position=forumDao.getLastPosition();
		entity.setPosition(position+1);
		return forumDao.add(entity);
	}

	public int update(Forum entity) {
		return forumDao.update(entity);
	}

	public int delete(Integer id) {
		return forumDao.delete(id);
	}

	public void moveUp(Integer forumId) {
		forumDao.moveUp(forumId);
	}

	public void moveDown(Integer forumId) {
		forumDao.moveDown(forumId);
	}

	public List<Forum> findAll() {
		return forumDao.findAll();
	}

	public List<Forum> findAllByPage(int pageIndex, int pageSize) {
		return forumDao.findAllByPage(pageIndex, pageSize);
	}

	public int getCount() {
		return forumDao.getCount();
	}

	public List<Forum> getByName(String name) {
		return forumDao.getByName(name);
	}

}
