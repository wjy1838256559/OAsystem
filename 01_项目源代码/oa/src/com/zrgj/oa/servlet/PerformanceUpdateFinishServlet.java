package com.zrgj.oa.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.PerformanceBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.biz.impl.PerformanceBizImpl;
import com.zrgj.oa.entity.Performance;

public class PerformanceUpdateFinishServlet extends HttpServlet {

	
	
	private static final long serialVersionUID = 7914518446576962095L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		Date startDate=null;
		Date endDate=null;
		Date date=new Date();
		
		BigDecimal expectNum=new BigDecimal(request.getParameter("expectNum"));
		int eId=(Integer)request.getSession().getAttribute("eId");
		if(request.getParameter("startDate")!=""&&request.getParameter("endDate")!=""&&expectNum!=null){
			try {
				startDate=format.parse(request.getParameter("startDate"));
				endDate=format.parse(request.getParameter("endDate"));
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
			if(startDate.getTime()>=date.getTime()){
					PerformanceBiz performanceBiz=new PerformanceBizImpl();
					EmployeeBiz employeeBiz=new EmployeeBizImpl();
					Performance performance=new Performance();
					performance.setEmployee(employeeBiz.getById(eId));
					performance.setStartDate(startDate);
					performance.setEndDate(endDate);
					performance.setExpectNum(expectNum);
					performanceBiz.add(performance);
					response.sendRedirect("PerformanceServlet");
				}
				
					else{
						response.sendRedirect("PerformanceServlet");
						return;
					}
		}
		else{
			response.sendRedirect("PerformanceServlet");
			return;
			
		}		
	}
}
