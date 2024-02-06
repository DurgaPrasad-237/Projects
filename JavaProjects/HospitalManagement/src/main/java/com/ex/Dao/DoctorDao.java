package com.ex.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ex.Entity.Doctor;

public class DoctorDao {
	private Connection con;
	public DoctorDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean registerDoctor(Doctor doc) throws SQLException {
		boolean check = false;
		String sql = "insert into doctors (fullname,dob,qualification,specialist,email,mobno,password) values"
				+ "(?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, doc.getFullName());
		ps.setString(2, doc.getDob());
		ps.setString(3, doc.getQualification());
		ps.setString(4, doc.getSpecialist());
		ps.setString(5, doc.getEmail());
		ps.setString(6, doc.getMobno());
		ps.setString(7, doc.getPassword());
		
		int i = ps.executeUpdate();
		if(i == 1) {
			check = true;
		}
		return check;
	}
	public List<Doctor> getDoctors() throws SQLException{
		Doctor doc = null;
		List<Doctor> list = new ArrayList<Doctor>();
		String sql = "select * from doctors order by fullname asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs  = ps.executeQuery();
		while(rs.next()) {
			doc = new Doctor();
			doc.setId(rs.getInt(1));
			doc.setFullName(rs.getString("fullname"));
			doc.setDob(rs.getString("dob"));
			doc.setQualification(rs.getString("qualification"));
			doc.setSpecialist(rs.getString("specialist"));
			doc.setEmail(rs.getString("email"));
			doc.setMobno(rs.getString("mobno"));
			list.add(doc);
		}
		return list;
	}
	public Doctor getDoctorById(int id) throws SQLException{
		Doctor doc = null;
		
		String sql = "select * from doctors where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs  = ps.executeQuery();
		while(rs.next()) {
			doc = new Doctor();
			doc.setId(rs.getInt(1));
			doc.setFullName(rs.getString("fullname"));
			doc.setDob(rs.getString("dob"));
			doc.setQualification(rs.getString("qualification"));
			doc.setSpecialist(rs.getString("specialist"));
			doc.setEmail(rs.getString("email"));
			doc.setMobno(rs.getString("mobno"));
			
		}
		return doc;
	}
	public boolean updateDoctor(Doctor doc) throws SQLException {
		boolean check = false;
		String sql = "update doctors set fullname=?,dob=?,qualification=?,specialist=?,email=?,mobno=?,password=?  where id=?";
				
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, doc.getFullName());
		ps.setString(2, doc.getDob());
		ps.setString(3, doc.getQualification());
		ps.setString(4, doc.getSpecialist());
		ps.setString(5, doc.getEmail());
		ps.setString(6, doc.getMobno());
		ps.setString(7, doc.getPassword());
		ps.setInt(8, doc.getId());
		
		int i = ps.executeUpdate();
		if(i == 1) {
			System.out.println("updated");
			check = true;
		}
		return check;
	}
	public boolean deleteDoctor(int id) throws SQLException {
		boolean check = false;
		String sql = "delete from doctors where id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, id);
		int i = ps.executeUpdate();
		while(i == 1) {
			return true;
		}
		return check;
	}
	public Doctor loginDoctor(String email,String Password) throws SQLException {
		Doctor doc = null;
		String sql = "select * from doctors where email=? and password=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, email);
		ps.setString(2, Password);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			doc = new Doctor();
			
			doc.setId(rs.getInt(1));
			doc.setFullName(rs.getString("fullname"));
			doc.setDob(rs.getString("dob"));
			doc.setQualification(rs.getString("qualification"));
			doc.setSpecialist(rs.getString("specialist"));
			doc.setEmail(rs.getString("email"));
			doc.setMobno(rs.getString("mobno"));
		}
		return doc;
	}
	public int countDoctor() throws SQLException {
		int doccount = 0;
		String sql = "SELECT COUNT(id) AS doctorCount FROM doctors";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet  rs = ps.executeQuery();
		while(rs.next()) {
			 doccount = rs.getInt("doctorCount");
		}
		return doccount;	
	}

}
