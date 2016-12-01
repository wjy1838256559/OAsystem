package com.zrgj.oa.dao;

import java.util.List;

import com.zrgj.oa.entity.LeaveList;
import com.zrgj.oa.entity.Station;
/**
 * 请假条数据库访问接口
 * @author Administrator
 *
 */
public interface LeaveListDao {
	/**
	    * 分页显示假条信息
	    */
		public List<LeaveList> getLeaveByPage(int pageindex,int pagesize);
		
		/**
		 * 获取总容量（总记录数）
		 */
		
		public int getLeaveCounts();
		
		/**
		 * 将假条状态改为通过，拒绝，忽略（不显示）。
		 */
		public int updateT(Integer id);
		public int updateJ(Integer id);
		public int updateH(Integer id);
		
		/**
		 * 根据id获取Leave对象。
		 */
		public LeaveList getById(int id); 
		
}
