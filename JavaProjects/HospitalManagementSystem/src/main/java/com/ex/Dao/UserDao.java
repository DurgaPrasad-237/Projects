package com.ex.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ex.DB.DBConnection;
import com.ex.Entity.User;

public class UserDao {
	private Connection con;
	public UserDao(Connection con) {
		this.con = con;
	}
	public boolean userRegister(User u) throws SQLException {
		boolean check = false;	
		String sql = "insert into patients (name,email,password) values(?,?,?)";
		PreparedStatement ps2 = con.prepareStatement("Select * from patients");
		
		PreparedStatement ps = con.prepareCall(sql);
		ResultSet res = ps2.executeQuery();	
		while(res.next()) {
			if(res.getString("email").equals(u.getEmail())) {
			return check;
				
			}
		}	
		ps.setString(1, u.getName());
		ps.setString(2, u.getEmail());
		ps.setString(3, u.getPassword());
		int rs = ps.executeUpdate();
		if(rs == 1) {
			
			check = true;
		}
		return check;
	}
	public boolean loginCustomer(User u) throws SQLException {
		boolean check = false;
		String sql = "select * from patients where email=? and password=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		PreparedStatement ps2 = con.prepareStatement("Select * from patients");
		
		System.out.println(u.getEmail());
		System.out.println(u.getPassword());
		ps.setString(1, u.getName());
		ps.setString(2, u.getPassword());
		
		ResultSet rs = ps2.executeQuery();
		while(rs.next()) {
			System.out.println(rs.getString("email"));
			System.out.println(u.getEmail());
			System.out.println(rs.getString("password"));
			System.out.println(u.getPassword());
			if(rs.getString("email").equalsIgnoreCase(u.getEmail()) && rs.getString("password").equalsIgnoreCase(u.getPassword())) {
				check = true;
			}
		}
	
		return check;
		
	}
	public User userLogin(String email, String password) throws SQLException {
		User  u = null;
		String sql = "select * from patients where email=? and password=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			u = new User();
			u.setId(rs.getInt("id"));
			u.setName(rs.getString("name"));
			u.setEmail(rs.getString("email"));
			u.setPassword(rs.getString("password"));
		}
		return u;
		
	}
	public int countPatient() throws SQLException {
		int patcount = 0;
		String sql = "SELECT COUNT(id) AS patientcount FROM patients";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet  rs = ps.executeQuery();
		while(rs.next()) {
			 patcount = rs.getInt("patientcount");
		}
		return patcount;	
	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
	
	}

}

