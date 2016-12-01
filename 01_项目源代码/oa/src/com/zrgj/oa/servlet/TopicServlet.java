package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

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
import com.zrgj.oa.util.PageBean;

/**
 * @author song
 *
 *	功能:主题列表的Servlet
 *
 * 	2016-11-21
 */
public class TopicServlet extends HttpServlet {
	
	private ForumBiz forumBiz=new ForumBizImpl();
	private TopicBiz topicBiz=new TopicBizImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageIndex=1;
		int pageSize=3;
		String index=request.getParameter("pageIndex");
		if(index!=null && !index.equals("")){
			pageIndex=Integer.parseInt(index);
		}
		String id=request.getParameter("forumId");
		if(id==null){
			id=(String) request.getSession().getAttribute("forumId");
		}
		if(id!=null && !id.equals("")){
			int forumId=Integer.parseInt(id);
			request.getSession().setAttribute("forumId", id);
			Forum forum=forumBiz.getById(forumId);
			request.setAttribute("forum", forum);
			List<Topic> topicList=topicBiz.getByForumIdAndPage(forumId, pageIndex, pageSize);
			int count=topicBiz.getCountByForumId(forumId);
			PageBean pageBean=new PageBean(pageIndex, pageSize, topicList, count);
			request.setAttribute("pageBean", pageBean);
			request.getRequestDispatcher("/WEB-INF/topic/list.jsp").forward(request, response);
		}else{
			response.sendRedirect("error.jsp");
			return;
		}

	}

}
