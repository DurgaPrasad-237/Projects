<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="style.css">
    <title>Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<style>
a:hover{
color:orange;
}
</style>
<body>

<% Object obj = session.getAttribute("result");
%>
<nav>
	<a href="index.jsp">Admin</a>
	<a href="Doctor.jsp">Doctor</a>
	<a href="#">Appointment</a>
	<a href="User.jsp">User</a>
</nav>

<section class="container">
<% 
    request.getSession(false); // Get the existing session
    if(session != null && session.getAttribute("result") != null) {
        out.println("<p style='color: green;'>" + session.getAttribute("result") + "</p>");
        session.removeAttribute("result");
    }
%>

 <p style="text-align:center;color:green"></p>
 <div class="form" id="login">
    <h1 class="form__title">User Signup</h1>
      <form action="ur" method="post">
      
     <label for="Email_Address">Email_Address</label>
    <input class="form__input" type="email" id="Email_Address" autofocus name="Email_Address" placeholder="Your Email" required> 
      
    <label for="User_Name">User_Name"</label>
    <input class="form__input" type="text" id="User_Name" autofocus name="User_Name"" placeholder="User Name" required>

    <label for="Password">Password</label>
    <input class="form__input" type="password" id="Password" autofocus name="Password" placeholder="Your Password" required>
	<div class="padding"></div>
	 <input class="form__button" type="submit" value="Submit">
  	</form>
    
  </div>

	
	 


</section>

</body>
</html>