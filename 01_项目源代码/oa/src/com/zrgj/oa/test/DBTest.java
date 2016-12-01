/**
 * 
 */
package com.zrgj.oa.test;

import java.sql.Connection;

import com.zrgj.oa.util.DBUtil;

/**
 * @author song
 *
 *	功能:数据库的测试类
 *
 * 	2016-11-16
 */
public class DBTest {
	
	public static void main(String[] args) {
		Connection conn=DBUtil.getInstance();
		System.out.println(conn);
	}

}
