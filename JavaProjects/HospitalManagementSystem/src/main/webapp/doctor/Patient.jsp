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
            color: orange;
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
.cmt{
border:2px solid orange;
padding:10px;
color:orange;
}
.cmt:hover{
border:2px solid orange;
color:white;
background-color:orange;
}
.cmtd{
 pointer-events: none;
        color: gray; /* or any other color to indicate it's disabled */
        text-decoration: none; /
}
</style>
</head>
<body>
<nav>
	
	<a href="Doctorhome.jsp">Home</a>
	<a href="Patient.jsp">Patient</a>
	<a href="../Doctorlogout.jsp" class="logout">logout</a>
	
</nav>



	<% 
    request.getSession(false); // Get the existing session
    if(session != null && session.getAttribute("cmt") != null) {
        out.println("<p style='color: red;'>" + session.getAttribute("cmt") + "</p>");
        session.removeAttribute("cmt");
    }
%>

<h3 style="text-align:center;color:black">PatientDetails</h3>
<table>
	<tr>
		<th>Full Name</th>
		<th>Gender</th>
		<th>Age</th>
		<th>Appointment Data</th>
		<th>Email</th>
		<th>Mobile no</th>
		<th>Disease</th>
		<th>Staus</th>
		<th>Action</th>
	</tr>
	<%
	Doctor doc =(Doctor) session.getAttribute("docobj");
	AppointmentDao ap = new AppointmentDao(DBConnection.getConnection());
	List<Appointment> apt = ap.getAppointmentByDoctor(doc.getId());
	for(Appointment appoint: apt){%>

	<tr>
			<td><%=appoint.getFullname() %></td>
			<td><%=appoint.getGender() %></td>
			<td><%=appoint.getAge() %></td>
			<td><%=appoint.getAppointmentdate() %></td>
			<td><%=appoint.getEmail() %></td>
			<td><%=appoint.getPhoneno() %></td>
			<td><%=appoint.getDisease() %></td>
			<td><%=appoint.getStatus() %></td>
			<td>
			<%if(appoint.getStatus().equalsIgnoreCase("pending")){%>
				<a class="cmt" href="Comment.jsp?id=<%=appoint.getId()%>">comment</a>
			<%} else{%>
				<a class="cmtd" href="#" >comment </a>
				<%}%>
			
			
			</td>
		

		</tr>
		
	<%}%>
	
		
			
	
	
	




</table>


</body>
</html>