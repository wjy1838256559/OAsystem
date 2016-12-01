package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.entity.Employee;
/**
 * 
 * @author song
 *
 *	功能:个人中心Servlet
 * 
 *  日期：2016-11-25
 */
public class MyPageServlet extends HttpServlet {
	
	private static final long serialVersionUID = -461030848355018709L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("userId");
		Integer userId=Integer.parseInt(id);
		if(userId!=null){
			EmployeeBiz employeeBiz=new EmployeeBizImpl();
			Employee employee=employeeBiz.getById(userId);
			request.setAttribute("employee", employee);
			request.getRequestDispatcher("/WEB-INF/mypage/myPage.jsp").forward(request, response);
		}else{
			response.sendRedirect("error.jsp");
		}
	}

}
