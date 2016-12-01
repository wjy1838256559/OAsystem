package com.zrgj.oa.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

import com.zrgj.oa.dao.ForumDao;
import com.zrgj.oa.dao.TopicDao;
import com.zrgj.oa.entity.Forum;
import com.zrgj.oa.entity.Topic;
import com.zrgj.oa.util.DBUtil;

/**
 * @author song
 * 
 *         功能:板块实体数据库访问层实现类
 * 
 *         2016-11-21
 */
public class ForumDaoImpl implements ForumDao {

	private TopicDao topicDao = new TopicDaoImpl();

	public Forum getById(Integer id) {
		String sql = "select * from forum where id=?";
		ResultSet rs = DBUtil.getRes(sql, id);
		List<Forum> forums = rsToForumList(rs);
		if (forums != null && forums.size() > 0) {
			return forums.get(0);
		}
		return null;
	}

	public int add(Forum entity) {
		String sql = "insert into forum values(null,?,?,?,?,?,null)";
		Object[] obj = { entity.getName(), entity.getDescription(),
				entity.getTopicCount(), entity.getArticleCount(),
				entity.getState() };
		return DBUtil.add_update_delete(sql, obj);
	}

	public int update(Forum entity) {
		String sql = "update forum set name=?,description=?,topicCount=?,articleCount=?,state=?,position=? where id=?";
		Object[] obj = { entity.getName(), entity.getDescription(),
				entity.getTopicCount(), entity.getArticleCount(),
				entity.getState(),entity.getPosition(), entity.getId() };
		return DBUtil.add_update_delete(sql, obj);
	}

	public int delete(Integer id) {
		Forum forum = getById(id);
		if (forum != null) {
			forum.setState(0);
		}
		return update(forum);
	}

	public void moveUp(Integer forumId) {
		Forum forum = getById(forumId);
		int temp = forum.getPosition();
		String sql = "select * from forum where position<? order by position desc limit ?,?";
		ResultSet rs = DBUtil.getRes(sql, temp, 0, 1);
		List<Forum> forumList = rsToForumList(rs);
		if (forumList != null && forumList.size() > 0) {
			Forum other = forumList.get(0);
			if (other == null) {
				return;
			}
			forum.setPosition(other.getPosition());
			other.setPosition(temp);
			update(forum);
			update(other);
		}
	}

	public void moveDown(Integer forumId) {
		Forum forum = getById(forumId);
		int temp = forum.getPosition();
		String sql = "select * from forum where position>? order by position asc limit ?,?";
		ResultSet rs = DBUtil.getRes(sql, temp, 0, 1);
		List<Forum> forumList = rsToForumList(rs);
		if (forumList != null && forumList.size() > 0) {
			Forum other = forumList.get(0);
			if (other == null) {
				return;
			}
			forum.setPosition(other.getPosition());
			other.setPosition(temp);
			update(forum);
			update(other);
		}
	}
	
	public int getLastPosition(){
		int position=0;
		String sql="select position from forum order by position desc limit ?,?";
		ResultSet rs=DBUtil.getRes(sql, 0,1);
		if(rs!=null){
			try {
				while(rs.next()){
					position=rs.getInt("position");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return position;
	}

	private List<Forum> rsToForumList(ResultSet rs) {
		List<Forum> forums = null;
		if (rs != null) {
			forums = new ArrayList<Forum>();
			try {
				while (rs.next()) {
					Forum forum = new Forum();
					int id = rs.getInt("id");
					forum.setId(id);
					String name = rs.getString("name");
					forum.setName(name);
					int position=rs.getInt("position");
					forum.setPosition(position);
					String description = rs.getString("description");
					forum.setDescription(description);
					List<Topic> topicList = topicDao.getByForumId(id);
					if (topicList != null) {
						forum.setTopicList(new HashSet<Topic>(topicList));
						forum.setTopicCount(topicList.size());
						int articleCount = topicList.size();
						for (Topic topic : topicList) {
							articleCount += topic.getReplyCount();
						}
						forum.setArticleCount(articleCount);
						int state = rs.getInt("state");
						forum.setState(state);
						forums.add(forum);
					}
				}
				return forums;
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return Collections.EMPTY_LIST;
	}

	public List<Forum> findAll() {
		String sql = "select * from forum";
		ResultSet rs = DBUtil.getRes(sql);
		return rsToForumList(rs);
	}

	public List<Forum> findAllByPage(int pageIndex, int pageSize) {
		String sql = "select * from forum where state=1 order by position asc limit ?,?";
		ResultSet rs = DBUtil.getRes(sql, (pageIndex-1)*pageSize, pageSize);
		return rsToForumList(rs);
	}

	public int getCount() {
		int result = 0;
		String sql = "select count(*) as amount from forum where state=1";
		ResultSet rs = DBUtil.getRes(sql);
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

	public List<Forum> getByName(String name) {
		String sql="select * from forum where name=?";
		ResultSet rs=DBUtil.getRes(sql, name);
		List<Forum> forumList=rsToForumList(rs);
		return forumList;
	}

}
