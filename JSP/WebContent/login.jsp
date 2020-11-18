<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
	String idadmin = request.getParameter("idadmin");
	String password = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "Sean990507");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(
			"select * from db1.admin where idadmin='" + idadmin + "' and password='" + password + "'");
	try {
		rs.next();
		if (rs.getString("password").equals(password) && rs.getString("idadmin").equals(idadmin)) {
			response.sendRedirect("student.jsp");
		} else {
			out.println("Invalid username or password!");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
</head>
<body>
	<h1>Student Info</h1>
	<p>Please enter your ID and password<p>
	<form method = "post">
		<label for="id">AdminID:</label> <br>
		<input type = "text" id = "id" name = "id"><br>
		
		<label for="password">Password:</label><br>
		<input type="text" id="password" name="password"> <br> <br>
		
		<input type="submit" value="Submit"/>
	</form>
</body>
</html>
