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

import com.zrgj.oa.biz.UserLeaveBiz;
import com.zrgj.oa.biz.impl.UserLeaveBizImpl;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Leave;

public class UserLeaveAddServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3340632928982410211L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
             doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			UserLeaveBiz userLeaveBiz=new UserLeaveBizImpl();
			Leave leave=new Leave();
			Date date=null;
			String reason=null;
            if(request.getParameter("date")!=null&&request.getParameter("date")!=""&&request.getParameter("reason")!=null&&request.getParameter("reason")!=""){
            	DateFormat format=new SimpleDateFormat("yyyy-MM-dd");
            	try {
					date=format.parse(request.getParameter("date"));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	reason=request.getParameter("reason");
            	Employee employee=(Employee) request.getSession().getAttribute("user");
            	leave.setDate(date);
            	leave.setReason(reason);
            	leave.setEmployee(employee);
            	userLeaveBiz.add(leave);
            	request.getRequestDispatcher("UserLeaveServlet").forward(request, response);
            }
            else{
            	response.sendRedirect("UserLeaveServlet");
            	return;
            }
	}

}
