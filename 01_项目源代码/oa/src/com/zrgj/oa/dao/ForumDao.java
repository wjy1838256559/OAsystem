package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Forum;

/**
 * @author song
 *
 *	����:������ݿ���ʲ�ӿ�
 *
 * 	2016-11-21
 */
public interface ForumDao extends BaseDao<Forum> {
	
	/**
	 * �������
	 */
	public void moveUp(Integer forumId);
	
	/**
	 * �������
	 */
	public void moveDown(Integer forumId);
	
	/**
	 * ��ѯ����
	 */
	public List<Forum> findAll();
	
	/**
	 * ��ѯ���д���ҳ
	 */
	public List<Forum> findAllByPage(int pageIndex,int pageSize);
	
	/**
	 * ��ѯ���еļ�¼��
	 */
	public int getCount();
	
	/**
	 * ��ѯ���һ����¼��λ��
	 */
	public int getLastPosition();

	/**
	 * @param name
	 * @return
	 */
	public List<Forum> getByName(String name);

}
