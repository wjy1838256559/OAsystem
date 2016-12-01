package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Forum;
import com.zrgj.oa.entity.Topic;

/**
 * @author song
 * 
 *         功能:主题业务逻辑接口
 * 
 *         2016-11-21
 */
public interface TopicBiz extends BaseBiz<Topic> {

	/**
	 * 根据板块Id查询所有的主题
	 */
	public List<Topic> getByForumId(Integer forumId);

	/**
	 * 根据板块Id查询所有的主题带分页
	 */
	public List<Topic> getByForumIdAndPage(Integer forumId, int pageIndex,
			int pageSize);

	/**
	 * 根据板块id查询所有的主题数量
	 */
	public Integer getCountByForumId(Integer forumId);
}
