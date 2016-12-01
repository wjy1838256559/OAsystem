package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Station;
/**
 * 
 * @author song
 *
 *	功能:岗位逻辑接口
 *
 * 	2016-11-18
 */
public interface StationBiz extends BaseBiz<Station>  {

	/**
	 * 分页显示学生信息
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
	 */
	public List<Station> findAll();

	/**
	 * @param sName
	 * @param dId
	 * @return
	 */
	public List<Station> getByNameAndDId(String sName, int dId);

}