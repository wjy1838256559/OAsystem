package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Reply;

/**
 * @author song
 *
 *	功能:回复业务逻辑层接口
 *
 * 	2016-11-21
 */
public interface ReplyBiz extends BaseBiz<Reply> {

	/**
	 * 根据主题Id查询所有的回复带分页
	 */
	public List<Reply> getByTopicId(Integer topicId);

	/**
	 * 根据主题Id查询所有的回复带分页
	 */
	public List<Reply> getByTopicIdAndPage(Integer topicId,int pageIndex,int pageSize);
	
	/**
	 * 根据主题Id查询所有回复数量
	 */
	public Integer getCountByTopicId(Integer topicId);
	
}
