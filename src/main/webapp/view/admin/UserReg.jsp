<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.main.configs.enums.UserTypes"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Registration Page</title>
 <jsp:include page="../static/dependancy.jsp"></jsp:include>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

  <body>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h4>Registration</h4>
					</div>
					<div class="card-body">
						<form action="UserReg.htm" method="post">
							<div class="form-group">
								<label for="username">Username</label> <input type="text"
									class="form-control" id="username" name="username" required>
							</div>
							<div class="form-group">
								<label for="Email">Email</label> 
								<input type="email"
									class="form-control" id="email" name="email" required onblur="return checkUserEmailAlreadyExists(this.value);">
								<div style="color: red;visibility:hidden ;" id="email-exists-error-msg"> Email-id already exists !</div>	
								
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="password" required>
							</div>
							
						
							
							<!--  
							<div class="form-group">
								<label for="role">Role</label> 
								<select class="form-control"
									id="role" name="role" required>
									<option value="manager">Manager</option>
									<option value="csteam">Customer Support Team</option>
									<option value="user">User</option>
								</select>
							</div>
-->
							<div class="form-group">
								<label for="role">Role</label> 
								<select class="form-control" id="role" name="role" required>
									
										<%
										for (UserTypes type : UserTypes.values()) {
										%>
										<option value="<%=type.toString()%>"><%=type.getName()%></option>
										<%
										}
										%>
								</select>
								
							</div>
							<input type="submit" class="btn btn-primary" value="Register" id="submit-button" >
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<script type="text/javascript">
function checkUserEmailAlreadyExists($userEmail){
	
		
		$.ajax({

			type : "GET",
			url : "checkUserEmailAlreadyExists.htm",
			data : {
					
				userEmail : $userEmail.trim()
				
			},
			datatype : 'json',
			success : function(result) {
				
				if(!result){
					$("#submit-button").attr('disabled', 'disabled');
					$("#email-exists-error-msg").css("visibility", "visible");
				}else{
					$("#submit-button").removeAttr('disabled');
					$("#email-exists-error-msg").css("visibility", "hidden");

				}
			}
		});
		
}

</script>
</html>