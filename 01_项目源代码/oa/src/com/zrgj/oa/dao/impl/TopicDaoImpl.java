package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import com.zrgj.oa.dao.EmployeeDao;
import com.zrgj.oa.dao.ForumDao;
import com.zrgj.oa.dao.ReplyDao;
import com.zrgj.oa.dao.TopicDao;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Forum;
import com.zrgj.oa.entity.Reply;
import com.zrgj.oa.entity.Topic;
import com.zrgj.oa.util.DBUtil;

/**
 * @author song
 * 
 *         功能:主题实体类数据库访问层实现类
 * 
 *         2016-11-21
 */
public class TopicDaoImpl implements TopicDao {

	private EmployeeDao employeeDao = new EmployeeDaoImpl();

	public Topic getById(Integer id) {
		String sql = "select * from topic where id=?";
		ResultSet rs = DBUtil.getRes(sql, id);
		List<Topic> topicList=rsToTopicList(rs);
		if(topicList!=null && topicList.size()>0){
			return topicList.get(0);
		}
		return null;
	}

	public int add(Topic entity) {
		String sql="insert into topic values(null,?,?,?,?,?,?,?,?,?)";
		Integer authorId=null;
		if(entity.getEmployee()!=null){
			authorId=entity.getEmployee().getId();
		}
		Integer forumId=null;
		if(entity.getForum()!=null){
			forumId=entity.getForum().getId();
		}
		Object[] obj={
				authorId,forumId,entity.getTitle(),entity.getContent(),entity.getPostTime(),entity.getLastUpdateTime(),entity.getType(),entity.getReplyCount(),entity.getState()	
		};
		return DBUtil.add_update_delete(sql, obj);
	}

	public int update(Topic entity) {
		String sql="update topic set authorId=?,forumId=?,title=?,content=?,postTime=?,lastUpdateTime=?,type=?,replyCount=?,state=? where id=?";
		Integer authorId=null;
		if(entity.getEmployee()!=null){
			authorId=entity.getEmployee().getId();
		}
		Integer forumId=null;
		if(entity.getForum()!=null){
			forumId=entity.getForum().getId();
		}
		Object[] obj={
				authorId,forumId,entity.getTitle(),entity.getContent(),entity.getPostTime(),entity.getLastUpdateTime(),entity.getType(),entity.getReplyCount(),entity.getState(),entity.getId()	
		};
		return DBUtil.add_update_delete(sql, obj);
	}

	public int delete(Integer id) {
		Topic topic=getById(id);
		if(topic!=null){
			topic.setState(0);
		}
		return update(topic);
	}
	
	public int getCountByForumId(Integer forumId) {
		int result=0;
		String sql="select count(*) as amount from topic where state=1 and forumId=?";
		ResultSet rs=DBUtil.getRes(sql, forumId);
		if(rs!=null){
			try {
				while(rs.next()){
					result=rs.getInt("amount");
				}
				return result;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}


	public List<Topic> getByForumIdAndPage(Integer forumId, int pageIndex,
			int pageSize) {
		String sql="select * from topic t where state=1 and forumId=? order by (case t.type when 2 then 2 else 0 end) desc,t.lastUpdateTime desc limit ?,?";
		ResultSet rs=DBUtil.getRes(sql, forumId,(pageIndex-1)*pageSize,pageSize);
		return rsToTopicList(rs);
	}
	
	public List<Topic> getByForumId(Integer forumId) {
		String sql="select * from topic where state=1 and forumId=?";
		ResultSet rs=DBUtil.getRes(sql, forumId);
		return rsToTopicList(rs);
	}

	private List<Topic> rsToTopicList(ResultSet rs) {
		List<Topic> topicList = null;
		if (rs != null) {
			topicList = new ArrayList<Topic>();
			try {
				while (rs.next()) {
					Topic topic = new Topic();
					topic.setId(rs.getInt("id"));
					Integer authorId = rs.getInt("authorId");
					if (authorId != null) {
						Employee employee = employeeDao.getById(authorId);
						if (employee != null) {
							topic.setEmployee(employee);
						}
					}
//					Integer forumId=rs.getInt("forumId");
//					if(forumId!=null){
//						ForumDao forumDao=new ForumDaoImpl();
//						Forum forum=forumDao.getById(forumId);
//						if(forum!=null){
//							topic.setForum(forum);
//						}
//					}
					String title = rs.getString("title");
					topic.setTitle(title);
					String content = rs.getString("content");
					topic.setContent(content);
					Date postTime = rs.getDate("postTime");
					topic.setPostTime(postTime);
					Date lastUpdatTime = rs.getDate("lastUpdateTime");
					topic.setLastUpdateTime(lastUpdatTime);
					int type = rs.getInt("type");
					topic.setType(type);
					int replyCount = rs.getInt("replyCount");
					topic.setReplyCount(replyCount);
					int state=rs.getInt("state");
					topic.setState(state);
					topicList.add(topic);
				}
				return topicList;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

}
