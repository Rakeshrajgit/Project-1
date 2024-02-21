<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<jsp:include page="dependancy.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">


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
</head>
<body>





<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    
     
           
           
           <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
   
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
          <a class="nav-link" href="#">DashBoard</a>
        </li> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Lead
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="Lead">AddLead</a></li>
            <li><a class="dropdown-item" href="PhoneCall">Lead PhoneCall</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Contact
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Reports
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li> &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
        
    
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

       


     </div>






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
            <select id="Dropdown">
                <option value="activity1">All Selected</option>
                <option value="activity2">Activity 2</option>
                <option value="activity3">Activity 3</option>
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

  <div class="SecDiv">
        <div class="flex-item">Lead Name</div>
        <div class="flex-item">Lead Score</div>
        <div class="flex-item">Lead Stage</div>
        <div class="flex-item">Owner <i class='fa fa-user' style="color:skyblue"></i> </div>
        <div class="flex-item">Modify On <span style="color:skyblue;">&#8595;</span></div>
        <div class="flex-item">Actions  <i class='fa fa-lock' style="color:skyblue"></i> </div>
    </div>

 

<%



Connection conn=null;
Statement st=null;
ResultSet rs=null;


try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","MySQL123");
	st=conn.createStatement();
	
	//String str=request.getParameter("ID");
	String qry="select * from customer;";
	
	rs=st.executeQuery(qry);
	
	while(rs.next())
	{
		%>
		<tr>
	 <td></td>
		<td><%=    rs.getString(3) %></td>
		<td><%=10 %></td>
		<td><%="called"%></td>
		<td><%="NA"%></td>
		<td><%="NA"%></td>
		
		<td><a href="LeadInfo">Info</a></td>
		
		
		
	
		</tr>
	<%
	}
	
}
catch(Exception e){}
%>
</table>
    



</body>
</html>