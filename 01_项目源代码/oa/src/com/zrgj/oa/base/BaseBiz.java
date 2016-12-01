package com.zrgj.oa.base;


/**
 * @author song
 *
 *	功能:业务逻辑层基类
 *
 * 	2016-11-17
 */
public interface BaseBiz<T> {
	
	/**
	 * 根据id查询对象
	 * @param id
	 * @return
	 */
	public T getById(Integer id);
	
	/**
	 * 新增一个实体
	 * @param entity
	 * @return
	 */
	public int add(T entity);
	
	/**
	 * 更新一个实体
	 * @param entity
	 * @return
	 */
	public int update(T entity);
	
	/**
	 * 根据id删除一个实体
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
}
