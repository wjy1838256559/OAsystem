package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.UserPerformanceBiz;
import com.zrgj.oa.biz.impl.UserPerformanceBizImpl;
import com.zrgj.oa.entity.Performance;
import com.zrgj.oa.util.PageBean;

public class UserPerformanceServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -5616543814867763652L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String startDate=null;
		int pageIndex=1;
		int pageSize=5;
		int id=Integer.parseInt(request.getParameter("userId"));
		UserPerformanceBiz userPerformanceBiz=new UserPerformanceBizImpl();
		if(request.getParameter("pageIndex")!=null&&request.getParameter("pageIndex")!=""){
			pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		}
		if(request.getParameter("startDate")!=null&&request.getParameter("startDate")!=""){
			startDate=request.getParameter("startDate");
			List<Performance> list=userPerformanceBiz.getList(pageIndex, pageSize,id, startDate);
			int count=userPerformanceBiz.getCounts(id, startDate);
			int pageCount=userPerformanceBiz.getPageCounts(pageSize, id, startDate);
			PageBean pageBean=new PageBean(pageIndex, pageSize, list, pageCount);
			request.setAttribute("startDate", startDate);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			request.getRequestDispatcher("WEB-INF/performance/userperformance.jsp").forward(request, response);
		}
		else{
			List<Performance> list=userPerformanceBiz.getListAll(pageIndex, pageSize, id);
			int counts=userPerformanceBiz.getCounts(id);
			int pageCounts=userPerformanceBiz.getPageCounts(pageSize, id);
			PageBean pageBean=new PageBean(pageIndex, pageSize, list, pageCounts);
			request.setAttribute("startDate", startDate);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("list", list);
			request.setAttribute("count", counts);
			request.getRequestDispatcher("WEB-INF/performance/userperformance.jsp").forward(request, response);
		}
	}

}
