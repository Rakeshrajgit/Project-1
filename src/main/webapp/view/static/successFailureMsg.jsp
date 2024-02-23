<%@page import="com.main.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div align="center">
		<%String successMessage=(String)request.getParameter("successMessage"); 
		String failureMessage=(String)request.getParameter("failureMessage");
		if(successMessage!=null){ %>
			<div class="alert alert-success" role="alert">
				<%=successMessage %>
			</div>
			
		<%}if(failureMessage!=null){ %>
			
			<div class="alert alert-danger" role="alert">
				<%=failureMessage %>
			</div>
		<%} %>
	</div>
	</body>
	</html>
	