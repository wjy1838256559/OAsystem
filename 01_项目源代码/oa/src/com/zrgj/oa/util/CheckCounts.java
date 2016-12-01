package com.zrgj.oa.util;

import java.util.Map;

public class CheckCounts {
	
	public String getAll(){
		return "select count(*) as counts from checker,employee where checker.eId=employee.id";
	}
	public String getSqlDate(){
		return	"select count(*) as counts from checker,employee where checker.eId=employee.id and checker.checkDate=?";
	}
	
	public String getSqlNumberDate(){
		return "select count(*) as counts from checker,employee where checker.eId=employee.id and employee.number=? and checker.checkDate=?";
	}
	
	public String getSqlNameDate(){
		return "select count(*) as counts from checker,employee where checker.eId=employee.id and employee.name=? and checker.checkDate=?";
	}
	
	public String getSqlNumber(){
		return "select count(*) as counts from checker,employee where checker.eId=employee.id and employee.number=?";
	}
	
	public String getSqlName(){
		return "select count(*) as counts from checker,employee where checker.eId=employee.id and employee.name=?";
	}
	        
			
			
			public Object[] getObjDate(String checkDate){
				//ʱ������
				Object[] objDate={checkDate};
				return objDate;
			}
			public  Object[] getObjNumberDate(String number,String checkDate){
				//ʱ��Ա��������
				Object[] objNumberDate={number,checkDate};
				return objNumberDate;
			}
			public  Object[] getObjNameDate(String name,String checkDate){
				//����ʱ������
				Object[] objNameDate={name,checkDate};
				return objNameDate;
			}
			public  Object[] getObjNumber(String number){
				//Ա��������
				Object[] objNumber={number};
				return objNumber;
			}
			public  Object[] getObjName(String name){
				//Ա����������
				Object[] objName={name};
				return objName;
			}
			
}
