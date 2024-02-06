package com.ex.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.User;

import com.connec.DBConnection;
import com.entity.Salesman;

public class DaoClass {
		
		private Connection con;
		String insertSql = "insert into salesman (id,name,capital,commission)"
				+ "values (?,?,?,?)";
		String updateSql = "update salesman set name=?,capital=?,commission=? where id=?";
		String getAll = "select * from salesman";
		List<Salesman> sal = new ArrayList<Salesman>();
		public DaoClass(Connection con) {
			super();
			this.con = con;
		}
		public boolean addSaleman(Salesman sal) throws SQLException {
			boolean f = false;
			PreparedStatement ps = con.prepareStatement(insertSql);
			ps.setInt(1, sal.getId());
			ps.setString(2, sal.getName());
			ps.setString(3, sal.getCapital());
			ps.setInt(4, sal.getCommission());
			int rs = ps.executeUpdate();
			
			if(rs == 1) {
				f = true;
			}
			return f;
		}
		public boolean updateSalesman(Salesman sal) throws SQLException {
			boolean f = false;
			PreparedStatement ps = con.prepareStatement(updateSql);
			ps.setString(1, sal.getName());
			ps.setString(2, sal.getCapital());
			ps.setInt(3, sal.getCommission());
			ps.setInt(4, sal.getId());
			int rs = ps.executeUpdate();
			
			if(rs == 1) {
				f = true;
			}
			return f;
		}
		public List<Salesman> getAllDetails(){
			Salesman s = null;
			try {
				PreparedStatement ps = con.prepareStatement(getAll);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					s = new Salesman();
					s.setId(rs.getInt(1));
					s.setName(rs.getString(2));
					s.setCapital(rs.getString(3));
					s.setCommission(rs.getInt(4));
					sal.add(s);
				}
			}
				catch(Exception e) {
					e.printStackTrace();
				}
			return sal;
				
			}	
		
		public Salesman getSalesmanId(int id) {
			Salesman s = null;
			String sql = "select * from salesman where id=?";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					s = new Salesman();
					s.setId(rs.getInt(1));
					s.setName(rs.getString(2));
					s.setCapital(rs.getString(3));
					s.setCommission(rs.getInt(4));
				
				}
			}
				catch(Exception e) {
					e.printStackTrace();
				}
			return s;
		}
		public boolean deleteSalesman(int id) {
			Salesman s = null;
			String sql = "delete from salesman where id=?";
			boolean f = false;
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, id);
				int i = ps.executeUpdate();
				if(i == 1) {
					f = true;
				}
				else {
					f= false;
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return f;
			
		}
		public static void main(String[] arg) throws ClassNotFoundException, SQLException {
			DaoClass obj = new DaoClass(DBConnection.getConnection());
			System.out.println(obj.updateSalesman(null));
			
		}
}