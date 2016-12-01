package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.UserLeaveBiz;
import com.zrgj.oa.biz.impl.UserLeaveBizImpl;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Leave;
import com.zrgj.oa.util.PageBean;

public class UserLeaveServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4992446493997433061L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
             doPost(request, response);
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pageIndex=1;
		int pageSize=5;
		if(request.getParameter("pageIndex")!=null){
			pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		}
		   Employee user=(Employee) request.getSession().getAttribute("user");
		   int userId=user.getId();
           UserLeaveBiz userLeaveBiz=new UserLeaveBizImpl();
           List<Leave> list=userLeaveBiz.getList(pageIndex, pageSize,userId);
           int counts=userLeaveBiz.getCounts(userId);
           int pageCounts=userLeaveBiz.getPageCounts(pageSize,userId);
           PageBean pageBean=new PageBean(pageIndex, pageSize, list, counts);
           request.setAttribute("list", list);
           request.setAttribute("pageCounts", pageCounts);
           request.setAttribute("pageBean", pageBean);
           request.getRequestDispatcher("WEB-INF/leave/userLeave.jsp").forward(request, response);
	}

}
