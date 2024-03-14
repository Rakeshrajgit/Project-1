<%@page import="com.main.model.CustomerInfoUpdates"%>
<%@page import="org.apache.commons.codec.binary.StringUtils"%>
<%@page import="com.main.utils.MyDateTimeUtils"%>
<%@page import="com.main.model.CrmUser"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<jsp:include page="../static/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
.td-bg-highlight{
	background-color: #f3ae4b;
	color: #2b4450;
}

</style>

</head>
<body>

	<%
		String customerId = (String) request.getAttribute("customerId");
		List<CustomerInfoUpdates> customerInfoUpdates = (List<CustomerInfoUpdates>) request.getAttribute("customerInfoUpdates");
		Map<String, CrmUser> crmUserMap = (Map<String, CrmUser>) request.getAttribute("crmUsers");

	%>

	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Customers Updates</h5>
			</div>
			<div class="col-md-9 ">
				<ol class="breadcrumb">
					<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
					<li class="breadcrumb-item "><a href="CustomerList.htm">Customer List</a></li>
					<li class="breadcrumb-item "><a href="CustomerDetailsView.htm?customerId=<%=customerId %>" >Customer</a></li>
					<li class="breadcrumb-item active " aria-current="page">Customer Info Updates</li>
				</ol>
			</div>
		</div>
	</div>
	<div class="page card dashboard-card">

		<div class="card-body">
			<%@ include file="../static/successFailureMsg.jsp" %>
	
			
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-condensed" > 
					<thead>
						<tr>
							<th>Name</th>
							<th>Email</th>
							<th>Phone No.</th>
							<th>Gender</th>
							<th>DOB</th>
							<th>Address</th>
							<th>Id Proof1</th>
							<th>Id Proof2</th>
							<th>Agent</th>
							<th>Updated By</th>
							<th>Updated At</th>
						</tr>
					</thead>
					<tbody>
						<%for(int i=0;i< customerInfoUpdates.size();i++){
							
							CustomerInfoUpdates info=customerInfoUpdates.get(i);
							boolean nameCF=false,phoneNoCF=false,emailCF=false, addressCF=false,dobCF=false,proof1CF=false,proof2CF=false,genderCF=false,agentCF=false;
							if(i>0){
								CustomerInfoUpdates info1=customerInfoUpdates.get(i-1);
								
								nameCF=!StringUtils.equals(info.getFullName(), info1.getFullName());
								genderCF=!StringUtils.equals(info.getGender(), info1.getGender());
								phoneNoCF = !info.getPhoneNo().equals( info1.getPhoneNo());
								emailCF=!StringUtils.equals(info.getEmail(), info1.getEmail());
								addressCF = !StringUtils.equals(info.getAddress(), info1.getAddress());
								dobCF=!info.getDob().equals( info1.getDob());
								proof1CF=!StringUtils.equals(info.getIdProof1(), info1.getIdProof1());
								proof2CF = !StringUtils.equals(info.getIdProof2(), info1.getIdProof2());
								agentCF = !StringUtils.equals(info.getUserId(), info1.getUserId());
							}
							
							
							%>
						<tr>
							<td <%if(nameCF){ %>class="td-bg-highlight"<%} %> ><%=info.getFullName()%></td>
							<td <%if(emailCF){ %>class="td-bg-highlight"<%} %> ><%=info.getEmail()%></td>
							<td <%if(phoneNoCF){ %>class="td-bg-highlight"<%} %> ><%=info.getPhoneNo()%></td>
							<td <%if(genderCF){ %>class="td-bg-highlight"<%} %> ><%=info.getGender()%></td>
							<td <%if(dobCF){ %>class="td-bg-highlight"<%} %> ><%=MyDateTimeUtils.sqlToRegularDate(info.getDob().toString())%></td>
							<td <%if(addressCF){ %>class="td-bg-highlight"<%} %> ><%=info.getAddress()%></td>
							<td <%if(proof1CF){ %>class="td-bg-highlight"<%} %> ><%=info.getIdProof1()%></td>
							<td <%if(proof2CF){ %>class="td-bg-highlight"<%} %> ><%=info.getIdProof1()%></td>
							<% CrmUser agent = crmUserMap.get(info.getUserId());
							CrmUser updatedBy = crmUserMap.get(info.getUpdatedBy());%>
							<td <%if(agentCF){ %>class="td-bg-highlight"<%} %> ><%if(agent!=null){%><%=agent.getUserName()%> (<%=agent.getUserId() %>)<%} %></td>
							<td><%=updatedBy.getUserName()%> (<%=updatedBy.getUserId() %>)</td>
							<td><%=MyDateTimeUtils.LocalDateTimeToRegDateTimeAMPM(info.getUpdatedDate())%></td>
						</tr>
						<%} %>
					</tbody>
				</table>
			</div>
			


		</div>
	</div>
</body>
</html>