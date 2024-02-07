package com.ex.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	static String  url = "jdbc:mysql://localhost:3306/hospital2";
	static String  username = "nani";
	static String  password = "nani";
	private static Connection con = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url,username,password);
		return con;
	}
	 public static void main(String[] args) throws SQLException {
	        try {
	            Connection con = DBConnection.getConnection();
	            if (con != null) {
	                System.out.println("Connected to the database!");
	                con.close();
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
		 
    }

}


