<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.ex.Dao.*" %>
      <%@ page import="com.ex.Dao.*" %>
    <%@ page import="com.ex.DB.DBConnection" %>
      <%@ page import="com.ex.Entity.Specialist" %>
        <%@ page import="com.ex.Entity.Doctor" %>
        <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="../style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

</head>
<style>
.dp{
	position:absolute;
	top:5px;
	right:100px;
	height:30px;
}
.dashContainer {

    height: 510px;
    width: 80%;
    margin-left: auto;
    margin-right: auto;
     display: flex;
  flex-wrap: wrap;
 
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
.modal {
    display: none;
    position: absolute;
    top: 85%;
    left: 60%;
    transform: translate(-50%, -50%);
    background-color: #fefefe;
    padding: 20px;
    border: 1px solid #888;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.modal-content {
    text-align: center;
}

.close {
    color: #aaa;
    cursor: pointer;
}

.close:hover {
    color: orange;
}

</style>
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
	<a href="ViewDoctor.jsp">View Doctor</a>
	<a href="ViewPatient.jsp">Patient</a>
	<a href="../Adminlogout.jsp" class="logout">logout</a>
</nav>
<%
request.getSession(false); // Get the existing session
if(session != null && session.getAttribute("msg") != null) {
    out.println("<p style='color: Green;text-align:center'>" + session.getAttribute("msg") + "</p>");
    session.removeAttribute("msg");
}
%>

<h1 style="color:black;text-align:center">DASHBORD</h1>
<section class="dashContainer">

	<div class="cards">
		<div><i class="fa fa-user-md" aria-hidden="true"></i></div>
		<h4>Doctor</h4>
		<% DoctorDao dao = new DoctorDao(DBConnection.getConnection());
			int count = dao.countDoctor();
		%>
		<p><%=count %></p>
	</div>
	
	
	
	<div class="cards">
		<div><i class="fa fa-user" aria-hidden="true"></i></div>
		<h4>User</h4>
		<% UserDao us = new UserDao(DBConnection.getConnection());
			int patcount = us.countPatient();
		%>
		<p><%=patcount %></p>
	</div>
	
	<div class="cards">
		<div><img src="medical.png" width=50px></i></div>
		<h4>Total Appointments</h4>
	<% AppointmentDao aptd = new AppointmentDao(DBConnection.getConnection());
			int aptcount = us.countPatient();
		%>
		<p><%=aptcount %></p>
	</div>
	
	<div class="cards" id="specialistCard">
		<div><img src="medical-care.png" width=60px></i></div>
		<h4>Specialist</h4>
	<% SpecialistDao spd = new SpecialistDao(DBConnection.getConnection());
			int spcount = spd.countSpecialist();
		%>
		<p><%=spcount %></p>
	</div>
	
	 <div id="specialistModal" class="modal">
	    <div class="modal-content">
	        <h2 style="color:black">Specialist Details</h2>
	   
	        <form action="../addspec" method="post">
	          	<label for="specialist_name">Enter Specialist Name</label>
	            <input type="text" autofocus name="specialist_name" required>
	            <input type="submit" value="Submit">
	        </form>
	        <span class="close" onclick="closeSpecialistModal()">Close</span>
	    </div>
	</div>
	
	
	
	
	
</section>



<script>
   
    document.getElementById('specialistCard').addEventListener('click', function() {
        var modal = document.getElementById('specialistModal');
        modal.style.display = 'block';
    });


    function closeSpecialistModal() {
        var modal = document.getElementById('specialistModal');
        modal.style.display = 'none';
    }
</script>

</body>
</html>