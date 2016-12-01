package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.StationBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.biz.impl.StationBizImpl;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Station;

/**
 * @author song
 *
 *	功能:更新员工获取员工信息的Servlet
 *
 * 	2016-11-17
 */
public class EmployeeShowServlet extends HttpServlet {
	
	private EmployeeBiz employeeBiz=new EmployeeBizImpl();
	private StationBiz stationBiz=new StationBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String eid=request.getParameter("id");
		List<Station> stationList=stationBiz.findAll();
		request.setAttribute("stationList", stationList);
		if(eid!=null){
			int id=Integer.parseInt(eid);
			Employee employee=employeeBiz.getById(id);
			request.setAttribute("employee", employee);
			request.setAttribute("id", id);
			request.getRequestDispatcher("/WEB-INF/employee/show.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("/WEB-INF/employee/add.jsp").forward(request, response);
		}
	}

}
