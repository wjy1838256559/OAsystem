package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.StationBiz;
import com.zrgj.oa.biz.impl.StationBizImpl;
import com.zrgj.oa.dao.DepartmentDao;
import com.zrgj.oa.dao.impl.DepartmentDaoImpl;
import com.zrgj.oa.entity.Department;
import com.zrgj.oa.entity.Station;

/**
 * 
 * @author song
 * 
 *         功能:添加岗位使用的Servlet
 * 
 *         2016-11-18
 */
public class StationAddServlet extends HttpServlet {

	private static final long serialVersionUID = 1884699942964503648L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String sName = request.getParameter("sName");
		String id=request.getParameter("dId");
		StationBiz stationBiz=new StationBizImpl();
		String description = request.getParameter("description");
		if(sName!=null && id!=null){
			int dId=Integer.parseInt(id);
			DepartmentDao departmentDao=new DepartmentDaoImpl();
			Department department=departmentDao.getById(dId);
			List<Station> stationList=stationBiz.getByNameAndDId(sName,dId);
			if(stationList!=null && stationList.size()>1){
				Station sta=new Station();
				sta.setsName(sName);
				sta.setDepartment(department);
				sta.setDescription(description);
				request.setAttribute("station",sta );
				request.setAttribute("error", "该岗位已存在(指定部门)");
				request.getRequestDispatcher("/WEB-INF/station/gangweiadd.jsp").forward(request, response);
				return ;
			}
			Station sta = new Station();
			sta.setDepartment(department);
			sta.setsName(sName);
			sta.setDescription(description);
			stationBiz.add(sta);
			response.sendRedirect("StationServlet");
		}
	}

}
