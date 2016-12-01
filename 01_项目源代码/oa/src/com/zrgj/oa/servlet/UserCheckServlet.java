package com.zrgj.oa.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.UserCheckBiz;
import com.zrgj.oa.biz.impl.UserCheckBizImpl;
import com.zrgj.oa.entity.Check;
import com.zrgj.oa.util.PageBean;

public class UserCheckServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8681275597694949582L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkDate=null;
		int pageIndex=1;
		int pageSize=5;
		int id=Integer.parseInt(request.getParameter("userId"));
		UserCheckBiz userCheckBiz=new UserCheckBizImpl();
		if(request.getParameter("pageIndex")!=null&&request.getParameter("pageIndex")!=""){
			pageIndex=Integer.parseInt(request.getParameter("pageIndex"));
		}
		if(request.getParameter("checkDate")!=null&&request.getParameter("checkDate")!=""){
			checkDate=request.getParameter("checkDate");
			List<Check> list=userCheckBiz.getList(pageIndex, pageSize,id, checkDate);
			int count=userCheckBiz.getCounts(id, checkDate);
			int pageCount=userCheckBiz.getPageCounts(pageSize, id, checkDate);
			PageBean pageBean=new PageBean(pageIndex, pageSize, list, pageCount);
			request.setAttribute("checkDate", checkDate);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			request.getRequestDispatcher("WEB-INF/check/usercheck.jsp").forward(request, response);
		}
		else{
			List<Check> list=userCheckBiz.getListAll(pageIndex, pageSize, id);
			int counts=userCheckBiz.getCounts(id);
			int pageCounts=userCheckBiz.getPageCounts(pageSize, id);
			PageBean pageBean=new PageBean(pageIndex, pageSize, list, pageCounts);
			request.setAttribute("checkDate", checkDate);
			request.setAttribute("pageBean", pageBean);
			request.setAttribute("list", list);
			request.setAttribute("count", counts);
			request.getRequestDispatcher("WEB-INF/check/usercheck.jsp").forward(request, response);
		}
		
	}

}
