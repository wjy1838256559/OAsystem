package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.base.BaseDao;
import com.zrgj.oa.entity.Station;

/**
 * 
 * @author song
 * 
 *         ����:��λ���ݷ��ʽӿ�
 * 
 *         2016-11-18
 */
public interface StationDao extends BaseDao<Station> {

	/**
	 * ��ҳ��ʾ��λ��Ϣ
	 */
	public List<Station> getStationByPage(int pageindex, int pagesize);

	/**
	 * ��ȡ���������ܼ�¼����
	 */

	public int getStationCounts();

	/**
	 * ���ݸ�λ���Ʋ�ѯ��λ��Ϣ
	 */
	public Station getByName(String stationName);

	/**
	 * ��ѯ���и�λ
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
