package com.zrgj.oa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.LeaveListBiz;
import com.zrgj.oa.biz.impl.LeaveListBizImpl;

public class LeaveListUpdateTServlet extends HttpServlet {

	
	/**
	 * 将假条状态改为通过。
	 */
	private static final long serialVersionUID = -2994097415199960759L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
        LeaveListBiz leavelist=new LeaveListBizImpl();
        leavelist.updateT(id);
		
	}

}
