<%@page import="com.main.model.LeadStates"%>
<%@page import="com.main.model.LeadForm"%>
<%@page import="com.main.model.CustomerStates"%>
<%@page import="org.hibernate.usertype.UserType"%>
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
    List<CrmUser> adminList = (List<CrmUser>)request.getAttribute("AdminList");
	String userType = (String)request.getAttribute("userType");
%>

	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>User List</h5>
			</div>
				<div class="col-md-9 ">
					<ol class="breadcrumb">
						<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
						<li class="breadcrumb-item active " aria-current="page">Users List</li>
					</ol>
				</div>
			</div>
	</div>	
	<div class="page card dashboard-card">
	
	<div class="card-body" >
	
	
		<%@ include file="../static/successFailureMsg.jsp" %>
		<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString()) || userType.equalsIgnoreCase(UserTypes.ROLE_ADMIN.toString())|| userType.equalsIgnoreCase(UserTypes.ROLE_AGENT.toString())){ %>
		
		<form action="AddUser.htm" method="get" style="float: right;">
              <input type="submit" class="btn btn-sm add-btn" value="Add">
        </form>
		
		<% } %>

		<form action="UserList.htm" method="get">
		    <div class="LeadStage">
		        
	
		    </div>
		</form>
	<form action="UserList.htm" method="get">
		<table class="table table-striped">
		
		  <tr>
		  		<th>SN</th>
		  		<th>UserId</th>
		  		<th>UserName</th>
		        <th>UserEmail</th>
		        <th>Update</th>
		        <th>Delete</th>
		    <tr>
		    
		      <% 
				int i=1;
				for(CrmUser user : adminList)
				{
			%>
				
				<tr>
				 	<td><%=i++ %></td>
				 	<td><%=user.getUserId()%></td>
					<td><%=user.getUserName()%></td>
					<td><%=user.getUserEmail()%></td>
					<td><button type="submit" class="btn btn-sm update-btn" name="userId" value="<%=user.getUserId()%>" formmethod="get" formaction="updatingUser.htm" >Update</button></td>
					<td><button type="submit" class="btn btn-sm delete-btn" name="userId" value="<%=user.getUserId()%>" formmethod="get" formaction="deleteUser.htm" onclick="return confirm('Are you sure to Delete?')">Delete</button></td>	
		        </tr>
			<%}%>
		        
		        
		        	

		</table>
		
		</form>
		
	</div>

</div>

</body>
</html>