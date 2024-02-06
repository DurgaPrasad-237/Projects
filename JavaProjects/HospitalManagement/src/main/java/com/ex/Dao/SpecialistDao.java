package com.ex.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ex.Entity.Specialist;

public class SpecialistDao {
	
	private Connection con;

	public SpecialistDao(Connection con) {
		super();
		this.con = con;
	}
	public boolean addSpecialist(String spec) throws SQLException {
		boolean check = false;
		String sql = "insert into specialist(specialist_name) values (?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, spec);
		int i = ps.executeUpdate();
		if(i == 1) {
			check = true;
		}
		return check;
	}
	public List<Specialist> getAllSpecialist() throws SQLException{
		List<Specialist> list = new ArrayList<Specialist>();
		Specialist spec = null;
		String sql = "select * from specialist";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			spec = new Specialist();
			spec.setId(rs.getInt(1));
			spec.setSpecialistName(rs.getString("specialist_name"));
			list.add(spec);
		}
		return list;
	}
	public int countSpecialist() throws SQLException {
		int spccount = 0;
		String sql = "SELECT COUNT(id) AS spc FROM specialist";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet  rs = ps.executeQuery();
		while(rs.next()) {
			 spccount = rs.getInt("spc");
		}
		return spccount;	
	}
	

}
