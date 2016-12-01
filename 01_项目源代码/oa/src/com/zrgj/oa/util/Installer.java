package com.zrgj.oa.util;

import com.zrgj.oa.biz.PrivilegeBiz;
import com.zrgj.oa.biz.impl.PrivilegeBizImpl;
import com.zrgj.oa.entity.Privilege;

/**
 * @author song
 *
 *	����:��ʼ��Ȩ��
 * 
 *  ���ڣ�2016-11-20
 */
public class Installer {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		PrivilegeBiz privilegeBiz=new PrivilegeBizImpl();
		Privilege menu,menu1,menu2,menu3,menu4,menu5;
		menu=new Privilege("��������", null, null);
		menu1=new Privilege("���¹���", "/EmployeeListServlet", menu);
		menu2=new Privilege("���Ź���", "/DepartmentServlet", menu);
		menu3=new Privilege("��λ����", "/StationServlet", menu);
		menu4=new Privilege("��Ч����", "/PerformanceServlet", menu);
		menu5=new Privilege("���ڹ���", "/CheckListServlet", menu);
		
		privilegeBiz.add(menu);
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
		privilegeBiz.add(menu3);
		privilegeBiz.add(menu4);
		privilegeBiz.add(menu5);
		
		menu2=new Privilege("����Ա��", "/AddEmployeeShowServlet", menu1);
		menu3=new Privilege("�޸�Ա��", "/EmpolyeeShowServlet", menu1);
		menu4=new Privilege("ɾ��Ա��", "/EmployeeDeleteServlet", menu1);
		menu5=new Privilege("��ʼ������", "/InitPwdServlet", menu1);
		
		privilegeBiz.add(menu2);
		privilegeBiz.add(menu3);
		privilegeBiz.add(menu4);
		privilegeBiz.add(menu5);
		
		menu1=new Privilege("��������", "/DepartmentAddServlet", menu2);
		menu3=new Privilege("�޸Ĳ���", "/DepartmentUpdateServlet", menu2);
		menu4=new Privilege("ɾ������", "/DepartmentDeleteServlet", menu2);
		
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu3);
		privilegeBiz.add(menu4);
		
		menu1=new Privilege("������λ", "/StationAddServlet", menu3);
		menu2=new Privilege("�޸ĸ�λ", "/StationUpdateServlet", menu3);
		menu4=new Privilege("ɾ����λ", "/StationUpdateSqlServlet", menu3);
		menu5=new Privilege("����Ȩ��", "/StationSetPriServlet", menu3);
		
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
		privilegeBiz.add(menu4);
		privilegeBiz.add(menu5);
		
		menu1=new Privilege("��������ֵ", "/", menu4);
		menu2=new Privilege("����", "/", menu4);
		menu3=new Privilege("����", "/", menu4);
		
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
		privilegeBiz.add(menu3);
		
		menu1=new Privilege("����", "/", menu5);
		
		privilegeBiz.add(menu1);
		
		
		menu=new Privilege("���Ͻ���", null, null);
		menu1=new Privilege("��̳����", "/ForumServlet", menu);
		menu2=new Privilege("��̳", "/FornumServlet", menu);
		
		privilegeBiz.add(menu);
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
		
		menu = new Privilege("������ת", null, null);
		menu1 = new Privilege("�������̹���", "/", menu);
		menu2 = new Privilege("�ҵ������ѯ", "/", menu);
		
		privilegeBiz.add(menu);
		privilegeBiz.add(menu1);
		privilegeBiz.add(menu2);
	}

}
