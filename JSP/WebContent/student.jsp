<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Info</title>
</head>
<body>
	<h1>Student Marks</h1>
	<table>
		<tr>
			<td>Name</td>
			<td>Department</td>
			<td>Science</td>
			<td>Mathematics</td>
		</tr>

		<%
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/db1?useTimezone=true&serverTimezone=UTC", "root", "Sean990507");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from db1.student");
			rs.last();
			int rowNum = rs.getRow();
			int scienceSum = 0; 
			int mathSum = 0;
			rs.beforeFirst();
			while (rs.next()) {
				
				int scienceMark = Integer.parseInt(rs.getString(4));
				int mathMark = Integer.parseInt(rs.getString(5));
				
				scienceSum = scienceSum + scienceMark;
				mathSum = mathSum + mathMark;
		%>

		<tr>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("department")%></td>
			<td><%=rs.getInt("science")%></td>
			<td><%=rs.getInt("math")%></td>
		</tr>
	</table>

		<%
			}
			double scienceAvg = scienceSum / rowNum;
			double mathAvg = mathSum / rowNum;	
		%>

	<br>
	
	<p>The average of Science marks is <%= scienceAvg %></p>
	<p>The average of Mathematics marks is <%= mathAvg %></p>
		
	<a target="_blank" href="addStudent.jsp">Add Student</a>
</body>
</html>