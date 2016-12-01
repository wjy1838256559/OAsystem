package com.zrgj.oa.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * @author song
 * 
 *         功能:板块实体类
 * 
 *         2016-11-21
 */
public class Forum {

	private Integer id;
	private String name;
	private String description;
	private int position;

	private Set<Topic> topicList = new HashSet<Topic>();
	private int topicCount;// 主题数量
	private int articleCount;// 文章数量（主题+回复）

	private int state;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	public Set<Topic> getTopicList() {
		return topicList;
	}

	public void setTopicList(Set<Topic> topicList) {
		this.topicList = topicList;
	}

	public int getTopicCount() {
		return topicCount;
	}

	public void setTopicCount(int topicCount) {
		this.topicCount = topicCount;
	}

	public int getArticleCount() {
		return articleCount;
	}

	public void setArticleCount(int articleCount) {
		this.articleCount = articleCount;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
