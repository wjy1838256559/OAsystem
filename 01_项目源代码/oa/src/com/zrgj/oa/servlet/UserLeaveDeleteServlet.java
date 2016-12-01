package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.UserLeaveBiz;
import com.zrgj.oa.biz.impl.UserLeaveBizImpl;

public class UserLeaveDeleteServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 5437044109567190542L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
                doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			int id=0;
           if(request.getParameter("id")!=null&&request.getParameter("id")!=""){
        	   id=Integer.parseInt(request.getParameter("id"));
           }
           UserLeaveBiz userLeaveBiz=new UserLeaveBizImpl();
           userLeaveBiz.delete(id);
           request.getRequestDispatcher("UserLeaveServlet").forward(request, response);
        
	}

}
