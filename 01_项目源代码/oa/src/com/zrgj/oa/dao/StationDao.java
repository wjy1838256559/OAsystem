package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Station;

/**
 * 
 * @author song
 * 
 *         功能:岗位数据访问接口
 * 
 *         2016-11-18
 */
public interface StationDao extends BaseDao<Station> {

	/**
	 * 分页显示岗位信息
	 */
	public List<Station> getStationByPage(int pageindex, int pagesize);

	/**
	 * 获取总容量（总记录数）
	 */

	public int getStationCounts();

	/**
	 * 根据岗位名称查询岗位信息
	 */
	public Station getByName(String stationName);

	/**
	 * 查询所有岗位
	 * @return
	 */
	public List<Station> findAll();

	/**
	 * @param sName
	 * @param dId
	 * @return
	 */
	public List<Station> getByNameAndDId(String sName, int dId);

}
