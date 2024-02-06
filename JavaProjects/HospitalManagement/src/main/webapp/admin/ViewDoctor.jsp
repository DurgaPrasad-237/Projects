<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ex.Dao.SpecialistDao" %>
      <%@ page import="com.ex.Dao.DoctorDao" %>
    <%@ page import="com.ex.DB.DBConnection" %>
      <%@ page import="com.ex.Entity.Specialist" %>
        <%@ page import="com.ex.Entity.Doctor" %>
        <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" type="text/css" href="../style.css">
<title>Doctor</title>
<style>
.logout{
position:relative;
left:500px;
border:2px solid black;
padding:5px;
border-radius:10px;
}
.logout:hover{
color:white;
background-color:orange;
cursor:pointer;
transition:1s;
transition-delay:.4s;
}
a:hover{
color:orange;
}
.wholeContainer{
width:100%;
height:100vh;
display:flex;
flex-wrap:wrap;
}
.seconddiv{

width:99%;
margin-top:20px; 
margin-left:5px ;
}
.ad{
color:black;
font-size:20px;
text-align:center;
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
.edit{
border:2px solid #3cb043;
padding:5px;
color:#3cb043;


}
.edit:hover{
background-color:#3cb043;
color:white;

}

.delete{
border:2px solid #d0312d;
padding:5px;
color:#d0312d;

}
.delete:hover{
background-color:#d0312d;
color:white;
}
a{
text-decoration:none	
}


</style>


</head>
<body>

<%
   
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

  
%>

<%
request.getSession(false);
if(session == null || session.getAttribute("adobj") == null){
	response.sendRedirect("../index.jsp");
	return;
}
%>


<nav>
	<a href="adminhome.jsp">Home</a>
	<a href="Doctor.jsp">Doctor</a>
	<a href="ViewPatient.jsp">Patient</a>
	<a href="../Adminlogout.jsp" class="logout">logout</a>
</nav>

<section class="wholeContainer">

<div class="seconddiv">
<table>
<% 
    request.getSession(false); // Get the existing session
    if(session != null && session.getAttribute("result") != null) {
        out.println("<p style='color: green;'>" + session.getAttribute("result") + "</p>");
        session.removeAttribute("result");
    }
%>
  <tr>
    <th>Full Name</th>
    <th>DOB</th>
    <th>Qualification</th>
    <th>Specialist</th>
    <th>Email</th>
    <th>Mobile</th>
    <th>Action</th>
  </tr>
  <%DoctorDao dao = new DoctorDao(DBConnection.getConnection()); 
  	List<Doctor> doc = dao.getDoctors();
  	for(Doctor d: doc){%>
  		
  		<tr>
		   <td><%=d.getFullName()%></td>
		   <td><%=d.getDob() %></td>
		   <td><%=d.getQualification()%></td>
		   <td><%=d.getSpecialist()%></td>
		   <td><%=d.getEmail()%></td>
		   <td><%=d.getMobno()%></td>
		   <td colspan="2"> <!-- Use colspan to span two columns -->
	        <a class="edit" href="EditDoc.jsp?id=<%=d.getId()%>">Edit</a>
	        <a class="delete" href="../deletedoc?id=<%=d.getId()%>">delete</a>
    		</td>
		</tr>
		
	<%} %>
  		
  	
  
 
  
  
  
  

 
</table>



</div>


</section>



</body>
</html>