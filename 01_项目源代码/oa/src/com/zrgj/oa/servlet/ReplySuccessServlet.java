package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.ReplyBiz;
import com.zrgj.oa.biz.TopicBiz;
import com.zrgj.oa.biz.impl.ReplyBizImpl;
import com.zrgj.oa.biz.impl.TopicBizImpl;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Reply;
import com.zrgj.oa.entity.Topic;

/**
 * @author song
 *
 *	功能:发表回复的Servlet
 * 
 *  日期：2016-11-22
 */
public class ReplySuccessServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
			String id=request.getParameter("topicId");
			if(id!=null && !id.equals("")){
				int topicId=Integer.parseInt(id);
				TopicBiz topicBiz=new TopicBizImpl();
				Topic topic=topicBiz.getById(topicId);
				String tit=request.getParameter("title");
				String con=request.getParameter("content");
				if(tit!=null && con!=null ){
					String title=new String(tit.getBytes("iso-8859-1"),"utf-8");
					String content=new String(con.getBytes("iso-8859-1"),"utf-8");
					Reply reply=new Reply();
					reply.setTitle(title);
					reply.setContent(content);
					reply.setTopic(topic);
					Employee employee=(Employee) request.getSession().getAttribute("user");
					reply.setEmployee(employee);
					ReplyBiz replyBiz=new ReplyBizImpl();
					int result=replyBiz.add(reply);
					if(result>0){
						response.sendRedirect("ReplyListServlet");
					}
				}
			}
	}

}
