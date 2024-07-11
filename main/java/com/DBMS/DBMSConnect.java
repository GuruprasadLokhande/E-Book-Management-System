package com.DBMS;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBMSConnect {
	private static Connection conn;
	
	static final String URL="jdbc:mysql://localhost:3306/ebookapp";
	static final String USER="root";
	static final String pass="9975447135";

	public static Connection getConn() {
		try {
			if(conn==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(URL,USER,pass);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}