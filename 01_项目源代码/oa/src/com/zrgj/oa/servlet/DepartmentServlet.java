package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.DepartmentBiz;
import com.zrgj.oa.biz.impl.DepartmentBizImpl;
import com.zrgj.oa.entity.Department;
import com.zrgj.oa.util.PageBean;

/**
 * 
 * @author song
 *
 *	功能:显示部门列表的Servlet
 *
 * 	2016-11-18
 */
public class DepartmentServlet extends HttpServlet {

	
	private static final long serialVersionUID = -4605300524511524272L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DepartmentBiz departmentBiz=new DepartmentBizImpl();
		int pageIndex=1;
		int pageSize=5;
		String index = request.getParameter("pageIndex");
		if (index != null && !index.equals("")) {
			pageIndex = Integer.parseInt(index);
		}
		String type = request.getParameter("type");
		String value = request.getParameter("key");
		String key="";
		int count=0;
		List<Department> departmentlist=new ArrayList<Department>();
		if (type != null && value != null && !type.equals("") && !value.equals("")) {
				key=new String(value.getBytes("ISO-8859-1"),"utf-8");
				Map map = new HashMap();
				map.put(type, key);
				count = departmentBiz.getCountsAddConndition(map);
				departmentlist = departmentBiz.getByPageAddConndition(pageIndex,
						pageSize, map);

		} else {
			count = departmentBiz.getCounts();
			departmentlist = departmentBiz.getList(pageIndex, pageSize);
		}
				
		PageBean pageBean=new PageBean(pageIndex, pageSize, departmentlist, count);
		request.setAttribute("key", key);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/WEB-INF/department/department.jsp").forward(request, response);
	}

}
