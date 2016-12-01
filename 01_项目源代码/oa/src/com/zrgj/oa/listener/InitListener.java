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
 *	����:׼�������б�ļ�����
 * 
 *  ���ڣ�2016-11-20
 */
public class InitListener implements ServletContextListener {
	
	private TopicBiz topicBiz=new TopicBizImpl();

	public void contextInitialized(ServletContextEvent servletContextEvent) {
		List<Topic> topicList=topicBiz.getByForumIdAndPage(1, 1, 10);
		servletContextEvent.getServletContext().setAttribute("topicList", topicList);
		System.out.println("=====׼�������б�=====");
	}
	
	public void contextDestroyed(ServletContextEvent arg0) {}

}
