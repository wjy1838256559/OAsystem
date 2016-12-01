package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.entity.Employee;

public class PerformanceUpdateServlet extends HttpServlet {

	
	private static final long serialVersionUID = 5995613579472018223L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int eId=0;
		if(request.getParameter("eId")!=null){
			eId=Integer.parseInt(request.getParameter("eId"));
			EmployeeBiz employeeBiz=new EmployeeBizImpl();
			Employee employee=employeeBiz.getById(eId);
			request.setAttribute("employee",employee );
			String startDate=request.getParameter("startDate");
			String endDate=request.getParameter("endDate");
			request.getSession().setAttribute("eId", eId);
			request.getSession().setAttribute("startDate", startDate);
			request.getSession().setAttribute("endDate", endDate);
			request.getRequestDispatcher("/WEB-INF/performance/performanceedit.jsp").forward(request, response);
		}
		
	}

}
