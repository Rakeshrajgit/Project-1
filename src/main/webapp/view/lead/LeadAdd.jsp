<!DOCTYPE html>
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


%>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <div class="card">
                    <div class="card-header">
                        <h2 class="text-center">ADD LEAD</h2>
                    </div>
                    <div class="card-body">

                        <form action="LeadAddSubmit.htm" method="post">

                            <div class="form-group">
                                <label for="fullname">Full Name <span class="mandatory">*</span></label>
                                <input type="text" class="form-control" id="fullname" name="name" required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email <span class="mandatory">*</span></label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>

                            <div class="form-group">
                                <label for="phoneNo">Phone Number <span class="mandatory">*</span></label>
                                <input type="tel" class="form-control" id="phoneNo" name="phno" required pattern="[0-9]{10}" placeholder="1234567890">
                            </div>

                            <div class="form-group">
                                <label for="location">Location:</label>
                                <input type="text" class="form-control" id="location" name="location">
                            </div>

                            <div class="form-group">
                                <label for="source">Source:<span class="mandatory">*</span></label> <br>
                                <select  class="form-control " name="source" required>
                                    <%for(LeadAcqTypes sourcetype : sourceTypes){ %>
                                    	<option value="<%=sourcetype.getLeadAcqCode()%>"><%=sourcetype.getLeadAcqType() %></option>
                                    <%} %>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="source">Bound:<span class="mandatory">*</span></label> <br>
                                <select  class="form-control " name="bound" required>
                                    <option value="InBound">In Bound</option>
                                    <option value="OutBound">Out Bound</option>
                                </select>
                            </div>
                            <%if(!(userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()))){ %>
                            
                            <div class="form-group">
								<div class="row">
									<div class="col-md-12">
										<input type="checkbox" name="assign_self" value="yes"><span style="font-weight: 600;">&nbsp;&nbsp;&nbsp; Assign to Self</span>
									</div>
								</div>
							</div>
							<%} %>
                            <button type="submit" class="btn btn-primary btn-block">ADD</button>

                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
</html>