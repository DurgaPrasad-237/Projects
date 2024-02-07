package com.ex.DoctorServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ex.DB.DBConnection;
import com.ex.Dao.AppointmentDao;
@WebServlet("/update")
public class UpdateStatus extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		int did = Integer.parseInt(req.getParameter("did"));
		String cmt = req.getParameter("Comment");
		AppointmentDao ap;
		try {
			ap = new AppointmentDao(DBConnection.getConnection());
			HttpSession session = req.getSession();
			if(ap.updateStatus(id, did, cmt)) {
					session.setAttribute("cmt", "comment updated");
					res.sendRedirect("doctor/Patient.jsp");
			}
			else {
				session.setAttribute("cmt", "something wrong");
				res.sendRedirect("doctor/Patient.jsp");

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
