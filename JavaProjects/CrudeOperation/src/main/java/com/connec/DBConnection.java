package com.connec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	static String  url = "jdbc:mysql://localhost:3306/example";
	static String  username = "nani";
	static String  password = "nani";
	private static Connection con = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url,username,password);
		return con;
	}
	 public static void main(String[] args) {
	        try {
	            Connection con = DBConnection.getConnection();
	            if (con != null) {
	                System.out.println("Connected to the database!");
	                con.close();
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }
		 
    }

}
