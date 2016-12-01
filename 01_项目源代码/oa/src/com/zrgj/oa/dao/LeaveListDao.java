package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.entity.LeaveList;
import com.zrgj.oa.entity.Station;
/**
 * ��������ݿ���ʽӿ�
 * @author Administrator
 *
 */
public interface LeaveListDao {
	/**
	    * ��ҳ��ʾ������Ϣ
	    */
		public List<LeaveList> getLeaveByPage(int pageindex,int pagesize);
		
		/**
		 * ��ȡ���������ܼ�¼����
		 */
		
		public int getLeaveCounts();
		
		/**
		 * ������״̬��Ϊͨ�����ܾ������ԣ�����ʾ����
		 */
		public int updateT(Integer id);
		public int updateJ(Integer id);
		public int updateH(Integer id);
		
		/**
		 * ����id��ȡLeave����
		 */
		public LeaveList getById(int id); 
		
}
