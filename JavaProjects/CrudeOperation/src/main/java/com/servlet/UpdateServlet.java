package com.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connec.DBConnection;
import com.entity.Salesman;
import com.ex.dao.DaoClass;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet{
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws IOException {
		String id = rq.getParameter("Id");
		int idid = Integer.parseInt(id);
		String name = rq.getParameter("name");
		String capital = rq.getParameter("capital");
		String commission = rq.getParameter("commission");
		int com = Integer.parseInt(commission);
		Salesman sal = new Salesman(idid,name,capital,com);
		 HttpSession obj = rq.getSession();
		try {
			DaoClass d = new DaoClass(DBConnection.getConnection());
			boolean f = d.updateSalesman(sal);
			if(f) {
                 obj.setAttribute("k", "successfully updated");
                 rs.sendRedirect("view.jsp");
			}
			else {
				 obj.setAttribute("k", "not updated");
                 rs.sendRedirect("view.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	
		}	
	}

	

