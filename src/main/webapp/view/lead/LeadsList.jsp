<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.main.model.LeadStates"%>
<%@page import="com.main.utils.MyDateTimeUtils"%>
<%@page import="com.main.model.LeadStates"%>
<%@page import="org.hibernate.usertype.UserType"%>
<%@page import="com.main.model.CrmUser"%>
<%@page import="com.main.configs.enums.UserTypes"%>
<%@page import="java.util.List"%>
<%@page import="com.main.model.LeadForm"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
  <jsp:include page="../static/header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>


<style type="text/css">


.topDiv{
    height: 10px;
    width:100%px;

    display: flex;
    flex-direction: row;
    gap:100px;

    justify-content: flex-start;
    align-items: center;

    padding: 20px;
    background-color: #f0f0f0;
    border-bottom: 2px solid white;
}
.LeadStage{
    height: 30px;
    width:100%px;


    display: flex;
    gap: 20px;
    justify-content: flex-start;
    align-items: center;
    padding: 20px;
    background-color: #f0f0f0;
}
.flex-item
{
color: grey;
text-align: center;
font-family: Noto Sans;
font-size: 14px;
font-weight: 500;
}

#Dropdown{
    color:grey;
    font-size: 14px;
    border-color: grey;
    font-family:Noto Sans;
    border:0.5px grey solid;
    width:120px;
    margin-left:10px;
}

select > option{
    color:grey;
    font-size:14px;
    font-family:Noto Sans;
    background-color: whitesmoke;
}

