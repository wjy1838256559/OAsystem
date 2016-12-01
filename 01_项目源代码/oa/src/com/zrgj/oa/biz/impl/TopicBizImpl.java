package com.zrgj.oa.biz.impl;

import java.util.Date;
import java.util.List;

import com.zrgj.oa.biz.TopicBiz;
import com.zrgj.oa.dao.TopicDao;
import com.zrgj.oa.dao.impl.TopicDaoImpl;
import com.zrgj.oa.entity.Topic;

/**
 * @author song
 *
 *	功能:主题业务逻辑层实现类
 *
 * 	2016-11-21
 */
public class TopicBizImpl implements TopicBiz {
	
	private TopicDao topicDao=new TopicDaoImpl();

	public Topic getById(Integer id) {
		return topicDao.getById(id);
	}

	public int add(Topic topic) {
		Date date=new Date();
		topic.setPostTime(date);
		topic.setLastUpdateTime(date);
		topic.setState(1);
		topic.setType(0);
		return topicDao.add(topic);
	}

	public int update(Topic entity) {
		return topicDao.update(entity);
	}

	public int delete(Integer id) {
		return topicDao.delete(id);
	}

	public List<Topic> getByForumId(Integer forumId) {
		return topicDao.getByForumId(forumId);
	}

	public List<Topic> getByForumIdAndPage(Integer forumId, int pageIndex,
			int pageSize) {
		return topicDao.getByForumIdAndPage(forumId, pageIndex, pageSize);
	}

	public Integer getCountByForumId(Integer forumId) {
		return topicDao.getCountByForumId(forumId);
	}

}
