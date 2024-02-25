<%@page import="com.main.configs.enums.UserTypes"%>
<%@page import="com.main.utils.MyDateTimeUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.main.model.Customer"%>
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
	SimpleDateFormat sdf= MyDateTimeUtils.getSqlDateFormat();
	SimpleDateFormat sdf1=MyDateTimeUtils.getRegularDateFormat();
	Customer customer = (Customer) request.getAttribute("customer");
	
    String userType = (String) session.getAttribute("UserType");
%>


	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<%if(customer==null){ %>
					<h5>Customer Add</h5>
				<%}else{ %>
					<h5>Customer Edit</h5>
				<%} %>
			</div>
			<div class="col-md-9 ">
				<ol class="breadcrumb">
					<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i
							class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
					<li class="breadcrumb-item "><a href="CustomerList.htm">Customers List</a></li>
					<%if(customer==null){ %>
					<li class="breadcrumb-item active " aria-current="page">Customer Add</li>
					<%}else{ %>
					<li class="breadcrumb-item active " aria-current="page">Customer Edit</li>
					<%} %>
				</ol>
			</div>
		</div>
	</div>
	<div class="page card dashboard-card">

		<div class="card-body">

			<div class="card-body">
				<form method="post" autocomplete="off" onsubmit="return validateForm()">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group">
						<div class="row">
							<div class="col-md-3">
								<label>Full Name<span class="mandatory">*</span></label> <input
									type="text" name="customer_name"
									value="<%if (customer != null) {%><%=customer.getFullName()%><%}%>"
									id="customer_name" class="form-control input-sm"
									maxlength="255" placeholder="Customer Name" required="required" onblur="this.value = this.value.trim();">
							</div>
							<div class="col-md-3">
								<label>E-Mail<span class="mandatory">*</span></label> <input
									type="email" name="customer_email"
									value="<%if (customer != null) {%><%=customer.getEmail()%><%}%>"
									required="required" id="customer_email"
									class="form-control input-sm" maxlength="255"
									placeholder="E-Mail" onblur="this.value = this.value.trim();">
							</div>
							<div class="col-md-2">
								<label>Phone No<span class="mandatory">*</span></label> <input
									type="number" name="customer_phone"
									value="<%if (customer != null) {%><%=customer.getPhoneNo()%><%}%>"
									required="required" id="customer_phone"
									class="form-control input-sm" min="1000000000" max="9999999999"
									placeholder="Phone No.">
							</div>
							<div class="col-md-2">
								<label>Gender<span class="mandatory">*</span></label> <select
									class="form-control select2 " name="customer_gender"
									required="required" >
									<option disabled="disabled">Select ..</option>
									<option value="Male"
										<%if (customer != null && customer.getGender().equalsIgnoreCase("Male")) {%>
										selected <%}%>>Male</option>
									<option value="Female"
										<%if (customer != null && customer.getGender().equalsIgnoreCase("Female")) {%>
										selected <%}%>>Female</option>
								</select>
							</div>
							<div class="col-md-2">
								<label>DOB<span class="mandatory">*</span></label> <input
									type="text" name="customer_dob"
									data-date-format="yyyy-mm-dd" value="<%if (customer != null) {%><%=MyDateTimeUtils.SqlToRegularDate(customer.getDob().toString())%><%} %>"
									required="required" id="customer_dob"
									class="form-control input-sm">
							</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">

							<div class="col-md-3">
								<label>Address<span class="mandatory">*</span></label> <input
									type="text" name="customer_address"
									value="<%if (customer != null) {%><%=customer.getAddress()%><%}%>"
									required="required" id="customer_address"
									class="form-control input-sm" maxlength="255"
									placeholder="Address" onblur="this.value = this.value.trim();">
							</div>
							<div class="col-md-3">
								<label>ID proof 1</label> <input
									type="number" name="customer_proof1"
									value="<%if (customer != null && customer.getIdProof1()!=null) {%><%=customer.getIdProof1()%><%}%>"
									id="customer_proof1" class="form-control input-sm"
									max="999999999999" min="100000000000" placeholder="ID Proof 1" onblur="this.value = this.value.trim();">
							</div>

							<div class="col-md-3">
								<label>ID proof 2</label> <input
									type="text" name="customer_proof2"
									value="<%if (customer != null && customer.getIdProof2()!=null) {%><%=customer.getIdProof2()%><%}%>"
									id="customer_proof2" class="form-control input-sm"
									maxlength="10" placeholder="ID Proof 2" onblur="this.value = this.value.trim();">
							</div>

						</div>
					</div>
					<hr>
					<div class="form-group">
						<div class="row">

							<div class="col-md-3">
								<label>Opening Cibil </label> <input type="number"
									name="customer_open_cibil"
									value="<%if (customer != null && customer.getOpenCibilScore()!=null) {%><%=customer.getOpenCibilScore()%><%}%>"
									id="customer_open_cibil" class="form-control input-sm" min="0"
									max="900" placeholder="Opening Cibil Score" >
							</div>
							<div class="col-md-2">
								<label>Opening Date</label> <input type="text"
									name="customer_cibil_open_date" 
									data-date-format="yyyy-mm-dd"
									value="<%if (customer != null && customer.getOpenDate()!=null) {%><%=MyDateTimeUtils.SqlToRegularDate(customer.getOpenDate().toString())%><%}%>"
									id="customer_cibil_open_date" class="form-control input-sm">
							</div>

							<div class="col-md-3">
								<label>Closing Cibil</label> <input type="number"
									name="customer_close_cibil"
									value="<%if (customer != null && customer.getCloseCibilScore()!=null) {%><%=customer.getCloseCibilScore()%><%}%>"
									id="customer_close_cibil" class="form-control input-sm" min="0"
									max="900" maxlength="255" placeholder="Closing Cibil Score">
							</div>
							<div class="col-md-2">
								<label>Closing Date</label> <input type="text"
									name="customer_cibil_close_date" 
									data-date-format="yyyy-mm-dd"
									value="<%if (customer != null && customer.getCloseCibilScore()!=null) {%><%=MyDateTimeUtils.SqlToRegularDate(customer.getCloseDate().toString())%><%}%>"
									id="customer_cibil_close_date" class="form-control input-sm">
							</div>

						</div>
					</div>
					<%
					if (customer == null && !(userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) )) {
					%>
					<div class="form-group">
						<div class="row">
							<div class="col-md-12">
								<input type="checkbox" name="assign_self" value="yes"><span style="font-weight: 600;">&nbsp;&nbsp;&nbsp; Assign to Self</span>
							</div>
						</div>
					</div>
					<%
					}
					%>


					<div class="row">
						<div class="col-12" align="center">
							<%
							if (customer != null) {
							%>
							<button type="submit" class="btn btn-sm update-btn"
								name="customer_id" value="<%=customer.getCustomerId()%>"
								formaction="CustomerEditSubmit.htm" formmethod="post" Onclick="return confirm('Are you sure to submit?')">Update</button>
							<%
							} else {
							%>
							<button type="submit" class="btn btn-sm submit-btn"
								formaction="CustomerAddSubmit.htm" formmethod="post" onclick="return confirm('Are you sure to Submit?')">Add</button>
							<%
							}
							%>
						</div>
					</div>


				</form>
			</div>


		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {

			$('#customer_dob').daterangepicker({
				"singleDatePicker" : true,
				"linkedCalendars" : false,
				"showCustomRangeLabel" : true,
				"maxDate" : new Date(),
				"cancelClass" : "btn-default",
				showDropdowns : true,
				locale : {
					format : 'DD-MM-YYYY'
				}
			});
			
			$('#customer_cibil_close_date').daterangepicker({
				"singleDatePicker" : true,
				"linkedCalendars" : false,
				"showCustomRangeLabel" : true,
				"maxDate" : new Date(),
				"cancelClass" : "btn-default",
				showDropdowns : true,
				locale : {
					format : 'DD-MM-YYYY'
				}
			});
			
			$('#customer_cibil_open_date').daterangepicker({
				"singleDatePicker" : true,
				"linkedCalendars" : false,
				"showCustomRangeLabel" : true,
				"maxDate" : new Date(),
				"cancelClass" : "btn-default",
				showDropdowns : true,
				locale : {
					format : 'DD-MM-YYYY'
				}
			});

		});
		
	</script>

</body>
</html>