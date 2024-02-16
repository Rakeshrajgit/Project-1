<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

     <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<table>
<tr>
<th>Id</th>
<th>Movie Name</th>
<th>No of Tickets</th>

<th>Payment type</th>

<th>Transaction Id</th>

<th>Show date</th>

<th>Ticket Type</th>

<th>Show Timing</th>

</tr>

<%



Connection conn=null;
Statement st=null;
ResultSet rs=null;


try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/springdb","root","Sajjanar@123");
	st=conn.createStatement();
	
	//String str=request.getParameter("ID");
	String qry="select * from booking ;";
	
	rs=st.executeQuery(qry);
	
	while(rs.next())
	{
		%>
		<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3) %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><%=rs.getString(8) %></td>
	
		</tr>
	<%
	}
	
}
catch(Exception e){}
%>
</table>

</body>
<style>

th,tr,td
{
border:1px Solid black;
}

</style>
</html>