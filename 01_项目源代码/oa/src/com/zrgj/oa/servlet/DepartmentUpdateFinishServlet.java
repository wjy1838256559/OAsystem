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
 * 
 * @author song
 *
 *	功能:修改部门信息的Servlet
 *
 * 	2016-11-18
 */
public class DepartmentUpdateFinishServlet extends HttpServlet {

	
	private static final long serialVersionUID = 4982905233422489000L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  request.setCharacterEncoding("utf-8");
		  DepartmentBiz departmentBiz=new DepartmentBizImpl();
		if(request.getSession().getAttribute("id")!=null){
			Integer id=(Integer) request.getSession().getAttribute("id");
			String dName=request.getParameter("dName");
			String description=request.getParameter("description");
			Department department=departmentBiz.getById(id);
			if(dName!=null && !dName.equals("")){
				List<Department> deptList=departmentBiz.getByName(dName);
				if(deptList!=null && deptList.size()>1){
					Department dept=new Department();
					dept.setdName(dName);
					dept.setDescription(description);
					request.setAttribute("department", dept);
					request.setAttribute("error", "该部门已存在");
					request.getRequestDispatcher("/WEB-INF/department/departmentedit.jsp").forward(request, response);
					return ;
				}
			}
			department.setdName(dName);
			department.setDescription(description);
			int result=departmentBiz.update(department);
			if(result>0){
				response.sendRedirect("DepartmentServlet");
			}
			else{
				response.sendRedirect("/WEB-INF/department/departmentedit.jsp");
			}
		}
		
		
	}

}
