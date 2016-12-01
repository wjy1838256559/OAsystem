package com.zrgj.oa.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.LeaveListBiz;
import com.zrgj.oa.biz.impl.LeaveListBizImpl;
import com.zrgj.oa.entity.LeaveList;

public class ShowReasonServlet extends HttpServlet {


	private static final long serialVersionUID = -4586109534893485278L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		//通过id获取对象   
	    LeaveListBiz leaveListBiz=new LeaveListBizImpl();
		LeaveList leaveList=leaveListBiz.getById(id);
		request.setAttribute("leaveList", leaveList);
		request.setAttribute("id", id);
		request.getRequestDispatcher("/WEB-INF/leave/showReason.jsp").forward(request, response);
	}

}
