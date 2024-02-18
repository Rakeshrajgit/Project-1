<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.main.configs.enums.UserTypes"%>
<jsp:include page="../static/header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
  <head>
  </head>

  <body>
  
   
	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Add User</h5>
			</div>
				<div class="col-md-9 ">
					<ol class="breadcrumb">
						<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
						<li class="breadcrumb-item active " aria-current="page">Add User</li>
					</ol>
				</div>
			</div>
	</div>	
	<div class="page card dashboard-card">
	
	<div class="card-body" >
	
	
	<div align="center">
		<%String ses=(String)request.getParameter("result"); 
		String ses1=(String)request.getParameter("resultfail");
		if(ses1!=null){ %>
			<div class="alert alert-danger" role="alert">
				<%=ses1 %>
			</div>
			
		<%}if(ses!=null){ %>
			
			<div class="alert alert-success" role="alert">
				<%=ses %>
			</div>
		<%} %>
	</div>
  
    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header">
              <h4>User Registration</h4>
            </div>
            <div class="card-body">
              <form action="UserReg.htm" method="post">
                <div class="form-group">
                  <label for="username">Username</label>
                  <input type="text" class="form-control" id="username" name="username" required />
                </div>
                <div class="form-group">
                  <label for="Email">Email</label>
                  <input type="email" class="form-control" id="email" name="email" required onblur="return checkUserEmailAlreadyExists(this.value);" />
                  <div style="color: red; visibility: hidden" id="email-exists-error-msg" >
                    Email-id already exists !
                  </div>
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" id="password" name="password" required/>
                </div>
                <div class="form-group">
                  <label for="role">Role</label>
                  <select class="form-control" id="role" name="role" required>
                    <% for (UserTypes type : UserTypes.values()) { %>
                    <option value="<%=type.toString()%>">
                      <%=type.getName()%>
                    </option>
                    <% } %>
                  </select>
                </div>
                <input type="submit" class="btn btn-primary" value="Register" id="submit-button" />
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
    </div>
  </body>

  <script type="text/javascript">
    function checkUserEmailAlreadyExists($userEmail) {
      $.ajax({
        type: "GET",
        url: "checkUserEmailAlreadyExists.htm",
        data: {
          userEmail: $userEmail.trim(),
        },
        datatype: "json",
        success: function (result) {
          if (!result) {
            $("#submit-button").attr("disabled", "disabled");
            $("#email-exists-error-msg").css("visibility", "visible");
          } else {
            $("#submit-button").removeAttr("disabled");
            $("#email-exists-error-msg").css("visibility", "hidden");
          }
        },
      });
    }
  </script>
</html>
