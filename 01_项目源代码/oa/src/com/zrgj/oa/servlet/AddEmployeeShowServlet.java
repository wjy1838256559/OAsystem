package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.StationBiz;
import com.zrgj.oa.biz.impl.StationBizImpl;
import com.zrgj.oa.entity.Station;

/**
 * @author song
 * 
 *         功能:为添加员工传递信息的Servlet
 * 
 *         日期：2016-11-19
 */
public class AddEmployeeShowServlet extends HttpServlet {

	private StationBiz stationBiz = new StationBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Station> stationList = stationBiz.findAll();
		request.setAttribute("stationList", stationList);
		request.getRequestDispatcher("/WEB-INF/employee/add.jsp").forward(
				request, response);
	}

}
