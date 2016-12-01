package com.zrgj.oa.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author song
 * 
 *         功能:主题实体类
 * 
 *         2016-11-21
 */
public class Topic extends Article {

	/** 普通帖 */
	public static final int TYPE_NORMAL = 0;

	/** 精华帖 */
	public static final int TYPE_BEST = 1;

	/** 置顶帖 */
	public static final int TYPE_TOP = 2;

	private Forum forum;
	private Set<Reply> replyList = new HashSet<Reply>();

	private int type;
	private int replyCount;
	private Date lastUpdateTime;
	private int state;

	public Forum getForum() {
		return forum;
	}

	public void setForum(Forum forum) {
		this.forum = forum;
	}

	public Set<Reply> getReplyList() {
		return replyList;
	}

	public void setReplyList(Set<Reply> replyList) {
		this.replyList = replyList;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
