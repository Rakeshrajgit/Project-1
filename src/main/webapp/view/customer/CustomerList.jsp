<%@page import="com.main.utils.MyDateTimeUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.main.model.CustomerStates"%>
<%@page import="com.main.model.CrmUser"%>
<%@page import="com.main.configs.enums.UserTypes"%>
<%@page import="java.util.List"%>
<%@page import="com.main.model.Customer"%>
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
 	List<Customer> customerList = (List<Customer>)request.getAttribute("CustomerList");
	List<CustomerStates> customerStatusList  = (List<CustomerStates>)request.getAttribute("customerStatusList");

 	List<CrmUser> agents = (List<CrmUser>)request.getAttribute("Agents");
 	String userType = (String)request.getAttribute("userType");

 	String fromDate = (String)request.getAttribute("fromDate");
 	String endDate = (String)request.getAttribute("endDate");
 	String agentId = (String)request.getAttribute("agentId");
 	String customerStatusCode = (String)request.getAttribute("customerStatusCode");

 	boolean adm_man = userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString());

	Map<String,CustomerStates> cusStatesMap = new HashMap();
 	for(CustomerStates state : customerStatusList){
		cusStatesMap.put(state.getCustomerStatusCode(),state);
	}

%>

 
	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Customers List</h5>
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


		<div class="row" align="right" >
			<div class="col-md-8" ></div>
			<div class="col-md-3" align="right">
				<form action="CustomerList.htm" method="post" class="form-inline" style="float: right;">
				  
				  <div class="form-group mx-sm-3 mb-2">
				    <label 	><h5>Search :&nbsp;&nbsp;</h5></label>
				    <input type="text" name="customer_search_query" class="form-control" placeholder="min 4 chaaracters"  pattern=".{4,}" maxlength="100"  required="required" onblur="this.value=this.value.trim()">
				  </div>
				  <button type="submit" class="btn mb-2" style="background-color: #F9E897"><i class="fa fa-search" aria-hidden="true" style="color: #124076;"></i></button>
				</form>
				
			</div>
			<div class="col-md-1" >
				<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())|| userType.equalsIgnoreCase(UserTypes.ROLE_AGENT.toString())){ %>
					<form action="CustomerAdd.htm" method="get" style="float: right;">
			              <input type="submit" class="btn btn-sm add-btn" value="add">
			        </form>
				<% } %>
			</div>
		</div>
		<form action="CustomerList.htm" method="post">
		    <div class="LeadStage">
		        <div class="flex-item" >Customer Stage
		            <select id="customer_stage_dd" name="customer_status_code">
		            	<option value="0" <%if(customerStatusCode.equalsIgnoreCase("0")){ %> selected<%} %>>All</option>
		            	<%for(CustomerStates state : customerStatusList){ %>
		            		<%if(state.getClosedStates()==0){ %>
		            		<option value="<%=state.getCustomerStatusCode()%>" <%if(customerStatusCode.equalsIgnoreCase(state.getCustomerStatusCode())){ %> selected<%} %> ><%=state.getCustomerStatus()%></option>
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
		                <option value="<%=agent.getUserId()%>" <%if(agentId.equalsIgnoreCase(agent.getUserId())){ %> selected<%} %>><%=agent.getUserName() %>( <%=agent.getUserId() %> )</option>
		                <%} %>
		             </select>
		        </div>
		
		        <div class="flex-item">Registered between
		            <input type="text" name="customer_added_from" data-date-format="yyyy-mm-dd"
		            				value="<%=MyDateTimeUtils.sqlToRegularDate(fromDate) %>"
									required="required" id="customer_added_from" class=" input-sm" readonly="readonly">
					 -
		           <input type="text" name="customer_added_to" data-date-format="yyyy-mm-dd"
		           					value="<%=MyDateTimeUtils.sqlToRegularDate(endDate) %>"
									required="required" id="customer_added_to" class=" input-sm" readonly="readonly">
		        </div>

		        <div class="flex-item">
		        	<button type="submit" class="btn btn-sm submit-btn" >Submit</button>
		        </div>
		    </div>


		</form>
		<form action="CustomerList.htm" method="get">

		<table class="table table-striped">
		
		  <tr>
		  		<td>SN</td>
		  		<th>App. No</th>
		        <th>Name</th>
		        <th>Email</th>
		        <th>Phone No</th>
		        <th>Lead Stage</th>
		        <%if(adm_man){ %>
		        	<th>Owner  </th>
		        <%} %>
		        <th>Registered Date </th>
		        <th>Info  </th>
		        <%if(adm_man){ %>
		        	<th>Action</th>
		        <%} %>
		        <th>Status </th>
		    <tr>
		
			<% 
			int i=1;
			for(Customer customer : customerList)
			{
				%>
				<tr>
				 	<td><%=i++ %></td>
				 	<td><%=customer.getCustomerId()%></td>
					<td><%=customer.getFullName()%></td>
					<td><%=customer.getEmail()%></td>
					<td><%=customer.getPhoneNo()%></td>
					<td><%=cusStatesMap.get(customer.getCustomerStatusCode()).getCustomerStatus()%> </td>
					
		        	<%if(adm_man){ %>
		        	<td>
		        		<select id="customer-<%=customer.getCustomerId() %>" name="userId" onchange="updateAgentForCustomer('<%=customer.getCustomerId()%>',this.value);">
			            	<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())){ %>
			            		<option value="" <%if(customer.getUserId()==null){%> <%} %>style="color: red">UnAssigned</option>
			            	<%} %>
			                <%for(CrmUser agent : agents ){ %>
			                	<option value="<%=agent.getUserId()%>" <%if(agent.getUserId().equalsIgnoreCase(customer.getUserId())){%> selected<% }%>><%=agent.getUserName() %>( <%=agent.getUserId() %> )</option>
			                	
			                <%} %>
		             	</select>
		        	</td>
		        	<%} %>
					<td><%= MyDateTimeUtils.sqlToRegularDate(customer.getRegisterDate().toString()) %></td>
					<td><button type="submit" class="btn btn-sm misc-btn" name="customerId" value="<%=customer.getCustomerId() %>" formmethod="get" formaction="RedirectCustomerDetailsView.htm" >Info</button></td>
					<%if(adm_man){ %>
					<td>
						<button class="btn btn-sm update-btn" type="submit" name="customer_id" value="<%=customer.getCustomerId() %>" formmethod="post" formaction="CustomerEdit.htm" >Update</button>
						<button class="btn btn-sm delete-btn" type="submit" name="customer_id" value="<%=customer.getCustomerId() %>" formmethod="post" formaction="CustomerDelete.htm" onclick="return confirm('Are you sure to delete?')">
						<i class="fa-solid fa-trash-can" ></i>
						</button>
					</td>
					<%} %>
					<td><button class="btn btn-sm submit-btn" type="button" onclick="openStatusModal('<%=customer.getFullName() %>','<%=customer.getCustomerId() %>','<%=customer.getCustomerStatusCode() %>')" >Status</button></td>

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
				   				<%for(CustomerStates state : customerStatusList){ %>
				  					<option value="<%=state.getCustomerStatusCode() %>" data-supporting-value="<%=state.getExplicitPaymentType()%>"><%=state.getCustomerStatus() %></option>
			 					<%} %>
			   				</select>
			   			</div>
					</div>

					<div class="row" style=" padding: 5px; display:none;" id="modal_explicit_payment_row">
			   			<div class="col-md-12">
				   			<label>Full Payment Amount<span class="mandatory">*</span></label>
				   			<input type="number" class="form-control" name="full_payment_amount" id="modal_full_payment_amount" value="" min="1">
			   			</div>
					</div>

					<div class="row" style=" padding: 5px" >
			   			<div class="col-md-12">
				   			<span>Remarks<span class="mandatory">*</span></span>
				   			<textarea class="form-control" name="modal_status_remarks" id="modal_status_remarks" rows="5" cols="50" onblur="this.value=this.value.trim();" required="required"></textarea>
			   			</div>
					</div>
					<div class="row" style=" padding: 5px" >
			   			<div class="col-md-12" align="center">
				   			<button type="submit" class="btn btn-sm submit-btn" name="modal_customer_id" id="modal_btn_customer_id" value="" onclick="return onStatusSubmit()">Submit </button>
			   			</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</div>


