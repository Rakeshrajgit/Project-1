<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<script>
src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
crossorigin="anonymous"
</script>

<!-- <script

src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"

integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"

crossorigin="anonymous"></script> -->

<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"

integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"

crossorigin="anonymous"></script> -->
<title>Home page</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">

<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav me-auto mb-2 mb-lg-0">
<li class="nav-item dashboard"><a class="nav-link dropdown-toggle" href="#" id="navbarDashboard" role="button" data-bs-toggle="dashboard" aria-expanded="false" style="font-size: 20px;">DashBoard </a>
    <!-- <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
<li><a class="dropdown-item" href="#">Action</a></li>
<li><a class="dropdown-item" href="#">Another action</a></li>
<li><hr class="dropdown-divider"></li>
<li><a class="dropdown-item" href="#">Something else here</a></li>
</ul> --></li>

<div class="collapse navbar-collapse" id="navbarSupportedContent">

<ul class="navbar-nav me-auto mb-2 mb-lg-0">
<li class="nav-item dashboard"><a class="nav-link dropdown-toggle" href="#" id="navbarDashboard" role="button" data-bs-toggle="dashboard" aria-expanded="false" style="font-size: 20px;">Lead </a>
<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
<li><a class="dropdown-item" href="#">Action</a></li>
<li><a class="dropdown-item" href="#">Another action</a></li>
<li><hr class="dropdown-divider"></li>
<li><a class="dropdown-item" href="#">Something else here</a></li>
</ul>
</li>
</ul>
&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp
<div >
<form class="d-flex" id="sear">
<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" >
<button class="btn btn-outline-success" type="submit">Search</button>
</form>
</div>
</div>
</div>
</nav>

<form action="">
<!-- <header> -->

  <label id="two" > Lead Stage :</label> <select><option>All</option></select> &nbsp &nbsp
  <label id="two">Lead Source :</label><select><option>All</option></select> &nbsp &nbsp

  <label id="two">Owner :</label><select><option>All</option></select>

&nbsp &nbsp

<label id="two">Data Rage :</label><select><option>All</option></select> &nbsp

&nbsp
<select><option>All Time</option></select> &nbsp &nbsp<br>

 

<br> 
<input type="checkbox" id="lead_name" name="lead name" style="box-sizing:5%;">

<label id="o">Lead Name </label>
<label id="one">Lead Source </label>
<label id="one">Lead Stage</label>
<label id="one">Owner</label>


<div class="w3-dropdown-hover">
    <a class="w3-button w3-white" style="font-size: 20px;">Modified On &#8595;</a>
    <div class="w3-dropdown-content w3-bar-block w3-border">
    <a href="#" class="w3-bar-item w3-button">Link 1</a>
    <a href="#" class="w3-bar-item w3-button">Link 2</a>
    <a href="#" class="w3-bar-item w3-button">Link 3</a>
    </div>



</form>

</body>
<style>

    *
    {
margin-left: 2%;
    }
    #two
    {
        font-size: 18px;
    }
    #lead_name
    {
        margin-left: 2%;
       
    }
    #o
    {
        font-size: 20px;
    }
   #one
    {
        font-size: 20px;
        margin-left: 6%;
    }
    .header {
    background-color: #1f384a;
    padding: 20px;
    color: #fff;
    text-align: center;
    background-image: url("path/to/your/image.jpg");
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    }
    
    .w3-container
    {
    float:right;
    color: windowtext;
    }
    
    .text
    {
    font-weight: 900;   
    }

    </style>
    
</html>


