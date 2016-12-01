package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.DepartmentBiz;
import com.zrgj.oa.biz.impl.DepartmentBizImpl;
import com.zrgj.oa.entity.Department;

/**
 * @author song
 *
 *	功能:添加岗位传递信息的Servlet
 *
 * 	2016-11-21
 */
public class StationShowServlet extends HttpServlet {
	
	private DepartmentBiz departmentBiz=new DepartmentBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Department> departmentList=departmentBiz.findAll();
		request.setAttribute("departmentList",departmentList);
		request.getRequestDispatcher("/WEB-INF/station/gangweiadd.jsp").forward(request, response);
	}

}
