package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.DepartmentBiz;
import com.zrgj.oa.biz.impl.DepartmentBizImpl;
import com.zrgj.oa.entity.Department;

/**
 * 添加部门使用的Servlet
 * @author song
 *
 *	功能:
 *
 * 	2016-11-18
 */
public class DepartmentAddServlet extends HttpServlet {

	
	private static final long serialVersionUID = 1859742348075723890L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DepartmentBiz departmentBiz=new DepartmentBizImpl();
		String dName=request.getParameter("dName");
		String description=request.getParameter("description");
		if(dName!=null && !dName.equals("")){
			List<Department> departmentList=departmentBiz.getByName(dName);
			if(departmentList!=null && departmentList.size()>1){
				Department dept=new Department();
				dept.setdName(dName);
				dept.setDescription(description);
				request.setAttribute("department", dept);
				request.setAttribute("error", "该部门已存在");
				request.getRequestDispatcher("/WEB-INF/department/departmentedit.jsp").forward(request, response);
				return ;
			}
		}
		if(dName!=null&&dName!=""&&description!=null&&description!=""){
			
			Department department=new Department();
			department.setdName(dName);
			department.setDescription(description);
			int result=departmentBiz.add(department);
			if(result>0){
				response.sendRedirect("DepartmentServlet");
			}
			else{
				response.sendRedirect("/WEB-INF/department/departmentedit.jsp");
			}
				
		}
		else{
			response.sendRedirect("/WEB-INF/department/departmentedit.jsp");
		}
	}

}

