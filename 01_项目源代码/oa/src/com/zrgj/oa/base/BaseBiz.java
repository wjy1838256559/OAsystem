package com.zrgj.oa.base;


/**
 * @author song
 *
 *	����:ҵ���߼������
 *
 * 	2016-11-17
 */
public interface BaseBiz<T> {
	
	/**
	 * ����id��ѯ����
	 * @param id
	 * @return
	 */
	public T getById(Integer id);
	
	/**
	 * ����һ��ʵ��
	 * @param entity
	 * @return
	 */
	public int add(T entity);
	
	/**
	 * ����һ��ʵ��
	 * @param entity
	 * @return
	 */
	public int update(T entity);
	
	/**
	 * ����idɾ��һ��ʵ��
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
}
