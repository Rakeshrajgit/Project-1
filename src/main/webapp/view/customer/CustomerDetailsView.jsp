<%@page import="com.main.model.CustomerPayments"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.main.utils.MyDateTimeUtils"%>
<%@page import="com.main.model.CustomerStates"%>
<%@page import="com.main.model.CustomerStateTransactions"%>
<%@page import="java.util.List"%>
<%@page import="com.main.model.Customer"%>
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
		Customer customer = (Customer) request.getAttribute("CustomerDetails");
		List<CustomerStateTransactions> custTransactions = (List<CustomerStateTransactions>) request.getAttribute("CustomerTransactions");
		List<CustomerStates> custStates = (List<CustomerStates>) request.getAttribute("CustomerTransactionStates");
		List<CustomerPayments> custPayments = (List<CustomerPayments>) request.getAttribute("CustomerPayments");
		
		
		Map<String,CustomerStates> cusStatesMap = new HashMap();
		
		for(CustomerStates state : custStates){
			cusStatesMap.put(state.getCustomerStatusCode(),state);
		}
		
	%>


	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Customer Details - <%=customer.getCustomerId() %></h5>
			</div>
			<div class="col-md-9 ">
				<ol class="breadcrumb">
					<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i
							class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
					<li class="breadcrumb-item "><a href="CustomerList.htm">Customers List</a></li>
					<li class="breadcrumb-item active " aria-current="page">Customer </li>
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
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getFullName() %></span>
							</div>
							<div class="col-md-3">
								<label class="label">Phone :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getPhoneNo() %></span>
							</div>
							<div class="col-md-3">
								<label class="label">Email :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getEmail() %></span>
							</div>
							<div class="col-md-3">
								<label class="label">DOB :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=MyDateTimeUtils.SqlToRegularDate(customer.getDob().toString()) %></span>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-3">
								<label class="label">Gender :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getGender() %></span>
							</div>
							<div class="col-md-6">
								<label class="label">Address :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getAddress()%></span>
							</div>
							<div class="col-md-3">
								<label class="label" style="color: red">Status :</label>
								<span class="value" style="color: red">&nbsp;&nbsp;&nbsp;<%=cusStatesMap.get(customer.getCustomerStatusCode()).getCustomerStatus() %></span>
							</div>
							
						</div>
						<hr>
						<div class="row">
							<div class="col-md-3">
								<label class="label">Id Proof 1 :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getIdProof1() %></span>
							</div>
							<div class="col-md-5">
								<label class="label">Id Proof 2 :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getIdProof2() %></span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<label class="label">Opening Cibil :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getOpenCibilScore() %></span>
							</div>
							<div class="col-md-3">
								<label class="label">Opening Date :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getOpenDate()!=null?MyDateTimeUtils.SqlToRegularDate(customer.getOpenDate().toString()):"-" %></span>
							</div>
							<div class="col-md-3">
								<label class="label">Closing Cibil :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getCloseCibilScore() %></span>
							</div>
							<div class="col-md-3">
								<label class="label">Closing Date :</label>
								<span class="value">&nbsp;&nbsp;&nbsp;<%=customer.getCloseDate()!=null?MyDateTimeUtils.SqlToRegularDate(customer.getCloseDate().toString()):"-" %></span>
							</div>
						</div>
						
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12" align="center"><h4 style="font-weight: 600;">Payments</h4></div>
					</div>
					<div class="table-responsive">
					   	<table class="table table-bordered table-hover table-striped table-condensed"   style="max-width: 100% !important"> 
							<thead>
								<tr>
									<th style="text-align: center;padding-top:5px; padding-bottom: 5px;width: 5%;">
										SN
									</th>
									<th style="width: 15%;">Date</th>
									<th style="width: 10%;">Agent Id</th>
									<th style="width: 20%;">Paid For</th>
									<th style="width: 20%;">Amount</th>
								</tr>
							</thead>
							<tbody>
								<%int i=1;
								int total_amount=0;
									for(CustomerPayments payment : custPayments){ %>
								<tr>
									<td style="text-align: center;"><%=i++ %></td>
									<td><%=MyDateTimeUtils.LocalDateTimeToRegDateTime(payment.getTransactionDate()) %></td>
									<td><%=payment.getUserId() %></td>
									<td><%=cusStatesMap.get(payment.getCustomerStatusCode()).getCustomerStatus() %></td>
									<td><%=payment.getPaymentAmount() %></td>
								</tr>
									<%total_amount +=payment.getPaymentAmount();
									} %>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<th>Total Amount</th>
									<th><%=total_amount %></th>
								</tr>
							</tbody>
						</table>		
						</div>
						
					<hr>
					<div class="row">
						<div class="col-md-12" align="center"><h4 style="font-weight: 600;">State Transactions</h4></div>
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
								<% i=1;
									for(CustomerStateTransactions transaction : custTransactions){ %>
								<tr>
									<td style="text-align: center;"><%=i++ %></td>
									<td><%=MyDateTimeUtils.LocalDateTimeToRegDateTime(transaction.getTransactTimeStamp()) %></td>
									<td><%=transaction.getActionBy() %></td>
									<td><%=cusStatesMap.get(transaction.getCustomerStatusCodeFrom()).getCustomerStatus() %></td>
									<td><%=cusStatesMap.get(transaction.getCustomerStatusCodeTo()).getCustomerStatus() %></td>
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