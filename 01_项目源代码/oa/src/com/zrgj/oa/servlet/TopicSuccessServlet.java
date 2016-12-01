package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.ForumBiz;
import com.zrgj.oa.biz.TopicBiz;
import com.zrgj.oa.biz.impl.ForumBizImpl;
import com.zrgj.oa.biz.impl.TopicBizImpl;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Forum;
import com.zrgj.oa.entity.Topic;

/**
 * @author song
 *
 *	功能:添加主题的Servlet
 * 
 *  日期：2016-11-22
 */
public class TopicSuccessServlet extends HttpServlet {
	
	private TopicBiz topicBiz=new TopicBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String id=request.getParameter("forumId");
			if(id!=null && !id.equals("")){
				Topic topic=new Topic();
				int forumId=Integer.parseInt(id);
				ForumBiz forumBiz=new ForumBizImpl();
				Forum forum=forumBiz.getById(forumId);
				topic.setForum(forum);
				String tilt=request.getParameter("title");
				String con=request.getParameter("content");
				if(tilt!=null && con!=null){
					String title=new String(tilt.getBytes("iso-8859-1"),"utf-8");
					String content=new String(con.getBytes("iso-8859-1"),"utf-8");
					topic.setContent(content);
					topic.setTitle(title);
				}
				Employee employee=(Employee) request.getSession().getAttribute("user");
				topic.setEmployee(employee);
				int result=topicBiz.add(topic);
				if(result>0){
					request.setAttribute("forumId", forumId);
					response.sendRedirect("TopicServlet");
					return;
				}
			}else{
				response.sendRedirect("error.jsp");
			}
	}

}
