<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Emp Registration </title>
</head>
<body>

<form action="aa">
Name:<br>
<input type="text" name="name" >
<br><br>
Email:<br>
<input type="email" name="email">
<br><br>
Password:<br>
<input type="password" name="pwd">
<br><br>
User Type:

<select name="utype"> 
<option>choose</option>
<option name="utype">Super Admin</option>
<option name="utype">Admin</option>
<option name="utype">customer support</option>
</select >

<br><br>
<input type="submit" value="Register">

</form>
</body>
</html>