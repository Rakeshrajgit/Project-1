<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="insertCustomer" method="post">

<label>Application No</label><br>
<input type="hidden" name="appno"><br>

<label>FullName</label><br>
<input type="text" name="fname"><br>

<label>Email</label><br>
<input type="email" name="email"><br>

<label>Phone No</label><br>
<input type="text" name="phone"><br>

<input type="submit" value="Enroll">

</form>

</body>
</html>