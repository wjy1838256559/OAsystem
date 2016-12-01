package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.ReplyBiz;
import com.zrgj.oa.biz.TopicBiz;
import com.zrgj.oa.biz.impl.ReplyBizImpl;
import com.zrgj.oa.biz.impl.TopicBizImpl;
import com.zrgj.oa.entity.Reply;
import com.zrgj.oa.entity.Topic;
import com.zrgj.oa.util.PageBean;

/**
 * @author song
 * 
 *         功能:回复列表的Servlet
 * 
 *         2016-11-22
 */
public class ReplyListServlet extends HttpServlet {

	private ReplyBiz replyBiz = new ReplyBizImpl();
	private TopicBiz topicBiz=new TopicBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageIndex = 1;
		int pageSize = 3;
		String index = request.getParameter("pageIndex");
		if (index != null && !index.equals("")) {
			pageIndex = Integer.parseInt(index);
		}
		String id = request.getParameter("topicId");
		if(id==null){
			id=(String) request.getSession().getAttribute("topicId");
		}
		if (id != null && !id.equals("")) {
			int topicId = Integer.parseInt(id);
			Topic topic=topicBiz.getById(topicId);
			request.getSession().setAttribute("topicId", id);
			request.setAttribute("topic", topic);
			List<Reply> replyList=replyBiz.getByTopicIdAndPage(topicId, pageIndex, pageSize);
			int count=replyBiz.getCountByTopicId(topicId);
			PageBean pageBean=new PageBean(pageIndex, pageSize, replyList, count);
			request.setAttribute("pageBean", pageBean);
			request.getRequestDispatcher("/WEB-INF/topic/show.jsp").forward(request, response);
		}
	}

}
