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
.firstdiv{
padding:20px;
height:95vh;
width:30%;
margin-top:10px;
margin-right:auto ;
margin-left:auto ;
box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
}
.ad{
color:black;
text-align:center;
font-size:20px;
}

</style>


</head>
<body>


<nav>
	<a href="adminhome.jsp">Home</a>
	<a href="Doctor.jsp">Doctor</a>
	<a href="">Patient</a>
	<a href="../Adminlogout.jsp" class="logout">logout</a>
</nav>

<%
int id = Integer.parseInt(request.getParameter("id"));
DoctorDao obj = new DoctorDao(DBConnection.getConnection());
Doctor doc = obj.getDoctorById(id);
%>





<section class="wholeContainer">
<div class="firstdiv">
<% 
    request.getSession(false); // Get the existing session
    if(session != null && session.getAttribute("result") != null) {
        out.println("<p style='color: green;'>" + session.getAttribute("result") + "</p>");
        session.removeAttribute("result");
    }
%>
<h4 class="ad">Update Doctor Details</h4>
<form action="../upddoc" method="post">
  
     <label for="FullName">FullName</label>
    <input value="<%=doc.getFullName().toUpperCase() %>" class="form__input" type="text" id="FullName" autofocus name="FullName" placeholder="FullName" required> 
      
    <label for="DOB">DOB"</label>
    <input value="<%=doc.getDob().toUpperCase() %>" class="form__input" type="date" id="DOB" autofocus name="DOB" required>

    <label for="Qualification">Qualification</label>
    <input value="<%=doc.getQualification().toUpperCase() %>" class="form__input" type="text" id="Qualification" autofocus name="Qualification" placeholder="Qualification" required>
       
    <label for="Specialist">Specialist</label>
	<select class="form__input" name="Specialist" required>
	<option>--select--</option>
	
	<%SpecialistDao sdo = new SpecialistDao(DBConnection.getConnection());
    		List<Specialist> list = sdo.getAllSpecialist();
    		for(Specialist spec: list){%>
    		<option value="<%=spec.getSpecialistName()%>"><%= spec.getSpecialistName() %></option>
    			
    	<% } %>
    	
	
	
	<option>Demo</option>
	</select>
     
    <label for="Email">Email</label>
    <input value="<%=doc.getEmail() %>" class="form__input" type="email" id="Email" autofocus name="Email" placeholder="Email" required>
     
     <label for="Mob_no">Mob_no</label>
    <input value="<%=doc.getMobno() %>" class="form__input" type="text" id="Mob_no" autofocus name="Mob_no" placeholder="Mob_no" required>
     
    
      
     
     <label for="Password">Password</label>
    <input value="<%=doc.getPassword()%>" class="form__input" type="password" id="Password" autofocus name="Password" placeholder="Password" required>
     <div class="padding"></div>
     <input type="hidden" name="id" value="<%=doc.getId()%>">
	 <input class="form__button" type="submit" value="Update">
</form>

</div>

</table>



</div>


</section>



</body>
</html>