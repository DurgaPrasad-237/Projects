package com.ex.AdminServlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ex.Entity.User;
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String email  = req.getParameter("Email_Address");
		String password = req.getParameter("Password");
		HttpSession session = req.getSession();
		
		if(email.equalsIgnoreCase("admin@gmail.com") && password.equalsIgnoreCase("admin")) {
			session.setAttribute("adobj", new User());
			res.sendRedirect("admin/adminhome.jsp");
		}
		else {
			session.setAttribute("error", "Password or UserName incorrect");
			res.sendRedirect("index.jsp");
		}
		
		
	}
}
