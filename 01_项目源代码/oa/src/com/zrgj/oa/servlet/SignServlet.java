package com.zrgj.oa.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.CheckBiz;
import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.impl.CheckBizImpl;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.entity.Check;
import com.zrgj.oa.entity.Employee;

/**
 * @author song
 *
 *	功能:员工签到的Servlet
 * 
 *  日期：2016-11-19
 */
public class SignServlet extends HttpServlet {
	
	private CheckBiz checkBiz=new CheckBizImpl();
	private EmployeeBiz employeeBiz=new EmployeeBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id=request.getParameter("userId");
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date checkDate=new Date();
		int result=0;
		if(id!=null && !id.equals("")){
			int eId=Integer.parseInt(id);
			Employee employee=employeeBiz.getById(eId);
			CheckBiz checkBiz=new CheckBizImpl();
			List<Check> list=checkBiz.getListByIdAll(1, 1, employee.getNumber(), df.format(checkDate));
			if(list==null || list.size()<1){
				if(employee!=null){
					Check entity=new Check();
					entity.setEmployee(employee);
					entity.setCheckDate(checkDate);
					result=checkBiz.add(entity);
				}
			}
			if(result>0){
				request.getRequestDispatcher("/userIndex.jsp").forward(request, response);
			}
		}
	}

}
