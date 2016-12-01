package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Topic;

/**
 * @author song
 *
 *	����:����ʵ�������ݿ���ʲ�ӿ�
 *
 * 	2016-11-21
 */
public interface TopicDao extends BaseDao<Topic>{
	
	/**
	 * ���ݰ��Id��ѯ���е�����
	 */
	public List<Topic> getByForumId(Integer forumId);
	
	/**
	 * ���ݰ��Id��ѯ���е��������ҳ
	 */
	public List<Topic> getByForumIdAndPage(Integer forumId,int pageIndex,int pageSize);

	/**
	 * ���ݰ��id��ѯ���е���������
	 */
	public int getCountByForumId(Integer forumId);
}
