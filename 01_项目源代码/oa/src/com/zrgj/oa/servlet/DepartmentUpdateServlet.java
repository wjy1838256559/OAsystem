package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.DepartmentBiz;
import com.zrgj.oa.biz.impl.DepartmentBizImpl;
import com.zrgj.oa.entity.Department;
/**
 * 
 * @author song
 *
 *	功能:提供更新时页面所需信息的Servelt
 *
 * 	2016-11-18
 */
public class DepartmentUpdateServlet extends HttpServlet {

	private static final long serialVersionUID = -5944307092970268258L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("id")!=null){
			int id=Integer.parseInt(request.getParameter("id"));
			DepartmentBiz departmentBiz=new DepartmentBizImpl();
			Department department=departmentBiz.getById(id);
			
			request.getSession().setAttribute("id", id);
			request.setAttribute("department", department);
			
			request.getRequestDispatcher("/WEB-INF/department/departmentedit.jsp").forward(request, response);
		}
		
		
	}

}
