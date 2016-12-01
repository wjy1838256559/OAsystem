/**
 * 
 */
package com.zrgj.oa.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author song
 *
 *	功能:数据库操作的工具类
 *
 * 	2016-11-16
 */
public class DBUtil {
	
	private static Connection connection;
	
	private DBUtil(){};
	
	public static Connection getInstance(){
		if(connection==null){
			try {
				String path=DBUtil.class.getClassLoader().getResource("jdbc.properties").getPath();
				InputStream in=new FileInputStream(path);
				Properties prop=new Properties();
				prop.load(in);
				String driver=prop.getProperty("driverClass");
				String url=prop.getProperty("jdbcUrl");
				String user=prop.getProperty("user");
				String password=prop.getProperty("password");
				Class.forName(driver);
				connection=DriverManager.getConnection(url,user,password);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return connection;
	}
	
	public static void closeAll(ResultSet rs,PreparedStatement pstmt,Connection conn){
		try {
				if(rs!=null){
					rs.close();
				}
				if(pstmt!=null){
					pstmt.close();
				}
				if(conn!=null){
					conn.close();
				}
			} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static ResultSet getRes(String sql,Object...obj){
		ResultSet rs=null;
		Connection conn=getInstance();
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			if(obj!=null && obj.length>0){
				for (int i = 0; i < obj.length; i++) {
					Object object = obj[i];
					pstmt.setObject(i+1, object);
				}
			}
			rs=pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int add_update_delete(String sql,Object...obj){
		int result=0;
		Connection conn=getInstance();
		try {
			PreparedStatement pstmt=conn.prepareStatement(sql);
			if(obj!=null && obj.length>0){
				for (int i = 0; i < obj.length; i++) {
					Object object = obj[i];
					pstmt.setObject(i+1, object);
				}
			}
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
