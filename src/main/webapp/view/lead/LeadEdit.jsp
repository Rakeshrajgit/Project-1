<!DOCTYPE html>
<%@page import="io.micrometer.common.util.StringUtils"%>
<%@page import="com.main.model.LeadForm"%>
<%@page import="com.main.configs.enums.UserTypes"%>
<%@page import="com.main.model.LeadAcqTypes"%>
<%@page import="java.util.List"%>
<html lang="en">
  <jsp:include page="../static/header.jsp"></jsp:include>

<head>

</head>
<body>

<%
List<LeadAcqTypes> sourceTypes = (List<LeadAcqTypes>)request.getAttribute("LeadSourceTypes");
String userType = (String) session.getAttribute("UserType");

LeadForm lead = (LeadForm)request.getAttribute("lead");

	boolean adm_man = userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString());

%>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <div class="card">
                    <div class="card-header">
                        <h2 class="text-center">EDIT LEAD</h2>
                    </div>
                    <div class="card-body">

                        <form action="LeadEditSubmit.htm" method="post">

                            <div class="form-group">
                                <label for="fullname">Full Name <span class="mandatory">*</span></label>
                                <input type="text" class="form-control" id="fullname" name="name" value="<%=lead.getLeadName() %>" required>
                            </div>

                            <div class="form-group">
                                <label for="phoneNo">Phone Number <span class="mandatory">*</span></label>
                                <input type="tel" class="form-control" id="phoneNo" name="phno" value="<%=lead.getLeadPhoneNo() %>"  required pattern="[0-9]{10}" placeholder="1234567890">
                            </div>
                            
                             <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" <%if(lead.getLeadEmail()!=null && !StringUtils.isEmpty(lead.getLeadEmail())){ %>value="<%=lead.getLeadEmail() %>" <%} %>>
                            </div>

                            <div class="form-group">
                                <label for="location">Location:</label>
                                <input type="text" class="form-control" id="location" name="location" value="<%=lead.getLeadLocation() %>" >
                            </div>

                            
                            <% LeadAcqTypes sourcetypeset = null; %>
                            <div class="form-group">
                                <label for="source">Source:<span class="mandatory">*</span></label> <br>
                                <select  class="form-control selectpicker" name="source" required id="lead_source" data-size="auto" data-live-search="true" data-container="body">
                                    <%for(LeadAcqTypes sourcetype : sourceTypes){ %>
                                    	<option value="<%=sourcetype.getLeadAcqCode()%>"  data-supporting-value="<%=sourcetype.getReferalType()%>"
                                    	<%if(sourcetype.getLeadAcqCode().equalsIgnoreCase(lead.getLeadAcqCode())){ %> selected<%sourcetypeset =sourcetype; } %> ><%=sourcetype.getLeadAcqType() %></option>
                                    <%} %>
                                </select>
                            </div>
                            <div class="row" style=" padding: 5px; <%if(sourcetypeset.getReferalType()==0){%>display:none; <%}else{ %> <%} %>" id="source_ref_by">
					   			<div class="col-md-12">
						   			<label>Referred By<span class="mandatory">*</span></label>
						   			<input type="text" class="form-control" name="refered_by" id="reffered_by" maxlength="100"
						   			 onblur="this.value=this.value.trim();" <%if(lead.getReferedBy()!=null && !StringUtils.isEmpty(lead.getReferedBy())){ %> value="<%=lead.getReferedBy() %>" <%} %> >
					   			</div>
							</div>
                            
                            
                            <div class="form-group">
                                <label for="source">Bound:<span class="mandatory">*</span></label> <br>
                                <select  class="form-control " name="bound" required>
                                    <option value="InBound" <%if("InBound".equalsIgnoreCase(lead.getBound())){ %> selected<%} %> >In Bound</option>
                                    <option value="OutBound" <%if("OutBound".equalsIgnoreCase(lead.getBound())){ %> selected<%} %> >Out Bound</option>
                                </select>
                            </div>
                      		<%if(adm_man){ %>
	                      		<%if(lead.getConvertedToCustomer()==0){ %>
	                            	<button type="submit" name="lead_id" value="<%=lead.getLeadId() %>" class="btn btn-sm update-btn btn-block" onclick="return confirm('Are you sure to Submit?')">Update</button>
								<%} %>
							<%} %>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>

</body>


<script type="text/javascript">

$(document).ready(function() {

	var referred_by = '<%if(lead.getReferedBy()!=null && !StringUtils.isEmpty(lead.getReferedBy())){%><%=lead.getReferedBy()%><%}%>';
	  // Event listener for select change
	  $("#lead_source").on('changed.bs.select', function(e, clickedIndex, isSelected, previousValue) {
	    // Get selected options
	    var selectedOptions = $(this).find('option:selected');

		if(selectedOptions.data('supporting-value')===1){
            $("#reffered_by").attr('required', 'required');
            $("#source_ref_by").css("display", "block");
            $("#reffered_by").val(referred_by);
         } else {
 			$("#reffered_by").removeAttr('required')
            $("#source_ref_by").css("display", "none");
 			$("#reffered_by").val("");
         }
	  });
	});


</script>

</html>