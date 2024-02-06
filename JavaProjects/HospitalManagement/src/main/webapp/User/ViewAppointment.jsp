<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ex.DB.*" %>
    <%@ page import="com.ex.Dao.*" %>
    <%@ page import="com.ex.Entity.*" %>
      <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../style.css">
  
  
  <style>
   .logout {
            position: relative;
            left: 500px;
            border: 2px solid black;
            padding: 5px;
            border-radius: 10px;
        }

        .logout:hover {
            color: white;
            background-color: orange;
            cursor: pointer;
            transition: 1s;
            transition-delay: .4s;
        }

        a:hover {
            color: none;
        }	
        table {

  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
  box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
  width:10%;
	 word-break: break-all;
}
th{
font-weight:bold;
color:white;
background-color:#F7AC84;
color:white;
}
td{
color:black;
}
tr:nth-child(even) {
  background-color: #dddddd;
}
a{
text-decoration:none	
}
.pending{
border:2px solid orange;
width:60px;
padding:5px;
color:white;
background-color:orange
}
  
  </style>
</head>
<body>

<nav>
    <a href="UserPage.jsp">Appointment</a>
    <a href="ViewAoppoitment.jsp">View Appointment</a>
    <a href="../Userlogout.jsp" class="logout">logout</a>
</nav>

<h3 style="text-align:center;color:black">AppointmentList</h3>
<table>
	<tr>
		<th>Full Name</th>
		<th>Gender</th>
		<th>Age</th>
		<th>Appointment Data</th>
		<th>Disease</th>
		<th>DoctorName</th>
		<th>Status</th>
	</tr>
	<%User user =(User) session.getAttribute("userobj");
		AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());
		DoctorDao d = new DoctorDao(DBConnection.getConnection());
		
		List<Appointment> list = dao.getAppointmentLoginUser(user.getId());
		for(Appointment ap: list){
		Doctor doc = d.getDoctorById(ap.getDoctorID());
		
		%>
		
		<tr>
			<td><%=ap.getFullname()%></td>
			<td><%=ap.getGender()%></td>
			<td><%=ap.getAge()%></td>
			<td><%=ap.getAppointmentdate()%></td>
			<td><%=ap.getDisease()%></td>
			<td><%=doc.getFullName()%></td>
			<td>
			<%if(ap.getStatus().equals("pending")){%>
				<a href="#" class="pending">Pending</a>
			<%}else{ %> 
				<%=ap.getStatus() %>
			<%}%>
			</td>

		</tr>
			
		<%}%>
	
	




</table>


</body>
</html>