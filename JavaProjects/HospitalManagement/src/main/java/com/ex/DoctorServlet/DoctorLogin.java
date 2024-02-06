package com.ex.DoctorServlet;

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
@WebServlet("/loginDoctor")
public class DoctorLogin extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String email = req.getParameter("Email_Address");
		String password = req.getParameter("Password");
		

		HttpSession session = req.getSession();
		try {
			DoctorDao dao = new DoctorDao(DBConnection.getConnection());
			Doctor docs = dao.loginDoctor(email, password);
			if(docs != null) {
				System.out.println("login");
				session.setAttribute("docobj", docs);
				res.sendRedirect("doctor/Doctorhome.jsp");
			}
			else {    
			    session.setAttribute("error", "invalid email id or password");
			    res.sendRedirect("Doctor.jsp");
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
