package com.ex.User;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ex.DB.DBConnection;
import com.ex.Dao.AppointmentDao;
import com.ex.Dao.UserDao;
import com.ex.Entity.Appointment;
import com.ex.Entity.User;
@WebServlet("/AddAppointments")
public class AddAppointment extends HttpServlet {
	public void doPost(HttpServletRequest rq, HttpServletResponse rs) throws IOException {
		int userID = Integer.parseInt(rq.getParameter("userID"));
		String fullname = rq.getParameter("fullName");
		String gender = rq.getParameter("gender");
		int age = Integer.parseInt(rq.getParameter("age"));
		String appointmentDate = rq.getParameter("appointmentDate");
		String email = rq.getParameter("email");
		String phoneNumber = rq.getParameter("phoneNumber");
		String diseases = rq.getParameter("diseases");
		int doctorID = Integer.parseInt(rq.getParameter("doctor"));
		String Address = rq.getParameter("Address");
		HttpSession session = rq.getSession();
		Appointment ap = new Appointment(fullname,gender,age, appointmentDate,email,phoneNumber,
				diseases, userID, doctorID, Address,  "pending");
		try {
			
			AppointmentDao ud = new AppointmentDao(DBConnection.getConnection());
			boolean check = ud.addAppointment(ap);
		
		
			 if (check == true) {
				    session.setAttribute("result", "Appointment Successfully");
				 System.out.println("Result attribute set to 'AppointmentSuccessfully'");
				 rs.sendRedirect("User/Userpage.jsp");
			    } else {
			        session.setAttribute("result", "Something Wrong");
			        System.out.println("Failure: Setting result attribute to 'Something Wrong'");
			        rs.sendRedirect("User/Userpage.jsp");
			    }
			} catch (Exception e) {
			    e.printStackTrace();
			}
	}
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
