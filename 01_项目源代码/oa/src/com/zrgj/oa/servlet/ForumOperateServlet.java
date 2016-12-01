package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

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
 *         功能:板块操作的Servlet
 * 
 *         2016-11-21
 */
public class ForumOperateServlet extends HttpServlet {

	private ForumBiz forumBiz = new ForumBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("forumId");
		String type = request.getParameter("type");
		if (id != null && !id.equals("") && !id.equals("undefined")) {
			int forumId = Integer.parseInt(id);
			if (type != null) {
				if (type.equals("up")) {
					forumBiz.moveUp(forumId);
				} else if (type.equals("down")) {
					forumBiz.moveDown(forumId);
				} else if (type.equals("delete")) {
					forumBiz.delete(forumId);
				} else if (type.equals("show")) {
					Forum forum = forumBiz.getById(forumId);
					request.setAttribute("forum", forum);
					request.getRequestDispatcher("/WEB-INF/manager/saveUI.jsp")
							.forward(request, response);
					return;
				} else if (type.equals("update")) {
					Forum forum = forumBiz.getById(forumId);
					String name_temp = request.getParameter("name");
					String name=null;
					String description=null;
					if(name_temp!=null){
					name=new String(name_temp.getBytes("iso-8859-1"),"utf-8");
					}
					String description_temp = request.getParameter("description");
					if(description_temp!=null){
						 description=new String(description_temp.getBytes("iso-8859-1"),"utf-8");
					}
					forum.setName(name);
					forum.setDescription(description);
					forumBiz.update(forum);
				}
			}
		}
		if (type != null) {
			if (type.equals("add")) {
				request.getRequestDispatcher("/WEB-INF/manager/saveUI.jsp")
						.forward(request, response);
				return;
			}
		} else {
			String name_temp = request.getParameter("name");
			String description_temp = request.getParameter("description");
			String name=null;
			String description=null;
			if(name_temp!=null){
				name=new String(name_temp.getBytes("iso-8859-1"),"utf-8");
			}
			if(description_temp!=null){
				 description=new String(description_temp.getBytes("iso-8859-1"),"utf-8");
			}
			if(name!=null){
				List<Forum> forumList=forumBiz.getByName(name);
				if(forumList!=null && forumList.size()>1){
					Forum fom=new Forum();
					fom.setName(name);
					fom.setDescription(description);
					request.setAttribute("forum",fom);
					request.setAttribute("error", "该板块已存在");
					request.getRequestDispatcher("/WEB-INF/manager/saveUI.jsp").forward(request, response);
					return ;
				}
			}
			Forum forum = new Forum();
			forum.setName(name);
			forum.setDescription(description);
			forumBiz.add(forum);
		}
		response.sendRedirect("ForumServlet");
	}
}
