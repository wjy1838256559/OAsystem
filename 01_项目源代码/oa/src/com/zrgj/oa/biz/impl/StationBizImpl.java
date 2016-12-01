package com.zrgj.oa.biz.impl;

import java.util.List;

import com.zrgj.oa.biz.StationBiz;
import com.zrgj.oa.dao.StationDao;
import com.zrgj.oa.dao.impl.StationDaoImpl;
import com.zrgj.oa.entity.Station;
/**
 * 
 * @author song
 *
 *	功能:岗位业务逻辑实现类
 *
 * 	2016-11-18
 */
public class StationBizImpl implements StationBiz{
      
	private StationDao stationDao=new StationDaoImpl();
	
	public Station getById(Integer id) {
		return stationDao.getById(id);
	}

	public int add(Station entity) {
		return stationDao.add(entity);
	}

	public int update(Station entity) {
		return stationDao.update(entity);
	}

	public int delete(Integer id) {
		return stationDao.delete(id);
	}

	public List<Station> getStationByPage(int pageindex, int pagesize) {
		return stationDao.getStationByPage(pageindex, pagesize);
	}

	public int getStationCounts() {
		return stationDao.getStationCounts();
	}

	public Station getByName(String stationName) {
		return stationDao.getByName(stationName);
	}

	public List<Station> findAll() {
		return stationDao.findAll();
	}

	public List<Station> getByNameAndDId(String sName, int dId) {
		return stationDao.getByNameAndDId( sName, dId);
	}

}
