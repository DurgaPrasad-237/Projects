package com.ex.AdminServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ex.DB.DBConnection;
import com.ex.Dao.SpecialistDao;
@WebServlet("/addspec")
public class AddSpecialist extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String specialist_name = req.getParameter("specialist_name");
		HttpSession session = req.getSession();
		try {
			SpecialistDao spd = new SpecialistDao(DBConnection.getConnection());
			boolean check = spd.addSpecialist(specialist_name);
			if(check) {
				session.setAttribute("msg", "Specialist Added");
				res.sendRedirect("admin/adminhome.jsp");
			}
			else {
				session.setAttribute("msg", "something error try after some time");
				res.sendRedirect("admin/adminhome.jsp");
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