</body>


<script type="text/javascript">

function onStatusSubmit(){

	var $remarks = $("#modal_status_remarks").val();
	if($remarks.trim().length >25){
		return confirm('Are you sure to Submit?')
	}else {
		alert("Remarks should be minimum 25 characters ");
		return false;
	}
}	
</script>

<script type="text/javascript">

$(document).ready(function() {

	$('#customer_added_from').daterangepicker({
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

	$('#customer_added_to').daterangepicker({
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
<script type="text/javascript">

$(document).ready(function() {

	  // Event listener for select change
	  $('#modal_customer_new_status').on('changed.bs.select', function(e, clickedIndex, isSelected, previousValue) {
	    // Get selected options
	    var selectedOptions = $(this).find('option:selected');

		if(selectedOptions.data('supporting-value')===1){
            $("#modal_full_payment_amount").attr('required', 'required');
            $("#modal_explicit_payment_row").css("display", "block");
         } else {
 			$("#modal_full_payment_amount").removeAttr('required')
 			$("#modal_full_payment_amount").val('');
            $("#modal_explicit_payment_row").css("display", "none");
         }
	  });
	});


</script>


<script type="text/javascript">

function openStatusModal($customer_name, $customer_id, $status_code){


	$('#modal_customer_name').html($customer_name);
	$('#modal_customer_Id').html($customer_id);
	$('#modal_customer_new_status').val($status_code).selectpicker('refresh');
	$('#modal_btn_customer_id').val($customer_id);

	$('#customer-status-modal').modal('toggle');

}

</script>



<script type="text/javascript">

function updateAgentForCustomer($appNo,$agentId){
	
	if(confirm('Are you Sure to update the owner for this customer?')){
		
		$.ajax({

			type : "POST",
			url : "UpdateAgentForCustomer.htm",
			data : {
					
				appNo : $appNo ,
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