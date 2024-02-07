package com.ex.AdminServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ex.DB.DBConnection;
import com.ex.Dao.DoctorDao;
import com.ex.Entity.Doctor;
@WebServlet("/upddoc")
public class UpdateDoctor extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String FullName = req.getParameter("FullName");
		String DOB = req.getParameter("DOB");
		String Qualification = req.getParameter("Qualification");
		String Specialist = req.getParameter("Specialist");
		String Email = req.getParameter("Email");
		String Mob_no = req.getParameter("Mob_no");
		String Password = req.getParameter("Password");
		int id = Integer.parseInt(req.getParameter("id"));
		
		Doctor d = new Doctor(id,FullName,DOB,Qualification,Specialist,Email,Mob_no,Password);
		HttpSession session = req.getSession();
		try {
			DoctorDao dao = new DoctorDao(DBConnection.getConnection());
			boolean check = dao.updateDoctor(d);
			if(check) {
				session.setAttribute("result", "Update Successfully");
				res.sendRedirect("admin/ViewDoctor.jsp");	
			}
			else {
				session.setAttribute("result", "SomeThingError");
				res.sendRedirect("admin/ViewDoctor.jsp");	
			}
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}
}
