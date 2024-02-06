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
@WebServlet("/adddoc")
public class AddDoctor extends HttpServlet{
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String FullName = req.getParameter("FullName");
		String DOB = req.getParameter("DOB");
		String Qualification = req.getParameter("Qualification");
		String Specialist = req.getParameter("Specialist");
		String Email = req.getParameter("Email");
		String Mob_no = req.getParameter("Mob_no");
		String Password = req.getParameter("Password");
		
		Doctor doc = new Doctor(FullName,DOB,Qualification,Specialist,Email,Mob_no,Password);
		HttpSession session = req.getSession();
		try {
			DoctorDao ddao = new DoctorDao(DBConnection.getConnection());
			boolean check = ddao.registerDoctor(doc);
			if(check) {
				session.setAttribute("result", "Successfully Added");
				res.sendRedirect("admin/Doctor.jsp");
			}
			else {
				session.setAttribute("result", "Something Error try again");
				res.sendRedirect("admin/Doctor.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		
	}
	

}
