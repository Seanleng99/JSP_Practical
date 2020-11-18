<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Student</title>
</head>
<body>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String department = request.getParameter("department");
	String science = request.getParameter("science");
	String math = request.getParameter("math");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "Sean990507");
	PreparedStatement stmt = conn.prepareStatement("insert into student(id, name, department, science, mathematics) values (?,?,?,?,?,?)");
	stmt.setString(1, id);
	stmt.setString(2, name);
	stmt.setString(3, department);
	stmt.setString(4, science);
	stmt.setString(5, math);
	stmt.executeUpdate();
%>

<h2>Add new student information</h2>
	<label for="id">ID:</label> <br>
	<input type="text" id="id" name="id"><br>
		
	<label for="name">Name:</label><br>
	<input type="text" id="name" name="name"> <br>

	<label for="dept">Department:</label><br>
	<input type="text" id="department" name="dept"> <br>
		
	<label for="science">Science:</label><br>
	<input type="number" id="science" name="science"> <br>
		
	<label for="math">Mathematics:</label><br>
	<input type="number" id="math" name="math"> <br>
		
	<input type="submit" value="Submit">

	<form method="get">
		<input type="submit" value="Add">
	</form>

	<a target="_blank" href="student.jsp">Go to view student info.</a>
</body>
</html>