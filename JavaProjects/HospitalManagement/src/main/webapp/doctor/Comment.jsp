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
 

    form {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      max-width: 400px;
      margin: 100px auto;
    }

    label {
      display: block;
      margin-bottom: 8px;
    }

    input, textarea {
      width: 100%;
      padding: 8px;
      margin-bottom: 16px;
      box-sizing: border-box;
    }

    button {
      background-color: #4caf50;
      color: #fff;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }
 
 
 </style>
 
</head>
<body>
		
	<%int id = Integer.parseInt(request.getParameter("id")); 
	AppointmentDao dao = new AppointmentDao(DBConnection.getConnection());
	Appointment ap = dao.getAppointmentByID(id);
	
	%>	
	<%=id %>
	
	
		
	<form action="../update" method="post">
	    <label for="FullName">FullName</label>
	    <input type="text" id="FullName" name="FullName" value="<%=ap.getFullname()%>">
	
	    <label for="Age">Age</label>
	    <input type="text" id="Age" name="Age" value="<%=ap.getAge()%>">
	
	    <label for="Mobile no">Mobile no</label>
	    <input type="text" id="Mobile no" name="Mobile no" value="<%=ap.getPhoneno()%>">
	
	    <label for="Disease">Disease</label>
	    <input type="text" id="Disease" name="Disease" value="<%=ap.getDisease()%>">
	    
	    <input type="hidden" name="id" value="<%=ap.getId()%>">
	       <input type="hidden" name="did" value="<%=ap.getDoctorID()%>">
	
	    <label for="Comment">Comment</label>
   		 <textarea id="Comment" name="Comment" rows="4"></textarea>
	
	    <button type="submit">Submit</button>
  </form>
		
</body>
</html>