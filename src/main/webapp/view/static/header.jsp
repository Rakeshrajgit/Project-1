<%@page import="java.util.Map"%>
<%@page import="com.main.model.CrmUser"%>
<%@page import="com.main.dto.AccessControlDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.time.LocalDate"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">

<title>CRM</title>

<jsp:include page="dependancy.jsp"></jsp:include>

<spring:url value="../../webresources/css/Header.css" var="Header" />
<link href="${Header}" rel="stylesheet" />

<style type="text/css">
.badge-counter {
	position: absolute;
	transform: scale(.8);
	transform-origin: top right;
	margin-left: -1.0rem;
	margin-top: -.25rem;
	background: red;
	font-family: 'Lato', sans-serif;
}

.custom-button {
	background-color: #0E6FB6;;
	color: white !important;
	font-weight: 100 !important;
}

.bg-transparent {
	background-color: transparent;
	text-transform: capitalize;
	color: white;
	font-weight: 100;
	padding: 4px 7px;
}

.onclickbell {
	margin: 0px 0px 0px 10px;
}

.logoutdivider {
	margin: 0px !important
}

.logout a {
	font-size: 14px !important;
	font-weight: 800 !important;
}
</style>

<style type="text/css">
@media ( min-width : 992px) {
	.dropdown-menu .dropdown-toggle:after {
		border-top: .3em solid transparent;
		border-right: 0;
		border-bottom: .3em solid transparent;
		border-left: .3em solid;
	}
	.dropdown-menu .dropdown-menu {
		margin-left: 0;
		margin-right: 0;
	}
	.dropdown-menu li {
		position: relative;
	}
	.nav-item .submenu {
		display: none;
		position: absolute;
		left: 100%;
		top: -7px;
	}
	.nav-item .submenu-left {
		right: 100%;
		left: auto;
	}
	.dropdown-menu>li:hover {
		background-color: #f1f1f1
	}
	.dropdown-menu>li:hover>.submenu {
		display: block;
	}
}
</style>


</head>

<body>
	<%
	String UserType = (String) session.getAttribute("UserType");
	List<AccessControlDto> accessUrls = (List<AccessControlDto>) session.getAttribute("UrlList");
	Map<Long,String> modules = (Map<Long,String>) session.getAttribute("ModulesList");
	CrmUser crmUser = (CrmUser) session.getAttribute("user");
	%>


	<div class="wrapper">


		<div id="content">
			<nav class="navbar navbar-expand-lg navbar-light" style="padding: 0.1rem 0.5rem !important;">
				<div class="container-fluid">
					<b style="font-family: Montserrat, sans-serif; font-size: 19px; color: #ffffff"> &nbsp; CRM &nbsp;</b>
					<span style="margin-bottom: -10px;"> 
						<span id="p1" style="font-family: Lato, sans-serif; font-size: 12px; font-weight: 700; color: orange;"></span>
						<span style="font-family: Lato, sans-serif; font-size: 12px; padding: 0px 0px 0px 5px; text-transform: capitalize !important; color: white;"><%=LocalDate.now().getMonth().toString().substring(0, 3)%> <%=LocalDate.now().getYear()%> </span>
					</span>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto ">
							<li class="nav-item active">
								<a class=" btn bg-transparent custom-button " href="Dashboard.htm" type="button" aria-haspopup="true" aria-expanded="false" style="background-color: transparent" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Home">
									<i class="fa fa-home" aria-hidden="true"></i>
								</a> 	
							</li>

							<li class="nav-item dropdown">
								<ul class="navbar-nav" id="module">
									<%for(Map.Entry<Long, String> module : modules.entrySet()){ %>
									<li class="nav-item dropdown uppernav " style="padding: 0rem 0.5rem">
										<button type="button" class="btn dropdown-toggle custom-button" value="1_undefined" id="header-btn-1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" ><%=module.getValue() %></button>
										
										
										<div class="dropdown-menu dropdown-menu-right " id="scheduledropdown1" style="width:13rem">
											<%for(AccessControlDto urls :  accessUrls){
												if(urls.getFormModuleId().equals(module.getKey())){%>
													<a class="dropdown-item" href="<%=urls.getFormUrl() %>"><%=urls.getFormName() %></a>
												<%}
											}%>
										</div>
									</li>
									<%} %>
								</ul>
							</li>
						</ul>
 
						<div class="btn-group ">

							<a class="nav-link  onclickbell" style="padding: 0.25rem 0.5rem;" href="" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
								<img alt="logo" src="images/alarm.png"> 
								<span class="badge badge-danger badge-counter" id="NotificationCount"></span>
								<i class="fa fa-caret-down " aria-hidden="true" style="color: #ffffff"></i>
							</a>
							<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in custombell" aria-labelledby="alertsDropdown" style="width: 400px; padding: 0px; margin-top: 6px;">
								<span class="dropdown-header" style="background-color: #faa51e; font-size: 16px; color: #145374; margin-top: -1px; border-top-left-radius: 3px; border-top-right-radius: 3px; font-weight: 700">
									<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;&nbsp;&nbsp;Notifications
								</span>


								<div id="Notification"></div>
								<a class="dropdown-item text-center small text-gray-500 showall" href="#" style="height: 30px; font-size: 13px; color: black;">Show
									All Alerts</a>
							</div>
						</div>




						<div class="btn-group">
							<button type="button" class="btn btn-link btn-responsive"
								style="text-decoration: none !important" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								<img alt="logo" src="images/myacc.png" style=""> <span
									style="font-weight: 700; color: white;">&nbsp;<%=crmUser.getUserId()%></span>
								<i class="fa fa-caret-down " aria-hidden="true"
									style="padding-left: 5px; color: #ffffff"></i>
							</button>

							<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in logout" aria-labelledby="userDropdown">

								<a class="dropdown-item" href="#">
									<i class="fa-solid fa-user"></i> &nbsp;&nbsp;Hi <%=crmUser.getUserName()%>!! </a>
								<div class="dropdown-divider logoutdivider"></div>
								<a class="dropdown-item" href="#"> 
									&nbsp;&nbsp;<i class="fa fa-history" aria-hidden="true" style="color: purple"></i> &nbsp;&nbsp;Audit Stamping
								</a>
								<div class="dropdown-divider logoutdivider"></div>
								<a class="dropdown-item" href="#">
									&nbsp;<i class="fa fa-key" aria-hidden="true" style="color: cornflowerblue"></i> &nbsp;&nbsp;Change Password
								</a>
								<div class="dropdown-divider logoutdivider"></div>

								<form method="POST" action="${pageContext.request.contextPath}/logout">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<button class="dropdown-item " style="font-weight: 700">
										&nbsp; <i class="fa fa-sign-out fa-1.5x" aria-hidden="true" style="color: #B20600"></i> &nbsp;&nbsp;Logout
									</button>
								</form>

							</div>
						</div>
					</div>
				</div>
			</nav>

<script type="text/javascript">

$(document).ready(function() {
	
	function english_ordinal_suffix(dt)
	{
	  return dt.getDate()+(dt.getDate() % 10 == 1 && dt.getDate() != 11 ? 'st' : (dt.getDate() % 10 == 2 && dt.getDate() != 12 ? 'nd' : (dt.getDate() % 10 == 3 && dt.getDate() != 13 ? 'rd' : 'th'))); 
	}
	
	dt= new Date();
	document.getElementById("p1").innerHTML = english_ordinal_suffix(dt);
	
});

</script>
</body>

</html>