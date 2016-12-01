package com.zrgj.oa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserStationServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6097233211700150364L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/station/usergangwei.jsp").forward(request, response);
		//response.sendRedirect("WEB-INF/station/usergangwei.jsp");
		
	}

}
