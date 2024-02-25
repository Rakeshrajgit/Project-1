<!DOCTYPE html>
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
                                <label for="email">Email <span class="mandatory">*</span></label>
                                <input type="email" class="form-control" id="email" name="email" required value="<%=lead.getLeadEmail() %>" >
                            </div>

                            <div class="form-group">
                                <label for="phoneNo">Phone Number <span class="mandatory">*</span></label>
                                <input type="tel" class="form-control" id="phoneNo" name="phno" value="<%=lead.getLeadPhoneNo() %>"  required pattern="[0-9]{10}" placeholder="1234567890">
                            </div>

                            <div class="form-group">
                                <label for="location">Location:</label>
                                <input type="text" class="form-control" id="location" name="location" value="<%=lead.getLeadLocation() %>" >
                            </div>

                            <div class="form-group">
                                <label for="source">Source:<span class="mandatory">*</span></label> <br>
                                <select  class="form-control " name="source" required>
                                    <%for(LeadAcqTypes sourcetype : sourceTypes){ %>
                                    	<option value="<%=sourcetype.getLeadAcqCode()%>" <%if(sourcetype.getLeadAcqCode().equalsIgnoreCase(lead.getLeadAcqCode())){ %> selected<%} %> ><%=sourcetype.getLeadAcqType() %></option>
                                    <%} %>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="source">Bound:<span class="mandatory">*</span></label> <br>
                                <select  class="form-control " name="bound" required>
                                    <option value="InBound" <%if("InBound".equalsIgnoreCase(lead.getBound())){ %> selected<%} %> >In Bound</option>
                                    <option value="OutBound" <%if("OutBound".equalsIgnoreCase(lead.getBound())){ %> selected<%} %> >Out Bound</option>
                                </select>
                            </div>
                      
                            <button type="submit" name="lead_id" value="<%=lead.getLeadId() %>" class="btn btn-sm update-btn btn-block" onclick="return confirm('Are you sure to Submit?')">Update</button>

                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
</html>