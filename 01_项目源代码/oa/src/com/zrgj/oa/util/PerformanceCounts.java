package com.zrgj.oa.util;

public class PerformanceCounts {
	public String getAll(){
		return "select count(*) as counts from performance,employee where performance.eId=employee.id";
	}
	public String getSqlDate(){
		return	"select count(*) as counts from performance,employee where performance.eId=employee.id and performance.startDate=?";
	}
	
	public String getSqlNumberDate(){
		return "select count(*) as counts from performance,employee where performance.eId=employee.id and employee.number=? and performance.startDate=?";
	}
	
	public String getSqlNameDate(){
		return "select count(*) as counts from performance,employee where performance.eId=employee.id and employee.name=? and performance.startDate=?";
	}
	
	public String getSqlNumber(){
		return "select count(*) as counts from performance,employee where performance.eId=employee.id and employee.number=?";
	}
	
	public String getSqlName(){
		return "select count(*) as counts from performance,employee where performance.eId=employee.id and employee.name=?";
	}
	        
			
			
			public Object[] getObjDate(String startDate){
				//时间数组
				Object[] objDate={startDate};
				return objDate;
			}
			public  Object[] getObjNumberDate(int number,String startDate){
				//时间员工号数组
				Object[] objNumberDate={number,startDate};
				return objNumberDate;
			}
			public  Object[] getObjNameDate(String name,String startDate){
				//姓名时间数组
				Object[] objNameDate={name,startDate};
				return objNameDate;
			}
			public  Object[] getObjNumber(int number){
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
