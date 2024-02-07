package com.ex.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ex.Entity.Appointment;

public class AppointmentDao {
	private Connection con;
	public AppointmentDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean addAppointment(Appointment ap) throws SQLException {
		boolean check = false;
		String sql = "insert into appointment (FullName,Gender,age,Appointment_date,email,phone_number,Disease,"
				+ "UserID,DoctorID,Address,Status) values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, ap.getFullname());
		ps.setString(2, ap.getGender());
		ps.setInt(3, ap.getAge());
		ps.setString(4, ap.getAppointmentdate());
		ps.setString(5, ap.getEmail());
		ps.setString(6, ap.getPhoneno());
		ps.setString(7, ap.getDisease());
		ps.setInt(8, ap.getUserID());
		ps.setInt(9, ap.getDoctorID());
		ps.setString(10, ap.getAddress());
		ps.setString(11, ap.getStatus());
		
		int i = ps.executeUpdate();
		if(i == 1) {
			System.out.println("added");
			check = true;
			return check;
		}
		return check;
		
	}
	public List<Appointment> getAppointmentLoginUser(int UserID) throws SQLException{
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		String sql = "select * from appointment where UserID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, UserID);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			ap = new Appointment();
			ap.setId(rs.getInt(1));
			ap.setFullname(rs.getString("FullName"));
			ap.setGender(rs.getString("Gender"));
			ap.setAge(rs.getInt("age"));
			ap.setAppointmentdate(rs.getString("Appointment_date"));
			ap.setEmail(rs.getString("email"));
			ap.setPhoneno(rs.getString("phone_number"));
			ap.setDisease(rs.getString("Disease"));
			ap.setUserID(rs.getInt("UserID"));
			ap.setDoctorID(rs.getInt("DoctorID"));
			ap.setAddress(rs.getString("Address"));
			ap.setStatus(rs.getString("Status"));
			list.add(ap);	
	}
		return list;
	}
	public List<Appointment> getAppointmentByDoctor(int DoctorID) throws SQLException{
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		String sql = "select * from appointment where DoctorID = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, DoctorID);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			ap = new Appointment();
			ap.setId(rs.getInt(1));
			ap.setFullname(rs.getString("FullName"));
			ap.setGender(rs.getString("Gender"));
			ap.setAge(rs.getInt("age"));
			ap.setAppointmentdate(rs.getString("Appointment_date"));
			ap.setEmail(rs.getString("email"));
			ap.setPhoneno(rs.getString("phone_number"));
			ap.setDisease(rs.getString("Disease"));
			ap.setUserID(rs.getInt("UserID"));
			ap.setDoctorID(rs.getInt("DoctorID"));
			ap.setAddress(rs.getString("Address"));
			ap.setStatus(rs.getString("Status"));
			list.add(ap);	
	}
		return list;
	}
	public Appointment getAppointmentByID(int ID) throws SQLException{
	
		Appointment ap = null;
		String sql = "select * from appointment where id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ID);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			ap = new Appointment();
			ap.setId(rs.getInt(1));
			ap.setFullname(rs.getString("FullName"));
			ap.setGender(rs.getString("Gender"));
			ap.setAge(rs.getInt("age"));
			ap.setAppointmentdate(rs.getString("Appointment_date"));
			ap.setEmail(rs.getString("email"));
			ap.setPhoneno(rs.getString("phone_number"));
			ap.setDisease(rs.getString("Disease"));
			ap.setUserID(rs.getInt("UserID"));
			ap.setDoctorID(rs.getInt("DoctorID"));
			ap.setAddress(rs.getString("Address"));
			ap.setStatus(rs.getString("Status"));
			
	}
		return ap;
	}
	public boolean updateStatus(int id , int doctid,String comment) throws SQLException {
		boolean check = false;
		String sql = "update appointment set status=? where id=? and DoctorID=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, comment);
		ps.setInt(2, id);
		ps.setInt(3, doctid);
		int i = ps.executeUpdate();
		if(i == 1) {
			check = true;
			return check;
		}
		return check;	
	}
	public List<Appointment> getAllAppointment() throws SQLException{
		List<Appointment> list = new ArrayList<Appointment>();
		Appointment ap = null;
		String sql = "select * from appointment order by FullName ASC";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			ap = new Appointment();
			ap.setId(rs.getInt(1));
			ap.setFullname(rs.getString("FullName"));
			ap.setGender(rs.getString("Gender"));
			ap.setAge(rs.getInt("age"));
			ap.setAppointmentdate(rs.getString("Appointment_date"));
			ap.setEmail(rs.getString("email"));
			ap.setPhoneno(rs.getString("phone_number"));
			ap.setDisease(rs.getString("Disease"));
			ap.setUserID(rs.getInt("UserID"));
			ap.setDoctorID(rs.getInt("DoctorID"));
			ap.setAddress(rs.getString("Address"));
			ap.setStatus(rs.getString("Status"));
			list.add(ap);	
	}
		return list;
	}
	public int countAppountment() throws SQLException {
		int appcount = 0;
		String sql = "SELECT COUNT(id) AS appcount FROM appointment";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet  rs = ps.executeQuery();
		while(rs.next()) {
			 appcount = rs.getInt("patientcount");
		}
		return appcount;	
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
