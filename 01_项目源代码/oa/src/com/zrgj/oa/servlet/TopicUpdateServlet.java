package com.zrgj.oa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.ForumBiz;
import com.zrgj.oa.biz.TopicBiz;
import com.zrgj.oa.biz.impl.ForumBizImpl;
import com.zrgj.oa.biz.impl.TopicBizImpl;
import com.zrgj.oa.entity.Forum;
import com.zrgj.oa.entity.Topic;

/**
 * @author song
 * 
 *         功能:设置主题种类的Servlet
 * 
 * 
 *         日期：2016-11-22
 */
public class TopicUpdateServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id=request.getParameter("topicId");
		if(id!=null && !id.equals("")){
			int topicId=Integer.parseInt(id);
			String temp=request.getParameter("type");
			if(temp!=null && !temp.equals("")){
				int type=Integer.parseInt(temp);
				TopicBiz topicBiz=new TopicBizImpl();
				Topic topic = topicBiz.getById(topicId);
				String fId=(String) request.getSession().getAttribute("forumId");
				if(fId!=null && !fId.equals("")){
					int forumId=Integer.parseInt(fId);
					ForumBiz forumBiz=new ForumBizImpl();
					Forum forum = forumBiz.getById(forumId);
					topic.setForum(forum);
				}
				topic.setType(type);
				int result=topicBiz.update(topic);
				if(result>0){
					response.sendRedirect("TopicServlet");
				}
			}
		}
	}

}
