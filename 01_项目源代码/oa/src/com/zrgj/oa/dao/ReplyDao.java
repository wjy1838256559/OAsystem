package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Reply;

/**
 * @author song
 *
 *	����:�ظ�ʵ�����ݿ���ʲ�ӿ�
 *
 * 	2016-11-21
 */
public interface ReplyDao extends BaseDao<Reply>{
	
	/**
	 * ��������Id��ѯ���еĻظ�����ҳ
	 */
	public List<Reply> getByTopicId(Integer topicId);

	/**
	 * ��������Id��ѯ���еĻظ�����ҳ
	 */
	public List<Reply> getByTopicIdAndPage(Integer topicId,int pageIndex,int pageSize);
	
	/**
	 * ��������Id��ѯ���лظ�����
	 */
	public int getCountByTopicId(Integer topicId);
	
}
