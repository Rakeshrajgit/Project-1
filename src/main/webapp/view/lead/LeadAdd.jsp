<!DOCTYPE html>
<%@page import="com.main.model.LeadAcqTypes"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Register Page</title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<%
List<LeadAcqTypes> sourceTypes = (List<LeadAcqTypes>)request.getAttribute("LeadSourceTypes");

%>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">

                <div class="card">
                    <div class="card-header">
                        <h2 class="text-center">ADD LEAD</h2>
                    </div>
                    <div class="card-body">

                        <form action="addlead.htm" method="post">
                        
                        	

                            <div class="form-group">
                                <label for="fullname">Full Name:</label>
                                <input type="text" class="form-control" id="fullname" name="name" required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>

                            <div class="form-group">
                                <label for="phoneNo">Phone Number:</label>
                                <input type="tel" class="form-control" id="phoneNo" name="phno" required>
                            </div>

                            <div class="form-group">
                                <label for="location">Location:</label>
                                <input type="text" class="form-control" id="location" name="location">
                            </div>

                            <div class="form-group">
                                <label for="source">Source:</label> <br>
                                <select class="leadSource_opt" name="source" required>
                                    <%for(LeadAcqTypes sourcetype : sourceTypes){ %>
                                    	<option value="<%=sourcetype.getLeadAcqCode()%>"><%=sourcetype.getLeadAcqType() %></option>
                                    <%} %>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block">ADD</button>

                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js (Optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>