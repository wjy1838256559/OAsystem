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
import com.zrgj.oa.util.PageBean;

/**
 * @author song
 * 
 *         功能:板块列表的Servlet
 * 
 *         2016-11-21
 */
public class ForumServlet extends HttpServlet {

	private ForumBiz forumBiz=new ForumBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageIndex = 1;
		int pageSize = 5;
		String index=request.getParameter("pageIndex");
		if(index!=null && !index.equals("")){
			pageIndex=Integer.parseInt(index);
		}
		List<Forum> forums = forumBiz.findAllByPage(pageIndex, pageSize);
		int count = forumBiz.getCount();
		PageBean pageBean = new PageBean(pageIndex, pageSize, forums, count);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/WEB-INF/manager/list.jsp").forward(request, response);
	}

}
