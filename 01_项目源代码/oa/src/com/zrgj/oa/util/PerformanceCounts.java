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
				//ʱ������
				Object[] objDate={startDate};
				return objDate;
			}
			public  Object[] getObjNumberDate(int number,String startDate){
				//ʱ��Ա��������
				Object[] objNumberDate={number,startDate};
				return objNumberDate;
			}
			public  Object[] getObjNameDate(String name,String startDate){
				//����ʱ������
				Object[] objNameDate={name,startDate};
				return objNameDate;
			}
			public  Object[] getObjNumber(int number){
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
