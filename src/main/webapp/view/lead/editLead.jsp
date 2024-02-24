<!DOCTYPE html>
<%@page import="com.main.model.LeadForm"%>
<%@page import="com.main.model.LeadAcqTypes"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Update Page</title>

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
                        <h2 class="text-center">Update LEAD</h2>
                    </div>
                    <div class="card-body">
   
   
    <form action="${pageContext.request.contextPath}/edit/${lead.id}" method="post">
    
         <div class="form-group"> 
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${lead.leadName}" required><br>
		</div>
		
		
		<div class="form-group">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${lead.leadEmail}" required><br>
		</div>
		
		
		<div class="form-group">
        <label for="phoneNo">Phone Number:</label>
        <input type="text" id="phoneNo" name="phoneNo" value="${lead.leadPhoneNo}" required><br>
		</div>
		
		
		<div class="form-group">
        <label for="location">Location:</label>
        <input type="text" id="location" name="location" value="${lead.leadLocation}" required><br>
		</div>
		
<%-- 
		 <div class="form-group">
             <label for="source">Source:</label> <br>
               <select class="leadSource_opt" id="sourceType" name="sourceType">
                 <%for(LeadAcqTypes sourcetype : sourceTypes){ %>
                  <option value="<%=sourcetype.getLeadAcqCode()%>"><%=sourcetype.getLeadAcqType() %></option>
                     <%} %>
               </select>
         </div>
		--%>

        <button type="submit" class="btn btn-primary btn-block">Update</button>
        
        
       </form>
    
    
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
</html>