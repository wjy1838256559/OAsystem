package com.zrgj.oa.listener;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.zrgj.oa.biz.TopicBiz;
import com.zrgj.oa.biz.impl.TopicBizImpl;
import com.zrgj.oa.entity.Topic;

/**
 * @author song
 *
 *	功能:准备主题列表的监听器
 * 
 *  日期：2016-11-20
 */
public class InitListener implements ServletContextListener {
	
	private TopicBiz topicBiz=new TopicBizImpl();

	public void contextInitialized(ServletContextEvent servletContextEvent) {
		List<Topic> topicList=topicBiz.getByForumIdAndPage(1, 1, 10);
		servletContextEvent.getServletContext().setAttribute("topicList", topicList);
		System.out.println("=====准备主题列表=====");
	}
	
	public void contextDestroyed(ServletContextEvent arg0) {}

}
