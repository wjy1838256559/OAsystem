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
 * @author song
 *
 *	功能:处理删除员工信息的Servlet(改变状态不可用)
 *
 * 	2016-11-17
 */
public class EmployeeDeleteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("id");
		if(id!=null && !id.equals("")){
			EmployeeBiz employeeBiz=new EmployeeBizImpl();
			int result=employeeBiz.delete(Integer.parseInt(id));
			if(result>0){
				response.sendRedirect("EmployeeListServlet");
				return ;
			}
		}else{
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
