package com.ex.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ex.DB.DBConnection;
import com.ex.Dao.UserDao;
import com.ex.Entity.User;
@WebServlet("/userlogin")
public class UserLogin extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String email = req.getParameter("Email_Address");
		String password = req.getParameter("Password");
		HttpSession session = req.getSession();
		try {
			
			UserDao ud = new UserDao(DBConnection.getConnection());
			User u = ud.userLogin(email,password);
		
			if(u != null) {
				session.setAttribute("userobj", u);
				res.sendRedirect("User/Userpage.jsp");
				
			}
			else {
				session.setAttribute("result", "Check email and password once");
				res.sendRedirect("User.jsp");
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
