package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Forum;

/**
 * @author song
 *
 *	����:���ҵ���߼���ӿ�
 *
 * 	2016-11-21
 */
public interface ForumBiz extends BaseBiz<Forum> {

	/**
	 * �������
	 */
	public void moveUp(Integer forumId);
	
	/**
	 * �������
	 */
	public void moveDown(Integer forumId);
	
	/**
	 * ��ѯ���д���ҳ
	 */
	public List<Forum> findAllByPage(int pageIndex,int pageSize);
	
	/**
	 * ��ѯ���еļ�¼��
	 */
	public int getCount();

	/**
	 * @param name
	 * @return
	 */
	public List<Forum> getByName(String name);

}
