package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.TopicBiz;
import com.zrgj.oa.biz.impl.TopicBizImpl;
import com.zrgj.oa.entity.Topic;

/**
 * @author song
 *
 *	功能:回复功能传递信息Servlet
 * 
 *  日期：2016-11-22
 */
public class ReplyAddServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("topicId");
		if(id!=null && !id.equals("")){
			int topicId=Integer.parseInt(id);
			TopicBiz topicBiz=new TopicBizImpl();
			Topic topic = topicBiz.getById(topicId);
			request.getSession().setAttribute("topic", topic);
			response.sendRedirect("add.jsp");
		}
	}

}
