package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.ForumBiz;
import com.zrgj.oa.biz.impl.ForumBizImpl;
import com.zrgj.oa.entity.Forum;

/**
 * @author song
 *
 *	功能:发表新帖传递信息的Servlet
 * 
 *  日期：2016-11-22
 */
public class TopicAddServlet extends HttpServlet {
	
	private ForumBiz forumBiz=new ForumBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("forumId");
		if(id!=null && !id.equals("")){
			int forumId=Integer.parseInt(id);
			Forum forum=forumBiz.getById(forumId);
			request.getSession().setAttribute("forum", forum);
			response.sendRedirect("topicAdd.jsp");
		}
	}

}
