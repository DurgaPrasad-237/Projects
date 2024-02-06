<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %>
<%@ page import="com.connec.DBConnection" %>
<%@ page import="com.ex.dao.DaoClass" %>
<%@ page import="com.entity.Salesman" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid black;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
.edit{
	color:blue;
	width:100px;
	border-radius:10px;
	font-size:20px;
	margin-left:10px;
	border:2px solid blue;
}
.delete{
	color:red;
	width:100px;
	border-radius:10px;
	font-size:20px;
	margin-left:65px;
	border:2px solid red;
}
.edit:hover{
background-color:blue;
color:white;
}
.delete:hover{
background-color:red;
color:white;
}
.action{
width:300px;
}
.add{
width:200px;
height:50px;
border-radius:10px;
font-size:15px;

}




</style>

</head>
<body>
<h1><Center>ALL DETAILS</Center></h1>

<% 
    request.getSession(false); 
    if(session != null && session.getAttribute("k") != null) {
        out.println("<p style='color: green;'>" + session.getAttribute("k") + "</p>");
        session.removeAttribute("k"); 
    }
%>
	<table>
		  <tr>
		    <th>id</th>
		    <th>name</th>
		    <th>city</th>
		    <th>commission</th>
		     <th class="action">Action</th>
		  </tr>
		  
		  <%
		 
		 	DaoClass da = new DaoClass(DBConnection.getConnection());
		  	List<Salesman> sa = da.getAllDetails();
		  	for(Salesman s: sa){
		  		
		  %>
		   <tr>
		    <td><%=s.getId()%></td>
		    <td><%=s.getName() %></td>
		    <td><%=s.getCapital() %></td>
		    <td><%=s.getCommission()%></td>
		    <td>
		   
		    <a href="edit.jsp?id=<%=s.getId()%>"><button class="edit">edit</button></a>
		    
		    <a href="delete?id=<%=s.getId()%>"><button class="delete">delete</button></a>
		    </td>
		  </tr>
  
		  		
		  <%}%>
	  
  </table>
    <h4>Add NEW DETAILS</h4>
    <a href="index.jsp"><button class="add">Click here</button></a>
</body>
</html>