package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Reply;

/**
 * @author song
 *
 *	����:�ظ�ҵ���߼���ӿ�
 *
 * 	2016-11-21
 */
public interface ReplyBiz extends BaseBiz<Reply> {

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
	public Integer getCountByTopicId(Integer topicId);
	
}