.SecDiv{
    height: 10px;
    width:100%px;


    display: flex;
    gap: 20px;
    justify-content: space-evenly;
    align-items: center;
    padding: 20px;
    background-color: #f0f0f0;
    border: 1px solid #ddd;
    background: radial-gradient(circle, #fff, #ddd);
    border-bottom:2px solid white;

}

.ThirdDiv{

    width: 100%;
    height: 100%;
    background:radial-gradient(circle, #fff, #ddd);


    display: flex;

}

.item1{
    flex-basis:330px;
    border-right:2px solid #ddd;
}

.item2{
    flex-basis:200px;
    border-right:2px solid #ddd;
}
.item3{
    flex-basis:220px;
    border-right:2px solid #ddd;
}

.item4{
    flex-basis:200px;
    border-right:2px solid #ddd;
}


.item5{
    flex-basis:230px;
    border-right:2px solid #ddd;
}


.name
{
margin-left=10px;
}

</style>


</head>
<body>
<%
	List<LeadForm> leadList = (List<LeadForm>)request.getAttribute("leadList");

	List<LeadStates> leadStatusList  = (List<LeadStates>)request.getAttribute("leadStatusList");

 	List<CrmUser> agents = (List<CrmUser>)request.getAttribute("Agents");
 	String userType = (String)request.getAttribute("userType");
 	boolean adm_man = userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString());

	String fromDate = (String)request.getAttribute("fromDate");
 	String endDate = (String)request.getAttribute("endDate");
 	String agentId = (String)request.getAttribute("agentId");
 	String leadStatusCode = (String)request.getAttribute("leadStatusCode");
 	
 	Map<String,LeadStates> leadStatesMap = new HashMap();
 	for(LeadStates state : leadStatusList){
 		leadStatesMap.put(state.getLeadStatusCode(),state);
	}
 	
%>

 
	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Leads List</h5>
			</div>
				<div class="col-md-9 ">
					<ol class="breadcrumb">
						<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
						<li class="breadcrumb-item active " aria-current="page">Leads List</li>
					</ol>
				</div>
			</div>
	</div>	
	<div class="page card dashboard-card">
	
	<div class="card-body" >
	
		<%@ include file="../static/successFailureMsg.jsp" %>
	
		<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())|| userType.equalsIgnoreCase(UserTypes.ROLE_AGENT.toString())){ %>
		
		<form action="LeadAdd.htm" method="get" style="float: right;">
              <input type="submit" class="btn btn-sm add-btn" value="Add">
        </form>
		
		<% } %>
		<form action="LeadList.htm" method="post">
		    <div class="LeadStage">
		        <div class="flex-item" >Lead Stage
		            <select id="Lead_stage_dd" name="Lead_status_code">
		            	<option value="0" <%if(leadStatusCode.equalsIgnoreCase("0")){ %> selected<%} %>>All</option>
		            	<%for(LeadStates state : leadStatusList){ %>
		            		<%if(state.getClosedState()==0){ %>
		            		<option value="<%=state.getLeadStatusCode()%>" <%if(leadStatusCode.equalsIgnoreCase(state.getLeadStatusCode())){ %> selected<%} %> ><%=state.getLeadStatus()%></option>
		            		<%} %>
		            	<%} %>
		                
		             </select>
		        </div>
		
		        <div class="flex-item">Owner
		            <select id="Dropdown" name="userId">
		            	<option value="0" selected="selected" >All</option>
		            	<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())){ %>
		            		<option value="UnAssigned" style="color: red" <%if(agentId.equalsIgnoreCase("UnAssigned")){ %> selected<%} %>>UnAssigned</option>
		            	<%} %>
		                <%for(CrmUser agent : agents ){ %>
		                <option value="<%=agent.getUserId()%>" <%if(agentId.equalsIgnoreCase(agent.getUserId())){ %> selected<%} %>><%=agent.getUserName() %></option>
		                <%} %>
		             </select>
		        </div>
		
		        <div class="flex-item">Registered between
		            <input type="text" name="Lead_added_from" data-date-format="yyyy-mm-dd" 
		            				value="<%=MyDateTimeUtils.SqlToRegularDate(fromDate) %>"
									required="required" id="Lead_added_from" class=" input-sm" readonly="readonly">
					 - 
		           <input type="text" name="Lead_added_to" data-date-format="yyyy-mm-dd" 
		           					value="<%=MyDateTimeUtils.SqlToRegularDate(endDate) %>"	
									required="required" id="Lead_added_to" class=" input-sm" readonly="readonly">
		        </div>
		        
		        <div class="flex-item">
		        	<button type="submit" class="btn btn-sm submit-btn">Submit</button>
		        </div>
		    </div>
		
		 
		</form>
		
		<form action="LeadsList.htm" method="get">
	
		<table class="table table-striped">
		
		  <tr>
		  		<td>SN</td>
		  		<th>App. No</th>
		        <th>Name</th>
		        <th>Email</th>
		        <th>Phone No</th>
		        <th>Lead Stage</th>
		        <%if(adm_man){ %>
		        	<th>Owner</th>
		        <%} %>
		        <th>Modify On</th>
		        <th>Info</th>
		        <th>Update</th>
		        <th>Status</th>
		    <tr>
		
			<% 
			int i=1;
			for(LeadForm lead : leadList)
			{
				%>
				<tr>
				 	<td><%=i++ %></td>
				 	<td><%=lead.getLeadId()%></td>
					<td><%=lead.getLeadName()%></td>
					<td><%=lead.getLeadEmail()%></td>
					<td><%=lead.getLeadPhoneNo()%></td>
					<td><%=leadStatesMap.get(lead.getLeadStatus()).getLeadStatus()%> </td>
					
		        	<%if(adm_man){ %>
		        	<td>
		        		<select id="lead-<%=lead.getLeadId() %>" name="userId" onchange="updateAgentForLead('<%=lead.getLeadId()%>',this.value);">
			            	<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())){ %>
			            		<option value="" <%if(lead.getUserId()==null){%> <%} %>style="color: red">UnAssigned</option>
			            	<%} %>
			                <%for(CrmUser agent : agents ){ %>
			                	<option value="<%=agent.getUserId()%>" <%if(agent.getUserId().equalsIgnoreCase(lead.getUserId())){%> selected<% }%>><%=agent.getUserName() %></option>
			                	
			                <%} %>
		             	</select>
		        	</td>
		        	<%} %>
					<td><%= MyDateTimeUtils.SqlToRegularDate(lead.getRegisteredDate().toString()) %></td>  
					<td><button type="submit" class="btn btn-sm misc-btn" name="lead_id" value="<%=lead.getLeadId() %>" formmethod="get" formaction="RedirectleadDetailsView.htm" >Info</button></td>
					<td><button class="btn btn-sm update-btn" type="submit" name="lead_id" value="<%=lead.getLeadId() %>" formmethod="post" formaction="LeadEdit.htm" >Update</button></td>
					<td><button class="btn btn-sm submit-btn" type="button" onclick="openStatusModal('<%=lead.getLeadName() %>','<%=lead.getLeadId() %>','<%=lead.getLeadStatus() %>')" >Status</button></td>
					
				</tr>
			<%}%>
			
			
		</table>
		
		</form>
		
	</div>

