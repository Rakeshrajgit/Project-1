<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<jsp:include page="../static/dependancy.jsp"></jsp:include><html>
<head>
<meta charset="ISO-8859-1">
<title>Emp Registration </title>

</head>
<body>

<br>
<br>
<br>
<br>
<br>
<br>


 <section class="vh-100">
            <div class="container-fluid h-custom">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-md-9 col-lg-6 col-xl-5">
                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                    class="img-fluid" alt="Sample image">
                </div>
                <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                  <form action="AdminReg" method="post">
                
          
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                    <label class="form-label" for="form3Example3">Name</label>
                      <input type="text" name="name" id="form3Example3" class="form-control form-control-lg"
                        placeholder="Enter name" />
                      
                    </div>
          
                    <!-- Password input -->
                    <div class="form-outline mb-3">
                    <label class="form-label" for="form3Example4">Email</label>
                      <input type="email" name="email" id="form3Example4" class="form-control form-control-lg"
                        placeholder="Enter email" />
                      
                    </div>
                    
                    
                     <div class="form-outline mb-3">
                     <label class="form-label" for="form3Example4">Password</label>
                      <input type="password" name="pwd" id="form3Example4" class="form-control form-control-lg"
                        placeholder="Enter password" />
                      
                    </div>
                
          
                    <div class="d-flex justify-content-between align-items-center">
                      <!-- Checkbox -->
                      <div class="form-check mb-0">
                        <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
                        <label class="form-check-label" for="form2Example3">
                          Remember me
                        </label>
                      </div>
                      <a href="#!" class="text-body">Forgot password?</a>
                    </div>
                    <br>
                    <br>
                    
          
                    <div class="d-grid gap-2">
  				      <input type="submit" class="btn btn-primary" value="Register">
                    </div>
          
                  </form>
                </div>
              </div>
            </div>
            
          </section>


<br><br>
<input type="submit" value="Register">

</form>
</body>
</html>