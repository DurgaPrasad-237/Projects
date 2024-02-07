package com.ex.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ex.DB.DBConnection;
import com.ex.Dao.UserDao;
import com.ex.Entity.User;
import com.mysql.cj.xdevapi.Statement;

@WebServlet("/ur")
public class UserRegister extends HttpServlet {
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws IOException {
		String name = rq.getParameter("User_Name");
		String email = rq.getParameter("Email_Address");
		String password = rq.getParameter("Password");
		
		User obj = new User(name,email,password);
		
		try {
			UserDao ud = new UserDao(DBConnection.getConnection());
			boolean b = ud.userRegister(obj);
			HttpSession session = rq.getSession();
			
			
			if(b) {
				session.setAttribute("result", "Sucessfully Registred");
				rs.sendRedirect("Signup.jsp");
				System.out.println("registred");
			}
			else {
				session.setAttribute("result", "Already Registred");
				rs.sendRedirect("Signup.jsp");
				System.out.println("registred");
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
