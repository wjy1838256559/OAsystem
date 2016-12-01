package com.zrgj.oa.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zrgj.oa.biz.DepartmentBiz;
import com.zrgj.oa.biz.StationBiz;
import com.zrgj.oa.biz.impl.DepartmentBizImpl;
import com.zrgj.oa.biz.impl.StationBizImpl;
import com.zrgj.oa.entity.Department;
import com.zrgj.oa.entity.Station;
/**
 * 
 * @author song
 *
 *	功能:执行更新岗位的Servlet
 * 
 *  日期：2016-11-24
 */
public class StationUpdateSqlServlet extends HttpServlet {

	private static final long serialVersionUID = -5666018070224318462L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
            doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id=request.getParameter("id");
		Station station=null;
		StationBiz stationBiz=new StationBizImpl();
		String sName=request.getParameter("sName");
		String d_Id=request.getParameter("dId");
		if(sName!=null && d_Id!=null && id!=null){
			int sId=Integer.parseInt(id);
			int dId=Integer.parseInt(d_Id);
			List<Station> stationList=stationBiz.getByNameAndDId(sName, dId);
			String description=request.getParameter("description");
			DepartmentBiz departmentBiz=new DepartmentBizImpl();
			Department department=departmentBiz.getById(dId);
			if(stationList!=null && stationList.size()>1){
				Station sta=new Station();
				sta.setId(sId);
				sta.setsName(sName);
				sta.setDescription(description);
				sta.setDepartment(department);
				request.setAttribute("station", sta);
				List<Department> departmentList=departmentBiz.findAll();
		        request.setAttribute("departmentList", departmentList);
				request.setAttribute("error", "该岗位已存在(指定部门)");
				request.getRequestDispatcher("/WEB-INF/station/gangweiedit.jsp").forward(request, response);
				return;
			}else{
				station=stationBiz.getById(sId);
				station.setDepartment(department);
				station.setsName(sName);
				station.setDescription(description);
				stationBiz.update(station);
				response.sendRedirect("StationServlet");
			}
		}
	}

}
