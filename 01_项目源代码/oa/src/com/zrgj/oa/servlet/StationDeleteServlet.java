package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.StationBiz;
import com.zrgj.oa.biz.impl.StationBizImpl;

/**
 * 
 * @author song
 * 
 *         功能:删除岗位使用的Servlet
 * 
 *         2016-11-18
 */
public class StationDeleteServlet extends HttpServlet {

	private static final long serialVersionUID = 6103787786265593041L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt((request.getParameter("id")));
		StationBiz stationBiz = new StationBizImpl();
		stationBiz.delete(id);
		response.sendRedirect("StationServlet");
	}

}
