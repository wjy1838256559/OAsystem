package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.CheckBiz;
import com.zrgj.oa.biz.impl.CheckBizImpl;
import com.zrgj.oa.entity.Check;
import com.zrgj.oa.util.CheckCounts;
import com.zrgj.oa.util.PageBean;

public class CheckServlet extends HttpServlet {

	
	private static final long serialVersionUID = -5617423532299891346L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		CheckCounts co=new CheckCounts();
		int pageIndex=1;
		int pageSize=5;
		if(request.getParameter("pageIndex")!=null){
			pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		}
		String select=request.getParameter("select");
		String keywords=request.getParameter("keywords");
		String checkDate=request.getParameter("checkDate");
		CheckBiz checkBiz=new CheckBizImpl();
		int counts=0;
		int pageCounts=0;
		
		List<Check> list=null;
		if(select!=null&&select.equals("userId")){
			String number="";
			if(keywords!=null&&keywords!=""){
				
				try{
					number=keywords;
				}
				catch(RuntimeException e){
					request.getRequestDispatcher("/WEB-INF/check/check.jsp").forward(request, response);
					return;
				}
				
				if(checkDate!=null&&checkDate!=""){
					counts=checkBiz.getCounts(co.getSqlNumberDate(), co.getObjNumberDate(number, checkDate));
					pageCounts=checkBiz.getPageCounts(pageSize,co.getSqlNumberDate(), co.getObjNumberDate(number, checkDate));
					list=checkBiz.getListByIdAll(pageIndex, pageSize, number, checkDate);
				}
				else{
					counts=checkBiz.getCounts(co.getSqlNumber(), co.getObjNumber(number));
					pageCounts=checkBiz.getPageCounts(pageSize,co.getSqlNumber(), co.getObjNumber(number));
					list=checkBiz.getListByEmployeeId(pageIndex, pageSize, number);
				}
				
			}
			else{
				if(checkDate!=null&&checkDate!=""){
					counts=checkBiz.getCounts(co.getSqlDate(), co.getObjDate(checkDate));
					pageCounts=checkBiz.getPageCounts(pageSize,co.getSqlDate(), co.getObjDate(checkDate));
					list=checkBiz.getListByDate(pageIndex, pageSize,checkDate);
				}
				else{
					counts=checkBiz.getCount();
					pageCounts=checkBiz.getPageCount(pageSize);
					list=checkBiz.getList(pageIndex, pageSize);
				}
			}
			
		}
		
		
		
		
		
		
		else{
			
			if(keywords!=null&&keywords!=""){
				keywords=new String(request.getParameter("keywords").getBytes("iso-8859-1"),"utf-8");
				
				if(checkDate!=null&&checkDate!=""){
					counts=checkBiz.getCounts(co.getSqlNameDate(), co.getObjNameDate(keywords, checkDate));
					pageCounts=checkBiz.getPageCounts(pageSize, co.getSqlNameDate(), co.getObjNameDate(keywords, checkDate));
					list=checkBiz.getListByNameAll(pageIndex, pageSize, keywords, checkDate);
				}
				else{
					counts=checkBiz.getCounts(co.getSqlName(), co.getObjName(keywords));
					pageCounts=checkBiz.getPageCounts(pageSize,co.getSqlName(), co.getObjName(keywords));
					list=checkBiz.getListByEmployeeName(pageIndex, pageSize, keywords);
				}
				
			}
			else{
				if(checkDate!=null&&checkDate!=""){
					counts=checkBiz.getCounts(co.getSqlDate(), co.getObjDate(checkDate));
					pageCounts=checkBiz.getPageCounts(pageSize,co.getSqlDate(), co.getObjDate(checkDate));
					list=checkBiz.getListByDate(pageIndex, pageSize,checkDate);
				}
				else{
					counts=checkBiz.getCount();
					pageCounts=checkBiz.getPageCount(pageSize);
					list=checkBiz.getList(pageIndex, pageSize);
				}
			}
		}
		PageBean pageBean=new PageBean(pageIndex, pageSize, list, counts);
		request.setAttribute("select", select);
		request.setAttribute("keywords", keywords);
		request.setAttribute("checkDate", checkDate);
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/check/check.jsp").forward(request, response);
	}

}
