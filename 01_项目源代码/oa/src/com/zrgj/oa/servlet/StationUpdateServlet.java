package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.DepartmentBiz;
import com.zrgj.oa.biz.StationBiz;
import com.zrgj.oa.biz.impl.DepartmentBizImpl;
import com.zrgj.oa.biz.impl.StationBizImpl;
import com.zrgj.oa.entity.Department;
import com.zrgj.oa.entity.Station;
/**
 * 
 * @author song
 *
 *	功能:更新岗位使用的Servlet
 *
 * 	2016-11-18
 */
public class StationUpdateServlet extends HttpServlet {

	
	private static final long serialVersionUID = -3755991926861192170L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		    doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt((request.getParameter("id")));
        StationBiz stationBiz=new StationBizImpl();
        Station station=stationBiz.getById(id);
        request.setAttribute("station",station);
        DepartmentBiz departmentBiz=new DepartmentBizImpl();
        List<Department> departmentList=departmentBiz.findAll();
        request.setAttribute("departmentList", departmentList);
        request.getRequestDispatcher("/WEB-INF/station/gangweiedit.jsp").forward(request, response);
	}

}
