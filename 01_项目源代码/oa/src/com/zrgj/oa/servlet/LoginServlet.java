package com.zrgj.oa.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.zrgj.oa.biz.AdminBiz;
import com.zrgj.oa.biz.CheckBiz;
import com.zrgj.oa.biz.EmployeeBiz;
import com.zrgj.oa.biz.impl.AdminBizImpl;
import com.zrgj.oa.biz.impl.CheckBizImpl;
import com.zrgj.oa.biz.impl.EmployeeBizImpl;
import com.zrgj.oa.entity.Admin;
import com.zrgj.oa.entity.Check;
import com.zrgj.oa.entity.Employee;

/**
 * @author song
 * 
 *         功能:登录的Servlet
 * 
 *         2016-11-18
 */
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 2304413576488137947L;
	
	private CheckBiz checkBiz=new CheckBizImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String code = request.getParameter("code");
		String rand = (String) request.getSession().getAttribute("rand");
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String role = request.getParameter("role");
		if (!code.equalsIgnoreCase(rand)) {
			request.setAttribute("userName", userName);
			request.setAttribute("userPwd", userPwd);
			request.setAttribute("error", "验证码错误");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		if (userName != null && userPwd != null) {
			AdminBiz adminBiz = new AdminBizImpl();
			if (role.equals("admin")) {
				Admin admin = adminBiz.getByUserName(userName);
				if (admin != null) {
					String pwd = admin.getPwd();
					if (userPwd.equals(pwd)) {
						request.getSession().setAttribute("user", admin);
						response.sendRedirect("index.jsp");
						return;
					}else{
						request.setAttribute("error", "用户名或密码错误");
						request.getRequestDispatcher("login.jsp").forward(request, response);
					}
				}
			} else if (role.equals("user")) {
				EmployeeBiz employeeBiz = new EmployeeBizImpl();
				Employee employee = employeeBiz.getByNumber(userName);
				if (employee != null) {
					String pwd=DigestUtils.md5Hex(userPwd.getBytes());
					if (employee.getPwd().equals(pwd)) {
						request.getSession().setAttribute("user", employee);
						SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
						String checkDate=df.format(new Date());
						List<Check> check=checkBiz.getListByIdAll(1, 1, employee.getNumber(), checkDate);
						request.getSession().setAttribute("check", check);
						response.sendRedirect(request.getContextPath()
								+ "/userIndex.jsp");
						return;
					}else{
						request.setAttribute("userName", userName);
						request.setAttribute("userPwd", userPwd);
						request.setAttribute("error", "用户名或密码错误");
						request.getRequestDispatcher("login.jsp").forward(request, response);
					}
				}
			}
		}
		
	}

}
