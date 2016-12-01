package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Forum;
import com.zrgj.oa.entity.Topic;

/**
 * @author song
 * 
 *         ����:����ҵ���߼��ӿ�
 * 
 *         2016-11-21
 */
public interface TopicBiz extends BaseBiz<Topic> {

	/**
	 * ���ݰ��Id��ѯ���е�����
	 */
	public List<Topic> getByForumId(Integer forumId);

	/**
	 * ���ݰ��Id��ѯ���е��������ҳ
	 */
	public List<Topic> getByForumIdAndPage(Integer forumId, int pageIndex,
			int pageSize);

	/**
	 * ���ݰ��id��ѯ���е���������
	 */
	public Integer getCountByForumId(Integer forumId);
}
