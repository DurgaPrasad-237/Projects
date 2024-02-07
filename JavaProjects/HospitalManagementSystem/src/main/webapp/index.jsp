<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
<style>

a:hover{
color:orange;
}
</style>
</head>
<body>

<nav>
	<a href="index.jsp">Admin</a>
	<a href="Doctor.jsp">Doctor</a>
	<a href="#">Appointment</a>
	<a href="User.jsp">User</a>
</nav>


<section class="container">
<% 
    request.getSession(false); // Get the existing session
    if(session != null && session.getAttribute("error") != null) {
        out.println("<p style='color: green;'>" + session.getAttribute("error") + "</p>");
        session.removeAttribute("error");
    }
%>

 <p style="text-align:center;color:green"></p>
 <div class="form" id="login">
    <h1 class="form__title">Admin Login</h1>
      <form action="adminLogin" method="post">
      
     <label for="Email_Address">Email_Address</label>
    <input class="form__input" type="email" id="Email_Address" autofocus name="Email_Address" placeholder="Your Email" required> 
      
   <div class="padding"></div>

    <label for="Password">Password</label>
    <input class="form__input" type="password" id="Password" autofocus name="Password" placeholder="Your Password" required>
	<div class="padding"></div>
	 <input class="form__button" type="submit" value="Submit">
	 
  	</form>
    
  </div>

	
	 


</section>



</body>
</html>