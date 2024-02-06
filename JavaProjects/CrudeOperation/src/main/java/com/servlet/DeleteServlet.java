package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connec.DBConnection;
import com.entity.Salesman;
import com.ex.dao.DaoClass;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	public void doGet(HttpServletRequest rq, HttpServletResponse rs) throws IOException {
		int id = Integer.parseInt(rq.getParameter("id"));
		DaoClass da;
		HttpSession obj = rq.getSession();
		try {
			da = new DaoClass(DBConnection.getConnection());
			boolean f = da.deleteSalesman(id);
			if(f) {
                obj.setAttribute("k", "successfully deleted");
                rs.sendRedirect("view.jsp");
			}
			else {
				 obj.setAttribute("k", "not deleted");
                rs.sendRedirect("view.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
	
		

	}
	

}
