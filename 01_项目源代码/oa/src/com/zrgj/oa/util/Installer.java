package com.zrgj.oa.util;

import com.zrgj.oa.biz.PrivilegeBiz;
import com.zrgj.oa.biz.impl.PrivilegeBizImpl;
import com.zrgj.oa.entity.Privilege;

/**
 * @author song
 *
 *	功能:初始化权限
 * 
 *  日期：2016-11-20
 */
public class Installer {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		PrivilegeBiz privilegeBiz=new PrivilegeBizImpl();
		Privilege menu,menu1,menu2,menu3,menu4,menu5;
		menu=new Privilege("基本管理", null, null);
		menu1=new Privilege("人事管理", "/EmployeeListServlet", menu);
		menu2=new Privilege("部门管理", "/DepartmentServlet", menu);
		menu3=new Privilege("岗位管理", "/StationServlet", menu);
		menu4=new Privilege("绩效管理", "/PerformanceServlet", menu);
		menu5=new Privilege("考勤管理", "/CheckListServlet", menu);
		
		privilegeBiz.add(menu);
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
		privilegeBiz.add(menu3);
		privilegeBiz.add(menu4);
		privilegeBiz.add(menu5);
		
		menu2=new Privilege("新增员工", "/AddEmployeeShowServlet", menu1);
		menu3=new Privilege("修改员工", "/EmpolyeeShowServlet", menu1);
		menu4=new Privilege("删除员工", "/EmployeeDeleteServlet", menu1);
		menu5=new Privilege("初始化密码", "/InitPwdServlet", menu1);
		
		privilegeBiz.add(menu2);
		privilegeBiz.add(menu3);
		privilegeBiz.add(menu4);
		privilegeBiz.add(menu5);
		
		menu1=new Privilege("新增部门", "/DepartmentAddServlet", menu2);
		menu3=new Privilege("修改部门", "/DepartmentUpdateServlet", menu2);
		menu4=new Privilege("删除部门", "/DepartmentDeleteServlet", menu2);
		
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu3);
		privilegeBiz.add(menu4);
		
		menu1=new Privilege("新增岗位", "/StationAddServlet", menu3);
		menu2=new Privilege("修改岗位", "/StationUpdateServlet", menu3);
		menu4=new Privilege("删除岗位", "/StationUpdateSqlServlet", menu3);
		menu5=new Privilege("设置权限", "/StationSetPriServlet", menu3);
		
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
		privilegeBiz.add(menu4);
		privilegeBiz.add(menu5);
		
		menu1=new Privilege("设置期望值", "/", menu4);
		menu2=new Privilege("审批", "/", menu4);
		menu3=new Privilege("提醒", "/", menu4);
		
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
		privilegeBiz.add(menu3);
		
		menu1=new Privilege("提醒", "/", menu5);
		
		privilegeBiz.add(menu1);
		
		
		menu=new Privilege("网上交流", null, null);
		menu1=new Privilege("论坛管理", "/ForumServlet", menu);
		menu2=new Privilege("论坛", "/FornumServlet", menu);
		
		privilegeBiz.add(menu);
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
		
		menu = new Privilege("审批流转", null, null);
		menu1 = new Privilege("审批流程管理", "/", menu);
		menu2 = new Privilege("我的申请查询", "/", menu);
		
		privilegeBiz.add(menu);
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
	}

}
