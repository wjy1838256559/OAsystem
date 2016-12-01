package com.zrgj.oa.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author song
 *
 *	功能:根据图片url返回图片信息
 * 
 *  日期：2016-11-19
 */
public class ImageShowServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url=request.getParameter("image");
		if(url!=null && !url.equals("")){
			String imageUrl=new String(url.getBytes("iso-8859-1"),"utf-8");
			request.getRequestDispatcher("/WEB-INF/image/"+imageUrl).forward(request, response);
		}
	}

}
