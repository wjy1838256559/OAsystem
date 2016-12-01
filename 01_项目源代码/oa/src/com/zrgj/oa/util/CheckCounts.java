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
				//时间数组
				Object[] objDate={checkDate};
				return objDate;
			}
			public  Object[] getObjNumberDate(String number,String checkDate){
				//时间员工号数组
				Object[] objNumberDate={number,checkDate};
				return objNumberDate;
			}
			public  Object[] getObjNameDate(String name,String checkDate){
				//姓名时间数组
				Object[] objNameDate={name,checkDate};
				return objNameDate;
			}
			public  Object[] getObjNumber(String number){
				//员工号数组
				Object[] objNumber={number};
				return objNumber;
			}
			public  Object[] getObjName(String name){
				//员工姓名数组
				Object[] objName={name};
				return objName;
			}
			
}
