package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.PerformanceBiz;
import com.zrgj.oa.biz.impl.PerformanceBizImpl;
import com.zrgj.oa.entity.Performance;

public class PerformanceReplyServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7891609434865634186L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id=0;
		if(request.getParameter("id")!=null){
			id=Integer.parseInt(request.getParameter("id"));
		}
		PerformanceBiz performanceBiz=new PerformanceBizImpl();
		Performance performance=performanceBiz.getById(id);
		performanceBiz.updateRep(performance);
		request.getRequestDispatcher("PerformanceServlet").forward(request, response);
		
	}

}
