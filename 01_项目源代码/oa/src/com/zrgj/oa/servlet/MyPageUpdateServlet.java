package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.entity.Employee;


public class MyPageUpdateServlet extends HttpServlet {

	private static final long serialVersionUID = 524985736440866704L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("userId");
		if(id!=null){
			Integer userId=Integer.parseInt(id);
			EmployeeBiz employeeBiz=new EmployeeBizImpl();
			Employee employee=employeeBiz.getById(userId);
			String phoneNumber=request.getParameter("phoneNumber");
			String password=request.getParameter("pwd");
			String pwd=DigestUtils.md5Hex(password.getBytes());
			employee.setPhoneNumber(phoneNumber);
			employee.setPwd(pwd);
			int result=employeeBiz.update(employee);
			if(result>0){
				response.sendRedirect("userIndex.jsp");
			}
		}else{
			response.sendRedirect("error.jsp");
		}
	}
	 

}
