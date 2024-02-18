
<!DOCTYPE html>
<html lang="en">
<jsp:include page="dependancy.jsp"></jsp:include>
<head>

</head>
<body>

	<header id="header" class="header fixed-top d-flex align-items-center">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a class="nav-link "
						href="Dashboard.htm" id="navbarDropdown"> DASHBOARD </a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							LEADS </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="Lead">Add Lead</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="PhoneCall">Lead
									PhoneCall</a></li>
						</ul></li>

					<li class="nav-item dropdown">
						<a class="nav-link" href="AddUser.htm" id="navbarDropdown">REGISTER</a>
					</li>

				</ul>
			
				<div class="search-bar">
					<form class="search-form d-flex align-items-center" method="POST"
						action="#">
						<input type="text" name="query" placeholder="Search"
							title="Enter search keyword">
						<button type="submit" title="Search">
							<i class="bi bi-search"></i>
						</button>
					</form>
				</div>

				<div class="nav-item dropdown">
					<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
						<i class="bi bi-bell"></i>
					</a>
				</div>

				<div class="icon">
					<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
						<i class="bi bi-question-circle"></i>
					</a>
				</div>
				|
				<div class="icon">
					<a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
						<i class="bi bi-person-circle"></i>
					</a>

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-person"></i> <span>My
									Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="logout"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul>
					<!-- End Profile Dropdown Items -->

				</div>

			</div>

		</nav>



	</header>
</body>
</html>

