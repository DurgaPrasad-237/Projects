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
@WebServlet("/deletedoc")
public class DeleteDoc extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		HttpSession session = req.getSession();
		try {
			DoctorDao doc = new DoctorDao(DBConnection.getConnection());
			boolean check = doc.deleteDoctor(id);
			if(check) {
				
				session.setAttribute("result", "deleted sucessfully");
				res.sendRedirect("admin/ViewDoctor.jsp");
			}
			else {
				session.setAttribute("result", "Something is wrong");
				res.sendRedirect("admin/ViewDoctor.jsp");
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
