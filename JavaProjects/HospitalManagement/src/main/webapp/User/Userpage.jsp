<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.ex.Entity.*" %>
<%@ page import="com.ex.Dao.*" %>
<%@ page import="com.ex.DB.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="../style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>User</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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

        .form-container {
            background-color: rgba(255, 255, 255, 0.5);
            ;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            border-radius: 8px;
            width: 600px;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px; /* Adjust the margin based on your design preference */
            margin-right: auto;
            margin-left: auto;
            backdrop-filter: blur(10px);
        }

        .form-group {
            width: 100%;
            margin-bottom: 20px;
        }

        .form-group-half {
            width: calc(50% - 10px);
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input,
        textarea,
        select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            margin-bottom: 10px; /* Add some spacing between input fields */
        }

        button {
            background-color: #4caf50;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px; /* Add some spacing between the form and the button */
        }

        a:hover {
            color: orange;
        }

    </style>

</head>
<body>



<nav>
    <a href="Userpage.jsp">Appointment</a>
    <a href="ViewAppointment.jsp">View Appointment</a>
    <a href="../Userlogout.jsp" class="logout">logout</a>
</nav>

<%
    // Set cache control headers to prevent caching
    response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    User obj = (User) session.getAttribute("userobj");
    if (obj == null) {
        response.sendRedirect("../User.jsp");
        return;
    }
    String s = obj.getName();
    String id = Integer.toString(obj.getId());
%>



<p style="color:black;text-align:center">Welcome <%=s %></p>
<% 
    request.getSession(false); // Get the existing session
    if(session != null && session.getAttribute("result") != null) {
        out.println("<p style='color: green;text-align:center'>" + session.getAttribute("result") + "</p>");
        session.removeAttribute("result");
    }
%>

<form method="post" action="../AddAppointments">

	<input type="hidden" name="userID" value="<%=id%>">
    <div class="form-container">
        <div class="form-group form-group-half">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
        </div>

        <div class="form-group form-group-half">
            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
        </div>

        <div class="form-group form-group-half">
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required>
        </div>

        <div class="form-group form-group-half">
            <label for="appointmentDate">Appointment Date:</label>
            <input type="date" id="appointmentDate" name="appointmentDate" required>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>

        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="tel" id="phoneNumber" name="phoneNumber" required>
        </div>

        <div class="form-group">
            <label for="diseases">Diseases:</label>
            <input type="text" id="diseases" name="diseases" required>
        </div>

        <div class="form-group form-group-half">
            <label for="Doctor">Doctor</label>
            <select id="doctor" name="doctor" required>
                <option value="">--select--</option>
                <% DoctorDao dao = new DoctorDao(DBConnection.getConnection()); 
                   List<Doctor> list = dao.getDoctors();
                   for(Doctor d : list) { %>	
                       <option value="<%=d.getId() %>"><%=d.getFullName()%> - <%=d.getSpecialist()%></option>
                <% } %>
            </select>
        </div>

        <div class="form-group">
            <label for="Address"> Address:</label>
            <textarea id="Address" name="Address" rows="6" required></textarea>
        </div>

        <input class="form__button" type="submit" value="Submit">
    </div>
</form>

</body>
</html>
