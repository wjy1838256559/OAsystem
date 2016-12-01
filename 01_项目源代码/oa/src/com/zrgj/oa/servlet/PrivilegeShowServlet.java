//package com.zrgj.oa.servlet;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.zrgj.oa.biz.PrivilegeBiz;
//import com.zrgj.oa.biz.impl.PrivilegeBizImpl;
//import com.zrgj.oa.biz.impl.RoleBiz;
//import com.zrgj.oa.biz.impl.RoleBizImpl;
//import com.zrgj.oa.entity.Privilege;
//import com.zrgj.oa.entity.Role;
//
///**
// * @author song
// *
// *	功能:设置权限传递信息显示的Servlet
// * 
// *  日期：2016-11-20
// */
//public class PrivilegeShowServlet extends HttpServlet {
//	
//	private PrivilegeBiz privilegeBiz=new PrivilegeBizImpl();
//	
//	private RoleBiz roleBiz=new RoleBizImpl();
//	
//	public void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//			doPost(request, response);
//	}
//
//	public void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String id=request.getParameter("roleId");
//		if(id!=null && !id.equals("")){
//			int roleId=Integer.parseInt(id);
//			Role role=roleBiz.getById(roleId);
//			List<Privilege> privileges=privilegeBiz.getByRoleId(roleId);
//			if(privileges!=null && privileges.size()>0){
//				request.setAttribute("privileges", privileges);
//				request.setAttribute("role", role);
//				request.getRequestDispatcher("/WEB-INF/station/setStation.jsp").forward(request, response);
//			}
//		}
//	}
//
//}