</div>



<div class="modal fade customer-status-modal"  id="customer-status-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">

	<div class="modal-dialog modal-lg modal-dialog-centered" style="min-width: 40% !important;min-height: 40% !important; ">
		<div class="modal-content" >
			<div class="modal-header" style="background: #F5C6A5; ">
		        <div class="row" >
		        	<div class="col-md-12">
				    <h4>Customer Status Update</h4>
				    </div>
			    </div>
			    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			    	<i class="fa-solid fa-xmark" aria-hidden="true" ></i>
			    </button>
		    </div>
			<div class="modal-body" style="min-height: 20rem;">
				<form action="UpdateCustomerStatus.htm" method="post">
					<div class="row" style=" padding: 5px" >
			   			<div class="col-md-6"> 
				   			<span class="mandatory">Customer Name : </span> <span id="modal_customer_name"></span>
			   			</div>
			   			<div class="col-md-6"> 
				   			<span class="mandatory">Customer Id : </span> <span id="modal_customer_Id"></span>
			   			</div>
					</div>
					
			   		<div class="row" style=" padding: 5px" >
			   			<div class="col-md-12"> 
				   			<label>Status<span class="mandatory">*</span></label>
				   			<select name="customer_new_status" class="form-control selectpicker" id="modal_customer_new_status" data-size="auto" data-live-search="true" data-container="body" >
				   				<%for(LeadStates state : leadStatusList){ %>
				  					<option value="<%=state.getLeadStatusCode() %>" ><%=state.getLeadStatus() %></option>
			 					<%} %>
			   				</select>
			   			</div>
					</div>
					
					<div class="row" style=" padding: 5px; display:none;" id="modal_explicit_payment_row">
			   			<div class="col-md-12"> 
				   			<label>Full Payment Amount<span class="mandatory">*</span></label>
				   			<input type="number" class="form-control" name="full_payment_amount" id="modal_full_payment_amount" value="0" min="0">
			   			</div>
					</div>
					
					<div class="row" style=" padding: 5px" >
			   			<div class="col-md-12"> 
				   			<span>Remarks<span class="mandatory">*</span></span>
				   			<textarea class="form-control" name="modal_status_remarks" rows="5" cols="50" onblur="this.value=this.value.trim();" required="required"></textarea>
			   			</div>
					</div>
					<div class="row" style=" padding: 5px" >
			   			<div class="col-md-12" align="center"> 
				   			<button type="submit" class="brn btn-sm submit-btn" name="modal_customer_id" id="modal_btn_customer_id" value="" onclick="return confirm('Are you sure to Submit?')">Submit </button>
			   			</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
									

</body>

<script type="text/javascript">

function updateAgentForLead($leadId,$agentId){
	
	if(confirm('Are you Sure to update the owner for this Lead?')){
		
		$.ajax({

			type : "POST",
			url : "UpdateAgentForLead.htm",
			data : {
					
				leadId : $leadId ,
				agentId : $agentId ,
				
			},
			datatype : 'json',
			success : function(result) {
				alert(result);
			}
		});
		
	}
	
	
}

</script>

</html>