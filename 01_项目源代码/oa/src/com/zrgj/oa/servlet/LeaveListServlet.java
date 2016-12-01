package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.LeaveListBiz;

import com.zrgj.oa.biz.impl.LeaveListBizImpl;

import com.zrgj.oa.entity.LeaveList;

import com.zrgj.oa.util.PageBean;

public class LeaveListServlet extends HttpServlet {


	/**
	 * 显示分页显示假条信息。
	 */
	private static final long serialVersionUID = -217005168577800175L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            doPost(request, response);
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int pageIndex = 1;
		int pageSize = 5;
		if (request.getParameter("pageIndex") != null) {
			pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
		}
		LeaveListBiz leavelistBiz = new LeaveListBizImpl();
		List<LeaveList> leaveList = leavelistBiz.getLeaveByPage(pageIndex,pageSize);
		int counts = leavelistBiz.getLeaveCounts();
		if (leaveList.size() > 0) {
			if (leavelistBiz != null) {
				PageBean pageBean=new PageBean(pageIndex, pageSize, leaveList, counts);
				request.setAttribute("pageBean", pageBean);
				request.getRequestDispatcher("/WEB-INF/leave/leavelist.jsp")
						.forward(request, response);
			}
		}
		
	}

}
