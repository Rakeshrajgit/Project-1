<!DOCTYPE html>
<%@page import="com.main.model.CrmUser"%>

<%@page import="java.util.List"%>
<html lang="en">
<jsp:include page="../static/header.jsp"></jsp:include>

<head>

</head>
<body>
  
  <%
  CrmUser user = (CrmUser)request.getAttribute("user");

  %>
   
	<div class="card-header page-top">
		<div class="row">
			<div class="col-md-3">
				<h5>Edit User</h5>
			</div>
				<div class="col-md-9 ">
					<ol class="breadcrumb">
						<li class="breadcrumb-item ml-auto"><a href="Dashboard.htm"><i class=" fa-solid fa-house-chimney fa-sm"></i> Home</a></li>
						<li class="breadcrumb-item "><a href="UserList.htm">Users List</a></li>
						<li class="breadcrumb-item active " aria-current="page">Edit User</li>
					</ol>
				</div>
			</div>
	</div>	
	<div class="page card dashboard-card">
	
	<div class="card-body" >
	

    <div class="container mt-5">
      <div class="row justify-content-center">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header">
              <h4>User Edit</h4>
            </div>
            <div class="card-body">
              <form action="UserEditSubmit.htm" method="post">
                <div class="form-group">
                  <label for="username">Username</label>
                  <input type="text" class="form-control" id="username" name="username" value="<%=user.getUserName() %>" required onblur="this.value=this.value.trim()" />
                </div>
                <div class="form-group">
                  <label for="Email">Email</label>
                  <input type="email" class="form-control" id="email" name="email"  value="<%=user.getUserEmail() %>"  required onblur="return checkUserEmailAlreadyExists(this.value);" />
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" value="<%=user.getPassword() %>"  id="password" name="password" required />
                </div>
                
                
                <input type="hidden" name="userId" value="<%=user.getUserId() %>" >
         
                <input type="submit" class="btn btn-sm update-btn" value="Update" id="submit-button" />
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    
       </div>
          </div>
        
    
    
</body>
</html>