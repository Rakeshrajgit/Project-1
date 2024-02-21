<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<jsp:include page="../static/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<%
		// fetch java objects here from request 
	%>


	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Leads List</h5>
			</div>
			<div class="col-md-9 ">
				<ol class="breadcrumb">
					<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i
							class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
					<li class="breadcrumb-item active " aria-current="page">Leads
						List</li>
				</ol>
			</div>
		</div>
	</div>
	<div class="page card dashboard-card">

		<div class="card-body">
			<div align="center">
				<% String ses = (String) request.getParameter("result");
					String ses1 = (String) request.getParameter("resultfail");
					if (ses1 != null) {
				%>
				<div class="alert alert-danger" role="alert">
					<%=ses1%>
				</div>

				<% } if (ses != null) { %>

				<div class="alert alert-success" role="alert">
					<%=ses%>
				</div>
				<% } %>
			</div>
			
			
			<!-- --------------------- -->
			
					your code here
			<!-- --------------------- -->
			


		</div>
	</div>
</body>
</html>