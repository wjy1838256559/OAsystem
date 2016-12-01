package com.zrgj.oa.entity;

/**
 * @author song
 * 
 *         功能:回复实体类
 * 
 *         2016-11-21
 */
public class Reply extends Article {

	private Topic topic;

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}

}
