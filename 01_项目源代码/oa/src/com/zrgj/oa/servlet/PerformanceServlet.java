package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.PerformanceBiz;
import com.zrgj.oa.biz.impl.PerformanceBizImpl;
import com.zrgj.oa.entity.Performance;
import com.zrgj.oa.util.PageBean;
import com.zrgj.oa.util.PerformanceCounts;

public class PerformanceServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2339925397211748796L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PerformanceCounts co=new PerformanceCounts();
		int pageIndex=1;
		int pageSize=5;
		if(request.getParameter("pageIndex")!=null){
			pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		}
		String select=request.getParameter("select");
		String keywords=request.getParameter("keywords");
		String startDate=request.getParameter("startDate");
		PerformanceBiz performanceBiz=new PerformanceBizImpl();
		int counts=0;
		int pageCounts=0;
		
		List<Performance> list=null;
		if(select!=null&&select.equals("userId")){
			int number=0;
			if(keywords!=null&&keywords!=""){
				
				try{
					number=Integer.parseInt(keywords);
				}
				catch(RuntimeException e){
					request.getRequestDispatcher("/WEB-INF/performance/performance.jsp").forward(request, response);
					return;
				}
				
				if(startDate!=null&&startDate!=""){
					counts=performanceBiz.getCounts(co.getSqlNumberDate(), co.getObjNumberDate(number, startDate));
					pageCounts=performanceBiz.getPageCounts(pageSize,co.getSqlNumberDate(), co.getObjNumberDate(number, startDate));
					list=performanceBiz.getListByIdAll(pageIndex, pageSize, number, startDate);
				}
				else{
					counts=performanceBiz.getCounts(co.getSqlNumber(), co.getObjNumber(number));
					pageCounts=performanceBiz.getPageCounts(pageSize,co.getSqlNumber(), co.getObjNumber(number));
					list=performanceBiz.getListByEmployeeId(pageIndex, pageSize, number);
				}
				
			}
			else{
				if(startDate!=null&&startDate!=""){
					counts=performanceBiz.getCounts(co.getSqlDate(), co.getObjDate(startDate));
					pageCounts=performanceBiz.getPageCounts(pageSize,co.getSqlDate(), co.getObjDate(startDate));
					list=performanceBiz.getListByDate(pageIndex, pageSize,startDate);
				}
				else{
					counts=performanceBiz.getCount();
					pageCounts=performanceBiz.getPageCount(pageSize);
					list=performanceBiz.getList(pageIndex, pageSize);
				}
			}
			
		}
		
		
		
		
		
		
		else{
			
			if(keywords!=null&&keywords!=""){
				keywords=new String(request.getParameter("keywords").getBytes("iso-8859-1"),"utf-8");
				
				if(startDate!=null&&startDate!=""){
					counts=performanceBiz.getCounts(co.getSqlNameDate(), co.getObjNameDate(keywords, startDate));
					pageCounts=performanceBiz.getPageCounts(pageSize, co.getSqlNameDate(), co.getObjNameDate(keywords, startDate));
					list=performanceBiz.getListByNameAll(pageIndex, pageSize, keywords, startDate);
				}
				else{
					counts=performanceBiz.getCounts(co.getSqlName(), co.getObjName(keywords));
					pageCounts=performanceBiz.getPageCounts(pageSize,co.getSqlName(), co.getObjName(keywords));
					list=performanceBiz.getListByEmployeeName(pageIndex, pageSize, keywords);
				}
				
			}
			else{
				if(startDate!=null&&startDate!=""){
					counts=performanceBiz.getCounts(co.getSqlDate(), co.getObjDate(startDate));
					pageCounts=performanceBiz.getPageCounts(pageSize,co.getSqlDate(), co.getObjDate(startDate));
					list=performanceBiz.getListByDate(pageIndex, pageSize,startDate);
				}
				else{
					counts=performanceBiz.getCount();
					pageCounts=performanceBiz.getPageCount(pageSize);
					list=performanceBiz.getList(pageIndex, pageSize);
				}
			}
		}
		PageBean pageBean=new PageBean(pageIndex, pageSize, list, counts);
		request.setAttribute("select", select);
		request.setAttribute("keywords", keywords);
		request.setAttribute("startDate", startDate);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/performance/performance.jsp").forward(request, response);
	}

}
