<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ page import="com.ex.Dao.*" %>
    <%@ page import="com.ex.DB.DBConnection" %>
      <%@ page import="com.ex.Entity.*" %>
      
        <%@ page import="java.util.*" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../style.css">
<style>
table {

  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
	padding:10px;
  width:10%;

}
th{
font-weight:bold;
color:white;
background-color:#F7AC84;
color:white;
font-size:14px;
}
td{
color:black;
}
tr:nth-child(even) {
  background-color: #dddddd;
}

</style>
</head>
<body>

<nav>
	<a href="adminhome.jsp">Home</a>
	<a href="Doctor.jsp">Doctor</a>
	<a href="ViewPatient.jsp">Patient</a>
	<a href="../Adminlogout.jsp" class="logout">logout</a>
</nav>

<h3 style="text-align:center;color:black">All AppointmentList</h3>

<table>
	<tr>
	<th>FullName</th>
	<th>Gender</th>
	<th>age</th>
	<th>Appointment_date</th>
	<th>email</th>
	<th>phone_number</th>
	<th>Disease</th>
	<th>DoctorName</th>
	<th>Address</th>
	<th>Status</th>
	</tr>
	
	<%AppointmentDao ap = new AppointmentDao(DBConnection.getConnection());
		List<Appointment> list = ap.getAllAppointment();
		DoctorDao d = new DoctorDao(DBConnection.getConnection());
		for(Appointment apt: list){
			Doctor doc = d.getDoctorById(apt.getDoctorID());
					%>
			<tr>
			<td><%=apt.getFullname()%></td>
		   	<td><%=apt.getGender() %></td>
		  	<td><%=apt.getAge()%></td>
		   	<td><%=apt.getAppointmentdate()%></td>
		   	<td><%=apt.getEmail()%></td>
		   	<td><%=apt.getPhoneno()%></td>
		   	<td><%=apt.getDisease()%></td>
		   	<td><%=doc.getFullName() %></td>
		   	<td><%=apt.getAddress()%></td>
		   
		   	<td><%=apt.getStatus()%></td>

			</tr>
			
			
		<% }%>
	
	
	
	







</table>
</body>
</html>