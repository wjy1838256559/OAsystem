package com.zrgj.oa.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.StationBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.biz.impl.StationBizImpl;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Station;

/**
 * @author song
 *
 *	功能:更新员工信息的Servlet
 *
 * 	2016-11-17
 */
public class EmployeeUpdateServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String eid=request.getParameter("id");
		int result=0;
		if(eid!=null){
			EmployeeBiz employeeBiz=new EmployeeBizImpl();
			int id=Integer.parseInt(eid);
			String name=request.getParameter("name");
			String phoneNumber=request.getParameter("phoneNumber");
			String sId=request.getParameter("sId");
			Station station=null;
			if(sId!=null && !sId.equals("")){
				StationBiz stationBiz=new StationBizImpl();
				station=stationBiz.getById(Integer.parseInt(sId));
				
			}
			Employee employee=employeeBiz.getById(id);
			employee.setName(name);
			employee.setPhoneNumber(phoneNumber);
			employee.setStation(station);
			result=employeeBiz.update(employee);
		}
		if(result>0){
			response.sendRedirect("EmployeeListServlet");
		}else{
			response.sendRedirect("error.jsp");
		}
	}

}
