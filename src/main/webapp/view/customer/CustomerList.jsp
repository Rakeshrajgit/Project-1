<%@page import="org.hibernate.usertype.UserType"%>
<%@page import="com.main.model.CrmUser"%>
<%@page import="com.main.configs.enums.UserTypes"%>
<%@page import="java.util.List"%>
<%@page import="com.main.model.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
  <jsp:include page="../static/dependancy.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Vendor CSS Files -->
  <link href="../webresources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../webresources/assets/vendor/simple-datatables/style.css" rel="stylesheet">
 
 
 
 
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<style type="text/css">

@import url('https://fonts.googleapis.com/css2?family=Fira+Sans&family=Noto+Sans:wght@500&family=Patua+One&family=Poppins:wght@300;400&display=swap');

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
    <title>lead Stage</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
<%
 List<Customer> customerList = (List<Customer>)request.getAttribute("CustomerList");
 List<CrmUser> agents = (List<CrmUser>)request.getAttribute("Agents");
 String userType = (String)request.getAttribute("userType");

%>
  <!--  
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <li class="nav-item">
          <a class="nav-link" href="#">DashBoard</a>
        </li> &nbsp; &nbsp; &nbsp; 

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Lead
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="Lead">AddLead</a></li>
            <li><a class="dropdown-item" href="PhoneCall">Lead PhoneCall</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> &nbsp &nbsp &nbsp 

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Contact
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> &nbsp &nbsp &nbsp

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Reports
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> &nbsp &nbsp &nbsp
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>
    
<form action="CustomerList.htm" method="get">
    <div class="LeadStage">
        <div class="flex-item" >Lead Stage
            <select id="Dropdown">
                <option value="activity1">All Selected</option>
                <option value="activity2">Activity 2</option>
                <option value="activity3">Activity 3</option>
             </select>
        </div>

        <div class="flex-item"> Lead Source
            <select id="Dropdown">
                <option value="activity1">All Selected</option>
                <option value="activity2">Activity 2</option>
                <option value="activity3">Activity 3</option>
             </select>

        </div>

        <div class="flex-item">Owner
            <select id="Dropdown" name="userId" onchange="this.form.submit()">
            	<option value="" selected="selected" disabled>Select..</option>
            
             </select>
        </div>

        <div class="flex-item">Date Range
            <select id="Dropdown">
                <option value="activity1">Created On</option>
                <option value="activity2">Activity 2</option>
                <option value="activity3">Activity 3</option>
             </select>

             <select id="Dropdown">
                <option value="activity1">All Time</option>
                <option value="activity2">Activity 2</option>
                <option value="activity3">Activity 3</option>
             </select>

        </div>
    </div>

    <div class="ThirdDiv">
        <div class="flex-child item1"></div>
        <div class="flex-child item2"></div>
        <div class="flex-child item3"></div>
        <div class="flex-child item4"></div>
        <div class="flex-child item5"></div>
        <div class="flex-child item6"></div>
    </div>-->
    
    
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        
          <div class="container-fluid">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                  <a class="nav-link " href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    DASHBOARD
                  </a>
                </li>
  
  
  
          <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Lead
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="Lead">AddLead</a></li>
            <li><a class="dropdown-item" href="PhoneCall">Lead PhoneCall</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> 
  
  
  
  
               
  
                <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
                  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    LEADS
                  </a>
                  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="Lead">Add Lead</a></li>
                    <li><hr class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="PhoneCall">Lead PhoneCall</a></li>
                  
               
                  </ul>
                </li>
  
  
   <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Contact
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> 

	<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Reports
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> 

               <div class="search-bar">
                <form class="search-form d-flex align-items-center" method="POST" action="#">
                  <input type="text" name="query" placeholder="Search" title="Enter search keyword">
                  <button type="submit" title="Search"><i class="bi bi-search"></i></button>
                </form>
              </div>
              </ul>
          <div class="nav-item dropdown">
            <a class="nav-link nav-icon"  href="#" data-bs-toggle="dropdown">
              <i class="bi bi-bell"></i>
              
            </a>
          </div>

         <div class="icon">
          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-question-circle"></i></a>
          <!-- <div class="label">question-circle</div> -->
         </div>
        |
          <div class="icon" >
          <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-person-circle"></i>
          </a>
   

          
       <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">  
            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="logout.htm">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->    
           </div>
          </div> 
        </nav>

 
