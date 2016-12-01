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
import com.zrgj.oa.util.PageBean;

/**
 * 
 * @author song
 * 
 *         功能:岗位列表Servlet
 * 
 *         2016-11-18
 */
public class StationServlet extends HttpServlet {

	private static final long serialVersionUID = -2427415766684512479L;

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
		StationBiz stationBiz = new StationBizImpl();
		List<Station> stationList = stationBiz.getStationByPage(pageIndex,
				pageSize);
		int counts = stationBiz.getStationCounts();
		if (stationList.size() > 0) {
			if (stationBiz != null) {
				PageBean pageBean=new PageBean(pageIndex, pageSize, stationList, counts);
				request.setAttribute("pageBean", pageBean);
				request.getRequestDispatcher("/WEB-INF/station/gangwei.jsp")
						.forward(request, response);
			}
		}

	}
}
