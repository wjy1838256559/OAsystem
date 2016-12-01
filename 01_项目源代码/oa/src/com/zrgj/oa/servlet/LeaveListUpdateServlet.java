package com.zrgj.oa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.LeaveListBiz;
import com.zrgj.oa.biz.impl.LeaveListBizImpl;

public class LeaveListUpdateServlet extends HttpServlet {

	
	/**
	 * 将假条信息忽略（不显示）
	 */
	private static final long serialVersionUID = 4944320419603707102L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		   doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            int id=Integer.parseInt(request.getParameter("id"));
            LeaveListBiz leavelist=new LeaveListBizImpl();
            leavelist.updateH(id);
            response.sendRedirect("LeaveListServlet");
             
		
	}

}
