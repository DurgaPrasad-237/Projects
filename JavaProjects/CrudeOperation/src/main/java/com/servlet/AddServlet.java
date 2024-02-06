package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connec.DBConnection;
import com.entity.Salesman;
import com.ex.dao.DaoClass;
@WebServlet("/addinfo")
public class AddServlet extends HttpServlet {
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws IOException {
		String id = rq.getParameter("Id");
		int idid = Integer.parseInt(id);
		String name = rq.getParameter("name");
		String capital = rq.getParameter("capital");
		String commission = rq.getParameter("commission");
		int com = Integer.parseInt(commission);
		
		Salesman s = new Salesman(idid,name,capital,com);
		try {
			DaoClass d = new DaoClass(DBConnection.getConnection());
			boolean f = d.addSaleman(s);
			if(f) {
				 HttpSession obj = rq.getSession();
                 obj.setAttribute("k", "successfully submited");
                 rs.sendRedirect("index.jsp");
			}
			else {
				System.out.println("not submited");
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
