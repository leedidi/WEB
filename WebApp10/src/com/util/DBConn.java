/*===============
   DBConn.java
================*/
// throws
// 디비컨 작성 쪽지시험 볼 것!
// 디비컨 연습해두기....... 디비컨.....


package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	private static Connection dbConn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if (dbConn == null)
		{
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "scott";
			String pwd = "tiger";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);
		}
		
		return dbConn;
	}
	
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException
	{
		if (dbConn == null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);
		}
		
		return dbConn;
	}
	
	public static void close() throws SQLException
	{
		if (dbConn != null) 
		{
			if (!dbConn.isClosed())
				dbConn.close();
		}
		
		dbConn = null;
	}
}