<form action="CustomerList.htm" method="get">
    <div class="LeadStage">
        <div class="flex-item" >Lead Stage
            <select id="Dropdown">
                <option value="activity1">All Selected</option>
                <option value="activity2">Activity 2</option>
                <option value="activity3">Activity 3</option>
             </select>
        </div>

        <div class="flex-item"> Lead Source
            <select id="Dropdown">
                <option value="activity1">All Selected</option>
                <option value="activity2">Activity 2</option>
                <option value="activity3">Activity 3</option>
             </select>

        </div>

        <div class="flex-item">Owner
            <select id="Dropdown" name="userId">
            	<option value="" disabled="disabled" selected="selected">Select..</option>
                <%for(CrmUser agent : agents ){ %>
                <option value="<%=agent.getUserId()%>"><%=agent.getUserName() %></option>
                <%} %>
             </select>

        </div>

        <div class="flex-item">Date Range
            <select id="Dropdown">
                <option value="activity1">Created On</option>
                <option value="activity2">Activity 2</option>
                <option value="activity3">Activity 3</option>
             </select>

             <select id="Dropdown">
                <option value="activity1">All Time</option>
                <option value="activity2">Activity 2</option>
                <option value="activity3">Activity 3</option>
             </select>

        </div>
    </div>

    <div class="ThirdDiv">
        <div class="flex-child item1"></div>
        <div class="flex-child item2"></div>
        <div class="flex-child item3"></div>
        <div class="flex-child item4"></div>
        <div class="flex-child item5"></div>
        <div class="flex-child item6"></div>
    </div>
    
    
<table class="table table-striped">

  <tr>
  		<td>SN</td>
  		<th>App. No</th>   
        <th>Email</th>
        <th>Lead Stage</th>
        <th>Lead Score</th>
        
        <%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())){ %>
        	<th>Owner <i class='fa fa-user' style="color:skyblue"></i> </th>
        <%} %>
        <th>Modify On <span style="color:skyblue;">&#8595;</span></th>
        <th>Actions <i class='fa fa-lock' style="color:skyblue"></i> </th>
    <tr>

	<% 
	int i=1;
	for(Customer customer : customerList)
	{
		%>
		<tr>
		 	<td><%=i++ %></td>
		 	<td><%=customer.getAppNo()%></td>
			<td><%=customer.getFullName()%></td>
			<td><%=customer.getEmail()%></td>
			<td><%=customer.getPhoneNo()%></td>
			<td><%="called"%></td>
        	<td>100</td>
        	<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())){ %>
        	<td>
        		<select id="customer-<%=customer.getAppNo() %>" name="userId" onchange="updateAgentForCustomer('<%=customer.getAppNo()%>',this.value);">
	            	<%if(userType.equalsIgnoreCase(UserTypes.ROLE_MANAGER.toString())){ %>
	            		<option value="" <%if(customer.getAgentId()==null){%> <%} %>style="color: red">UnAssigned</option>
	            	<%} %>
	                <%for(CrmUser agent : agents ){ %>
	                	<option value="<%=agent.getUserId()%>" <%if(agent.getUserId().equalsIgnoreCase(customer.getAgentId())){%> selected<% }%>><%=agent.getUserName() %></option>
	                	
	                <%} %>
             	</select>
        	</td>
        	<%} %>
			<td><%="NA"%></td>  
			<td><button type="submit" name="appNo" value="<%=customer.getAppNo() %>" formmethod="get" formaction="RedirectCustomerDetailsView.htm" >Info</button></td>
		</tr>
	<%}%>
	
</table>

</form>

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
<!-- Vendor JS Files -->
  <script src="../webresources/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../webresources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../webresources/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../webresources/assets/vendor/echarts/echarts.min.js"></script>
  <script src="../webresources/assets/vendor/quill/quill.min.js"></script>
  <script src="../webresources/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../webresources/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../webresources/assets/vendor/php-email-form/validate.js"></script>
  
  
    <!-- Template Main JS File -->
  <script src="../webresources/assets/vendor/js/main.js"></script>
</body>




</html>