<%@page import="com.main.configs.enums.UserTypes"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.main.utils.MyDateTimeUtils"%>
<%@page import="com.main.model.LeadStates"%>
<%@page import="com.main.model.LeadsStateTransactions"%>
<%@page import="java.util.List"%>
<%@page import="com.main.model.LeadForm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<jsp:include page="../static/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.label{
	font-size: 18px;
	font-weight: bold;
}
.value{
	font-size: 20px;
}

</style>
</head>
<body>

	<%
		LeadForm lead = (LeadForm) request.getAttribute("LeadDetails");
		List<LeadsStateTransactions> custTransactions = (List<LeadsStateTransactions>) request.getAttribute("LeadTransactions");
		List<LeadStates> leadStates = (List<LeadStates>) request.getAttribute("LeadTransactionStates");
		String userType = (String) request.getAttribute("userType");
		
		Map<String,LeadStates> leadStatesMap = new HashMap();
		
		for(LeadStates state : leadStates){
			leadStatesMap.put(state.getLeadStatusCode(),state);
		}
		boolean adm_type=userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString());
		
	%>


	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Lead Details - <%=lead.getLeadId() %></h5>
			</div>
			<div class="col-md-5">
				<%if(adm_type){ %>
				<form>
					<button type="submit" class="btn btn-sm preview-btn" name="leadId" value="<%=lead.getLeadId()%>" formaction="LeadInfoUpdateHistory.htm" formmethod="POST">Info History</button>
					<%-- <button type="submit" class="btn btn-sm preview-btn" name="leadId" value="<%=lead.getLeadId()%>" formaction="LeadInfoUpdateHistory.htm" formmethod="POST">View History</button> --%>
				</form>
				<%} %>
			</div>
			<div class="col-md-4 ">
				<ol class="breadcrumb">
					<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i
							class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
					<li class="breadcrumb-item "><a href="LeadList.htm">Leads List</a></li>
					<li class="breadcrumb-item active " aria-current="page">Lead </li>
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
			
			<div class="row">
				<div class="col-md-12">
					
					<div class="form-group">
						<div class="row">
							<div class="col-md-3">
								<label class="label">Full Name :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=lead.getLeadName() %></span>
							</div>
							<div class="col-md-3">
								<label class="label">Phone :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=lead.getLeadPhoneNo() %></span>
							</div>
							<div class="col-md-3">
								<label class="label">Email :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=lead.getLeadEmail() %></span>
							</div>
							<div class="col-md-3">
								<label class="label">Location :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;
								<%if(lead.getLeadLocation()!=null && !lead.getLeadLocation().trim().equals("") ){%> <%=lead.getLeadLocation() %> <%}else{ %> - <%} %>
								</span>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-3">
								<label class="label" style="color: red">Agent :</label>
								<span class="value" style="color: red">&nbsp;&nbsp;&nbsp;<%=lead.getUserId() %></span>
							</div>
							<div class="col-md-3">
								<label class="label" style="color: red">Status :</label>
								<span class="value" style="color: red">&nbsp;&nbsp;&nbsp;<%=leadStatesMap.get(lead.getLeadStatus()).getLeadStatus() %></span>
							</div>
							
						
							<div class="col-md-3">
								<label class="label" style="color: red">Customer Id :</label>
								<span class="value" style="color: red">&nbsp;&nbsp;&nbsp; <%if(lead.getCustomerId()!=null){ %> <%=lead.getCustomerId() %> <%} %></span>
							</div>
							
						</div>
						
						
						
					</div>
					<hr>
					
					<div class="row">
						<div class="col-md-12" align="center">
						<h4 style="font-weight: 600;" >State Transactions</h4>
						</div>
					</div>
					<div class="row">
					<div class="table-responsive">
					   	<table class="table table-bordered table-hover table-striped table-condensed" style="max-width: 100% !important"> 
							<thead>
								<tr>
									<th style="text-align: center;padding-top:5px; padding-bottom: 5px;width: 5%;">
										SN
									</th>
									<th style="width: 15%;">Date</th>
									<th style="width: 10%;">Agent Id</th>
									<th style="width: 20%;">Status From</th>
									<th style="width: 20%;">Status To</th>
									<th style="width: 30%;">Remarks</th>
								</tr>
							</thead>
							<tbody>
								<%int  i=1;
									for(LeadsStateTransactions transaction : custTransactions){ %>
								<tr>
									<td style="text-align: center;"><%=i++ %></td>
									<td><%=MyDateTimeUtils.LocalDateTimeToRegDateTimeAMPM(transaction.getTransactTimeStamp()) %></td>
									<td><%=transaction.getActionBy() %></td>
									<td>
										<%if(transaction.getLeadStatusCodeFrom()!=null){ %>
											<%=leadStatesMap.get(transaction.getLeadStatusCodeFrom()).getLeadStatus() %>
										<%}else{ %>
											-
										<%} %>
									</td>
									<td><%=leadStatesMap.get(transaction.getLeadStatusCodeTo()).getLeadStatus() %></td>
									<td><%=transaction.getRemarks() %></td>
								</tr>
								<%} %>
							</tbody>
						</table>				
					</div>
					</div>
			</div>
			

		</div>
	</div>

	</div>
</body>
</html>