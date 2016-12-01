//package com.zrgj.oa.servlet;
//
//import java.io.IOException;
//import java.util.HashSet;
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
// *	功能:设置权限的Servlet
// * 
// *  日期：2016-11-20
// */
//public class RoleSetPrivServlet extends HttpServlet {
//	
//	private RoleBiz roleBiz=new RoleBizImpl();
//	
//	private PrivilegeBiz privilegeBiz=new PrivilegeBizImpl();
//	
//	public void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//			doPost(request, response);
//	}
//
//	public void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String id=request.getParameter("roleId");
//		int result=0;
//		if(id!=null && !id.equals("")){
//			int roleId=Integer.parseInt(id);
//			Role role=roleBiz.getById(roleId);
//			if(role!=null){
//				String[] array = request.getParameterValues("privilegeIds");
//				Long[] privilegeIds=new Long[array.length];
//				if(array!=null && array.length>0){
//					for(int i=0;i<array.length;i++){
//						privilegeIds[i]=Long.parseLong(array[i]);
//					}
//				}
//				if(privilegeIds!=null){
//					List<Privilege> privileges=privilegeBiz.getPrivilegeByIds(privilegeIds);
//					role.setPrivilegeList(new HashSet<Privilege>(privileges));
//					result=roleBiz.add(role);
//				}
//				if(result>0){
//					response.sendRedirect("StationServlet");
//				}
//			}
//		}else{
//			request.getRequestDispatcher("/error.jsp").forward(request, response);
//		}
//		
//	}
//
//}
