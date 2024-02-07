<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ex.Entity.Doctor" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>DoctorHome</title>
  <link rel="stylesheet" type="text/css" href="../style.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

h4{
color:black;
postion:absolute;
top:0;
text-align:center;
}
.dashContainer {

    height: 510px;
    width: 80%;
    margin-left: auto;
    margin-right: auto;
     display: flex;
  flex-wrap: wrap;


  justify-content:center;
 
}
a:hover{
color:orange;
}
.cards {
 box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
  width: 300px;
  margin: 30px;
  text-align: center;
  line-height: 75px;
  font-size: 30px;
  height:200px;
  flex-direction:column;
}
.cards div{
margin-top:20px;
}
.cards h4{
margin-top:-30px;
color:#F7AC84;
font-size:20px;
}
.cards p{
margin-top:-60px;
color:black;
font-weight:bold;
}
.cards:hover{
box-shadow: rgba(0, 0, 0, 0.24) 1px 13px 8px;
}

i{
color:black;
font-size:50px;
}
.logout{
position:relative;
left:500px;
border:2px solid black;
padding:5px;
border-radius:10px;
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
if(session == null || session.getAttribute("docobj") == null){
	response.sendRedirect("../Doctor.jsp");
	return;
}
%>


<%
Doctor obj =(Doctor) session.getAttribute("docobj");
String s = obj.getFullName();
%>

<nav>
	
	<a href="Doctorhome.jsp">Home</a>
	<a href="Patient.jsp">Patient</a>
	<a href="../Doctorlogout.jsp" class="logout">logout</a>
	
</nav>
<h4><%=s%></h4>

<section class="dashContainer">

	<div class="cards">
		<div><i class="fa fa-user-md" aria-hidden="true"></i></div>
		<h4>Doctor</h4>
		<p>10</p>
	</div>
	
	
	
	<div class="cards">
		<div><img src="medical.png" width=50px></i></div>
		<h4>Total Appointments</h4>
		<p>43</p>
	</div>

	
</section>





</body>
</html>