package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.DepartmentBiz;
import com.zrgj.oa.biz.impl.DepartmentBizImpl;

/**
 * @author song
 *
 *	功能:删除部门使用的Servlet
 *
 * 	2016-11-18
 */
public class DepartmentDeleteServlet extends HttpServlet {

	
	private static final long serialVersionUID = -3320073000597027882L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("id")!=null){
			int id=Integer.parseInt(request.getParameter("id"));
			DepartmentBiz departmentBiz=new DepartmentBizImpl();
			int result=departmentBiz.delete(id);
			response.sendRedirect("DepartmentServlet");
			}
		}
		
}
