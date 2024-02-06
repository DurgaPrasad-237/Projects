<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.connec.DBConnection" %>
<%@ page import="com.ex.dao.DaoClass" %>
<%@ page import="com.entity.Salesman" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<style>
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<body>



<h3>EDIT DETAILS</h3>


<%
int id = Integer.parseInt(request.getParameter("id"));
DaoClass obj = new DaoClass(DBConnection.getConnection());
Salesman s = obj.getSalesmanId(id);
%>

<div>
  <form action="update" method="post">
    <label for="Id">Enter ID</label>
    <input type="text" value=<%= s.getId() %> id="Id" name="Id" placeholder="Your ID" readonly>

    <label for="name">Name</label>
    <input type="text" value=<%= s.getName() %> id="name" name="name" placeholder="Your Name">

  <label for="capital">Capital</label>
<select id="capital" name="capital">
 <option ><%=s.getCapital() %></option>
  <option value="agartala">Agartala (Tripura)</option>
  <option value="ahmedabad">Ahmedabad (Gujarat)</option>
  <option value="aizawl">Aizawl (Mizoram)</option>
  <option value="amaravati">Amaravati (Andhra Pradesh)</option>
  <option value="bangalore">Bengaluru (Karnataka)</option>
  <option value="bhopal">Bhopal (Madhya Pradesh)</option>
  <option value="bhubaneswar">Bhubaneswar (Odisha)</option>
  <option value="chandigarh">Chandigarh (Punjab & Haryana)</option>
  <option value="chennai">Chennai (Tamil Nadu)</option>
  <option value="dehradun">Dehradun (Uttarakhand)</option>
  <option value="dispur">Dispur (Assam)</option>
  <option value="gandhinagar">Gandhinagar (Gujarat)</option>
  <option value="gangtok">Gangtok (Sikkim)</option>
  <option value="hyderabad">Hyderabad (Telangana)</option>
  <option value="imphal">Imphal (Manipur)</option>
  <option value="itanagar">Itanagar (Arunachal Pradesh)</option>
  <option value="jaipur">Jaipur (Rajasthan)</option>
  <option value="kavaratti">Kavaratti (Lakshadweep)</option>
  <option value="kohima">Kohima (Nagaland)</option>
  <option value="kolkata">Kolkata (West Bengal)</option>
  <option value="lucknow">Lucknow (Uttar Pradesh)</option>
  <option value="mumbai">Mumbai (Maharashtra)</option>
  <option value="new_delhi">New Delhi (Delhi)</option>
  <option value="panaji">Panaji (Goa)</option>
  <option value="patna">Patna (Bihar)</option>
  <option value="port_blair">Port Blair (Andaman and Nicobar Islands)</option>
  <option value="puducherry">Puducherry (Puducherry)</option>
  <option value="raipur">Raipur (Chhattisgarh)</option>
  <option value="ranchi">Ranchi (Jharkhand)</option>
  <option value="shillong">Shillong (Meghalaya)</option>
  <option value="shimla">Shimla (Himachal Pradesh)</option>
  <option value="srinagar">Srinagar (Jammu and Kashmir)</option>
  <option value="thiruvananthapuram">Thiruvananthapuram (Kerala)</option>
</select>

	<label for="commission">Commission</label>
    <input type="text" value=<%= s.getCommission() %> id="commission" name="commission" placeholder="Commission">
  
    <input type="submit" value="Update">
  </form>
</div>

</body>
</html>