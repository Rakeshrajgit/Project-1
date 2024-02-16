<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form class="form2">
<h1>Lead Add Form </h1><br>
<h3 style="text-decoration:underline blue; width:10px;" id="dtls">Details</h3>
<!-- <input type="button" class="collapsible" value="Details"/>  -->

<div class="collapsible" id="myForm">
<div class="row g-6">
  
    <div class="col">
        <lable>First Name<span>*</span></lable>
      <input type="text" class="form-control" name="fname" aria-label="First name" style="width:400px;">
    </div>

   
    <div class="col" >
        <lable>Last Name<span>*</span></lable>
      <input type="text" class="form-control" name="lname" placeholder="Last name" aria-label="Last name" style="width:400px;">
    </div>
  </div>
<br><br>
  <div class="row g-6" >
    <div class="col">
        <lable>Phone Number<span>*</span></lable>
      <input type="text" class="form-control" name="phone" placeholder="Phone number" aria-label="First name" style="width:400px;">
    </div>
    <div class="col">
        <lable>email<span>*</span></lable>
      <input type="text" class="form-control" name="email" placeholder="Email" aria-label="Last name" style="width:400px;">
    </div>
  </div>
<br><br>
<label>Note</label>
<div class="form-floating" style="height: 90px ; width:1000px;">
    
    <textarea class="form-control" name="note" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 90px ; width:1000px;"></textarea>
    
  </div>
<br><br>
  <div class="col" style="width: 500px;">
    <lable>Lead Source<span>*</span></lable>
    <input type="text" class="form-control" name="lsource " placeholder="Lead Source" aria-label="Last name" style="width:400px;">
  </div>


</div>
</form>


</body>
</html>