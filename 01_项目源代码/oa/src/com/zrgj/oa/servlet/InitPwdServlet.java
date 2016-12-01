package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;

/**
 * @author song
 *
 *	功能:初始化密码Servlet
 * 
 *  日期：2016-11-17
 */
public class InitPwdServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String eId=request.getParameter("id");
		int result=0;
		if(eId!=null){
			int id=Integer.parseInt(eId);
			EmployeeBiz employeeBiz=new EmployeeBizImpl();
			result=employeeBiz.initPwd(id);
		}
		if(result>0){
			response.sendRedirect("EmployeeListServlet");
		}else{
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

}
