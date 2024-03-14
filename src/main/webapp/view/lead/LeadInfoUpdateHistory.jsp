<%@page import="org.apache.commons.codec.binary.StringUtils"%>
<%@page import="com.main.model.LeadAcqTypes"%>
<%@page import="com.main.utils.MyDateTimeUtils"%>
<%@page import="com.main.model.CrmUser"%>
<%@page import="com.main.model.LeadsInfoUpdates"%>
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
		String leadId = (String) request.getAttribute("leadId");
		List<LeadsInfoUpdates> leadInfoUpdates = (List<LeadsInfoUpdates>) request.getAttribute("LeadInfoUpdates");
		Map<String, CrmUser> crmUserMap = (Map<String, CrmUser>) request.getAttribute("CrmUsers");
		Map<String, LeadAcqTypes> leadSourcesMap = (Map<String, LeadAcqTypes>) request.getAttribute("leadSourcesMap");

	%>


	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Leads Updates</h5>
			</div>
			<div class="col-md-9 ">
				<ol class="breadcrumb">
					<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
					<li class="breadcrumb-item "><a href="LeadList.htm">Leads List</a></li>
					<li class="breadcrumb-item "><a href="LeadDetailsView.htm?leadId=<%=leadId %>" >Lead</a></li>
					<li class="breadcrumb-item active " aria-current="page">Lead Info Updates</li>
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
							<th>Phone No.</th>
							<th>Email</th>
							<th>Location</th>
							<th>Source</th>
							<th>Bound</th>
							<th>Agent</th>
							<th>Updated By</th>
							<th>Updated At</th>
						</tr>
					</thead>
					<tbody>
						<%for(int i=0;i< leadInfoUpdates.size();i++){
							
							LeadsInfoUpdates info=leadInfoUpdates.get(i);
							boolean nameCF=false,phoneNoCF=false,emailCF=false, locationCF=false,acqSourceCF=false,boundCF=false,agentCf=false;
							if(i>0){
								LeadsInfoUpdates info1=leadInfoUpdates.get(i-1);
								nameCF=!StringUtils.equals(info.getLeadName(), info1.getLeadName());
								phoneNoCF = !info.getLeadPhoneNo().equals( info1.getLeadPhoneNo());
								emailCF=!StringUtils.equals(info.getLeadEmail(), info1.getLeadEmail());
								locationCF=!StringUtils.equals(info.getLeadLocation(), info1.getLeadLocation());
								boundCF = !StringUtils.equals(info.getBound(), info1.getBound());
								agentCf = !StringUtils.equals(info.getUserId(), info1.getUserId());
							}
							
							
							%>
						<tr>
							<td <%if(nameCF){ %>class="td-bg-highlight"<%} %> ><%=info.getLeadName()%></td>
							<td <%if(phoneNoCF){ %>class="td-bg-highlight"<%} %> ><%=info.getLeadPhoneNo()%></td>
							<td <%if(emailCF){ %>class="td-bg-highlight"<%} %> ><%=info.getLeadEmail()%></td>
							<td <%if(locationCF){ %>class="td-bg-highlight"<%} %> ><%=info.getLeadLocation()%></td>
							<td <%if(acqSourceCF){ %>class="td-bg-highlight"<%} %> ><%=leadSourcesMap.get(info.getLeadAcqCode()).getLeadAcqType()%></td>
							<td <%if(boundCF){ %>class="td-bg-highlight"<%} %> ><%=info.getBound()%></td>
							<% CrmUser agent = crmUserMap.get(info.getUserId());
							CrmUser updatedBy = crmUserMap.get(info.getUpdatedBy());%>
							<td <%if(agentCf){ %>class="td-bg-highlight"<%} %> ><%if(agent!=null){%><%=agent.getUserName()%> (<%=agent.getUserId() %>)<%} %></td>
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