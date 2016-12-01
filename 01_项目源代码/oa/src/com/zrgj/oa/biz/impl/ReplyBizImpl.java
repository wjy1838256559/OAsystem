package com.zrgj.oa.biz.impl;

import java.util.Date;
import java.util.List;

import com.zrgj.oa.biz.ReplyBiz;
import com.zrgj.oa.dao.ReplyDao;
import com.zrgj.oa.dao.impl.ReplyDaoImpl;
import com.zrgj.oa.entity.Reply;

/**
 * @author song
 *
 *	功能:回复业务逻辑层实现类
 *
 * 	2016-11-21
 */
public class ReplyBizImpl implements ReplyBiz {
	
	private ReplyDao replyDao=new ReplyDaoImpl();

	public Reply getById(Integer id) {
		return replyDao.getById(id);
	}

	public int add(Reply reply) {
		reply.setPostTime(new Date());
		return replyDao.add(reply);
	}

	public int update(Reply entity) {
		return replyDao.update(entity);
	}

	public int delete(Integer id) {
		return replyDao.delete(id);
	}

	public List<Reply> getByTopicId(Integer topicId) {
		return replyDao.getByTopicId(topicId);
	}

	public List<Reply> getByTopicIdAndPage(Integer topicId, int pageIndex,
			int pageSize) {
		return replyDao.getByTopicIdAndPage(topicId, pageIndex, pageSize);
	}

	public Integer getCountByTopicId(Integer topicId) {
		return replyDao.getCountByTopicId(topicId);
	}

}
