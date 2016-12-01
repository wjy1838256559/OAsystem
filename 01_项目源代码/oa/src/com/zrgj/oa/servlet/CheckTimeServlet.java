package com.zrgj.oa.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.entity.Employee;

public class CheckTimeServlet extends HttpServlet {

	private static final long serialVersionUID = 3497267008298244112L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("userId");
		Integer userId=null;
		boolean flag=true;
		if (id != null && !id.equals("")) {
			userId = Integer.parseInt(id);
			request.setAttribute("userId", userId);
		}
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat dateFor = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String str_1 = dateFormat.format(date);
		String str_2 = "08-00-00";
		String str = str_1 + "-" + str_2;
		Date oldDate = null;
		try {
			oldDate = dateFor.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		if (date.getTime() < oldDate.getTime()) {
			request.getRequestDispatcher("SignServlet").forward(request,
					response);
		} else {
			if(flag){
				EmployeeBiz employeeBiz=new EmployeeBizImpl();
				Employee employee=employeeBiz.getById(userId);
				employee.setLoseTime(employee.getLoseTime()+1);
				employeeBiz.update(employee);
				flag=false;
			}
			response.sendRedirect("userIndex.jsp");
		}
	}

}
