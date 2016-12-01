package com.zrgj.oa.biz;

import java.util.List;

import com.zrgj.oa.base.BaseBiz;
import com.zrgj.oa.entity.Station;
/**
 * 
 * @author song
 *
 *	����:��λ�߼��ӿ�
 *
 * 	2016-11-18
 */
public interface StationBiz extends BaseBiz<Station>  {

	/**
	 * ��ҳ��ʾѧ����Ϣ
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
	 */
	public List<Station> findAll();

	/**
	 * @param sName
	 * @param dId
	 * @return
	 */
	public List<Station> getByNameAndDId(String sName, int dId);

}