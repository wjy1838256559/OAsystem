package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.dao.ReplyDao;
import com.zrgj.oa.dao.TopicDao;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Reply;
import com.zrgj.oa.entity.Topic;
import com.zrgj.oa.util.DBUtil;

/**
 * @author song
 * 
 *         功能:回复实体类数据库访问层实现类
 * 
 *         2016-11-21
 */
public class ReplyDaoImpl implements ReplyDao {

	private EmployeeDao employeeDao = new EmployeeDaoImpl();

	public Reply getById(Integer id) {
		String sql = "select * from reply where id=?";
		ResultSet rs = DBUtil.getRes(sql, id);
		List<Reply> replyList = rsToReList(rs);
		if (replyList != null && replyList.size() > 0) {
			return replyList.get(0);
		}
		return null;
	}

	public int add(Reply entity) {
		String sql = "insert into reply values(null,?,?,?,?,?)";
		Integer authorId = null;
		if (entity.getEmployee() != null) {
			authorId = entity.getEmployee().getId();
		}
		Integer topicId = null;
		if (entity.getTopic() != null) {
			topicId = entity.getTopic().getId();
		}
		Object[] obj = { authorId, topicId, entity.getTitle(),
				entity.getContent(), entity.getPostTime() };
		return DBUtil.add_update_delete(sql, obj);
	}

	public int update(Reply entity) {
		String sql = "update reply set authorId=?,topicId=?,title=?,content=?,postTime=? where id=?";
		Integer authorId = null;
		if (entity.getEmployee() != null) {
			authorId = entity.getEmployee().getId();
		}
		Integer topicId = null;
		if (entity.getTopic() != null) {
			topicId = entity.getTopic().getId();
		}
		Object[] obj = { authorId, topicId, entity.getTitle(),
				entity.getContent(), entity.getPostTime(), entity.getId() };
		return DBUtil.add_update_delete(sql, obj);
	}

	public int delete(Integer id) {
		String sql = "delete from reply where id=?";
		return DBUtil.add_update_delete(sql, id);
	}

	public List<Reply> getByTopicIdAndPage(Integer topicId, int pageIndex,
			int pageSize) {
		String sql = "select * from reply r where topicId=? order by r.postTime desc limit ?,?";
		Object[] obj = { topicId, (pageIndex - 1) * pageSize, pageSize };
		ResultSet rs = DBUtil.getRes(sql, obj);
		return rsToReList(rs);
	}

	public List<Reply> getByTopicId(Integer topicId) {
		String sql = "select * from reply where topicId=";
		ResultSet rs = DBUtil.getRes(sql, topicId);
		return rsToReList(rs);
	}

	public int getCountByTopicId(Integer id) {
		int result = 0;
		String sql = "select count(*) as amount from reply where id=?";
		ResultSet rs = DBUtil.getRes(sql, id);
		if (rs != null) {
			try {
				while (rs.next()) {
					result = rs.getInt("amount");
				}
				return result;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	private List<Reply> rsToReList(ResultSet rs) {
		List<Reply> replyList = null;
		if (rs != null) {
			replyList = new ArrayList<Reply>();
			try {
				while (rs.next()) {
					Reply reply = new Reply();
					Integer authorId = rs.getInt("authorId");
					if (authorId != null) {
						Employee employee = employeeDao.getById(authorId);
						if (employee != null) {
							reply.setEmployee(employee);
						}
					}
					Integer topicId=rs.getInt("topicId");
					if(topicId!=null){
						TopicDao topicDao=new TopicDaoImpl();
						Topic topic=topicDao.getById(topicId);
						reply.setTopic(topic);
					}
					String title = rs.getString("title");
					reply.setTitle(title);
					String content = rs.getString("content");
					reply.setContent(content);
					Date postTime = rs.getDate("postTime");
					reply.setPostTime(postTime);
					replyList.add(reply);
				}
				return replyList;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

}
