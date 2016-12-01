package com.zrgj.oa.servlet;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.dao.StationDao;
import com.zrgj.oa.dao.impl.StationDaoImpl;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Station;

/**
 * 添加员工请求的Servlet
 * 
 * @author songwenchao
 * 
 */
public class EmployeeAddServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		String number = request.getParameter("number");
		if(number!=null && !number.equals("")){
			EmployeeBiz employeeBiz=new EmployeeBizImpl();
			Employee employee=employeeBiz.getByNumber(number);
			if(employee!=null){
				request.setAttribute("employee", employee);
				request.setAttribute("error", "该员工已存在！");
				request.getRequestDispatcher("/WEB-INF/employee/add.jsp").forward(request, response);
				return;
			}
		}
		Employee employee = new Employee();
		employee.setNumber(number);
		String name = request.getParameter("name");
		employee.setName(name);
		String phoneNumber = request.getParameter("phoneNumber");
		employee.setPhoneNumber(phoneNumber);
		String money = request.getParameter("money");
		employee.setMoney(new BigDecimal(money));
		String startDate = request.getParameter("startDate");
		employee.setStartDate(startDate);
		String workExperience = request.getParameter("workExperience");
		employee.setWorkExperience(workExperience);
		String sId = request.getParameter("sId");
		if (sId != null) {
			StationDao stationDao = new StationDaoImpl();
			int id = Integer.parseInt(sId);
			Station station = stationDao.getById(id);
			employee.setStation(station);
		}

		employee.setImage("a.jpg");
		EmployeeBiz employeeBiz = new EmployeeBizImpl();
		int result = employeeBiz.add(employee);
		if (result > 0) {
			response.sendRedirect("EmployeeListServlet");
		} else {
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}

}
