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

import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.StationBiz;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.biz.impl.StationBizImpl;
import com.zrgj.oa.dao.StationDao;
import com.zrgj.oa.dao.impl.StationDaoImpl;
import com.zrgj.oa.entity.Employee;
import com.zrgj.oa.entity.Station;
import com.zrgj.oa.util.PageBean;

/**
 * @author song
 * 
 *         功能:处理员工列表请求的Servlet
 * 
 *         2016-11-17
 */
public class EmployeeListServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		EmployeeBiz employeeBiz = new EmployeeBizImpl();
		int pageIndex = 1;
		int pageSize = 5;
		String index = request.getParameter("pageIndex");
		if (index != null && !index.equals("")) {
			pageIndex = Integer.parseInt(index);
		}
		String type = request.getParameter("type");
		String value = request.getParameter("key");
		String key="";
		List<Employee> emList = new ArrayList<Employee>();
		int count = 0;
		if (type != null && value != null && !type.equals("") && !value.equals("")) {
			key=new String(value.getBytes("ISO-8859-1"),"utf-8");
			Map map = new HashMap();
			//根据岗位名称查询员工列表
			if (type.equals("sName")) {
				StationBiz stationBiz=new StationBizImpl();
				Station station=stationBiz.getByName(key);
				map.put("sId", station.getId());
				count=employeeBiz.getCountAddConndition(map);
				emList=employeeBiz.getByPageAddConndition(pageIndex, pageSize, map);
			} else {
				map.put(type, key);
				count = employeeBiz.getCountAddConndition(map);
				emList = employeeBiz.getByPageAddConndition(pageIndex,
						pageSize, map);
			}

		} else {
			count = employeeBiz.getCount();
			emList = employeeBiz.getByPage(pageIndex, pageSize);
		}
		if (emList != null && emList.size() > 0) {
			PageBean pageBean=new PageBean(pageIndex, pageSize, emList, count);
			request.setAttribute("key", key);
			request.setAttribute("type", type);
			request.setAttribute("pageBean", pageBean);
			request.getRequestDispatcher("/WEB-INF/employee/emlist.jsp")
					.forward(request, response);
		} else {
			request.getRequestDispatcher("").forward(request, response);
		}
	}

}
