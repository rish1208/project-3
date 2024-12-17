
<%@page import="in.co.rays.project_3.controller.LoginCtl"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@page import="in.co.rays.project_3.controller.LoginCtl"%>
<%@page import="in.co.rays.project_3.dto.RoleDTO"%>
<%@page import="in.co.rays.project_3.dto.UserDTO"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Header</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.reg {
	background-image: linear-gradient(to bottom right, yellow, grey);
}
</style>
</head>
<body>
	<%
		UserDTO userDto = (UserDTO) session.getAttribute("user");

		boolean userLoggedIn = userDto != null;

		String welcomeMsg = "Hi, ";

		if (userLoggedIn) {
			String role = (String) session.getAttribute("role");
			welcomeMsg += userDto.getFirstName() + " (" + role + ")";
		} else {
			welcomeMsg += "Guest";
		}
	%>
	<div class="header">


		<nav class="navbar navbar-expand-lg reg fixed-top"> <a
			class="navbar-brand" href="<%=ORSView.WELCOME_CTL%>"><img
			src="<%=ORSView.APP_CONTEXT%>/img/custom.png" width="190px"
			height="50px"></a>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">

			<span class="navbar-toggler-icon"> <i class="fas fa-bars"
				style="color: #fff; font-size: 28px;"></i></span>

		</button>

		<div class="collapse navbar-collapse" id="navbarNav">

			<ul class="nav navbar-nav ml-auto">

				<a class="nav-link" href="#"> <span class="sr-only">(current)</span>
				</a>
				<%
					if (userLoggedIn) {
				%>
				<%
					if (userDto.getRoleId() == RoleDTO.STUDENT) {
				%>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Marksheet</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<li><a class="dropdown-item"
							href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><i
								class=" far fa-file-alt"></i>Marksheet Merit List</a>
					</div></li>



				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">User</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<li><a class="dropdown-item"
							href="<%=ORSView.MY_PROFILE_CTL%>"><i class="fas fa-user-tie"></i>My

								Profile</a> <a class="dropdown-item"
							href="<%=ORSView.CHANGE_PASSWORD_CTL%>"><i
								class=" fa fa-file-alt"></i>Change Password</a>
					</div></li>

				<%
					} else if (userDto.getRoleId() == RoleDTO.ADMIN) {
				%>



				<li class="nav-item dropdown" style="padding-left: 5px;"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">User</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.USER_CTL%>"><i
							class="fas fa-user-circle"></i>Add User</a> <a class="dropdown-item"
							href="<%=ORSView.USER_LIST_CTL%>"><i
							class="fas fa-user-friends"></i>User List</a>
					</div></li>



				<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Marksheet

					</font></a>


					<div class="dropdown-menu" aria-labelledby="navbarDropdown">



						<a class="dropdown-item" href="<%=ORSView.MARKSHEET_CTL%>"><i
							class="far fa-file"></i>Add Marksheet</a> <a class="dropdown-item"
							href="<%=ORSView.MARKSHEET_LIST_CTL%>"><i
							class="fas fa-paste"></i>Marksheet List</a> <a class="dropdown-item"
							href="<%=ORSView.MARKSHEET_MERIT_LIST_CTL%>"><i
							class=" far fa-file-alt"></i>Marksheet Merit List </a> <a
							class="dropdown-item" href="<%=ORSView.GET_MARKSHEET_CTL%>"><i
							class="far fa-copy"></i>Get Marksheet</a>

					</div></li>



				<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Role</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.ROLE_CTL%>"><i
							class="fas fa-user-tie"></i>Add Role</a> <a class="dropdown-item"
							href="<%=ORSView.ROLE_LIST_CTL%>"><i
							class="fas fa-user-friends"></i>Role List</a>

					</div></li>

				<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">College</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.COLLEGE_CTL%>"><i
							class="fas fa-university"></i>Add College</a> <a
							class="dropdown-item" href="<%=ORSView.COLLEGE_LIST_CTL%>"><i
							class="fas fa-building"></i>College List </a>

					</div></li>

				<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Course

					</font></a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.COURSE_CTL%>"><i
							class="fas fa-book-open"></i>Add Course</a> <a class="dropdown-item"
							href="<%=ORSView.COURSE_LIST_CTL%>"><i
							class="fas fa-sort-amount-down"></i>Course List </a>

					</div></li>

				<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Student</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.STUDENT_CTL%>"><i
							class="far fa-user-circle"></i>Add Student</a> <a
							class="dropdown-item" href="<%=ORSView.STUDENT_LIST_CTL%>"><i
							class="fas fa-users"></i>Student List</a>

					</div></li>

				<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Faculty

					</font></a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.FACULTY_CTL%>"><i
							class="fas fa-user-tie"></i>Add Faculty</a> <a class="dropdown-item"
							href="<%=ORSView.FACULTY_LIST_CTL%>"><i class=" fas fa-users"></i>Faculty

							List</a>

					</div></li>



				<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Time

							Table</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.TIMETABLE_CTL%>"><i
							class="fas fa-clock"></i>Add TimeTable</a> <a class="dropdown-item"
							href="<%=ORSView.TIMETABLE_LIST_CTL%>"><i
							class="far fa-clock"></i>TimeTable List</a>


					</div></li>

				<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Subject</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.SUBJECT_CTL%>"><i
							class="fas fa-calculator"></i>Add Subject</a> <a
							class="dropdown-item" href="<%=ORSView.SUBJECT_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Subject List

						</a>

					</div></li>
					
					

    
				<%-- <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Vehicle</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.VEHICLE_TRACKING_CTL%>"><i
							class="fas fa-calculator"></i>Add Vehicle</a> <a
							class="dropdown-item" href="<%=ORSView.VEHICLE_TRACKING_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Vehicle List

						</a>

					</div></li>
     --%>
     
     
     <%-- <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Owner</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.OWNER_CTL%>"><i
							class="fas fa-calculator"></i>Add Owner</a> <a
							class="dropdown-item" href="<%=ORSView.OWNER_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Owner List

						</a>

					</div></li> --%>
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Job</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.JOB_CTL%>"><i
							class="fas fa-calculator"></i>Add Job</a> <a
							class="dropdown-item" href="<%=ORSView.JOB_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Job List

						</a>

					</div></li>
     --%>
    
    <%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Product</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.PRODUCT_CTL%>"><i
							class="fas fa-calculator"></i>Add Product</a> <a
							class="dropdown-item" href="<%=ORSView.PRODUCT_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Product List

						</a>

					</div></li>
     --%>
    
   <%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">salary</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.SALARY_CTL%>"><i
							class="fas fa-calculator"></i>Add Salary</a> <a
							class="dropdown-item" href="<%=ORSView.SALARY_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Salary List

						</a>

					</div></li> --%>
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Employee</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.EMPLOYEE_CTL%>"><i
							class="fas fa-calculator"></i>Add Employee</a> <a
							class="dropdown-item" href="<%=ORSView.EMPLOYEE_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Employee List

						</a>

					</div></li> --%>
					
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Order</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.ORDER_CTL%>"><i
							class="fas fa-calculator"></i>Add Order</a> <a
							class="dropdown-item" href="<%=ORSView.ORDER_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Order List

						</a>

					</div></li> --%>
					
     
      <%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Issue</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.ISSUE_CTL%>"><i
							class="fas fa-calculator"></i>Add Issue</a> <a
							class="dropdown-item" href="<%=ORSView.ISSUE_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Issue List

						</a>

					</div></li>
      --%>
      
     <%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Project</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.PROJECT_CTL%>"><i
							class="fas fa-calculator"></i>Add Project</a> <a
							class="dropdown-item" href="<%=ORSView.PROJECT_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Project List

						</a>

					</div></li> --%>
					
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Loan</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.LOAN_CTL%>"><i
							class="fas fa-calculator"></i>Add Loan</a> <a
							class="dropdown-item" href="<%=ORSView.LOAN_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Loan List

						</a>

					</div></li> --%>
					
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Wish</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.WISH_CTL%>"><i
							class="fas fa-calculator"></i>Add Wish</a> <a
							class="dropdown-item" href="<%=ORSView.WISH_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Wish List

						</a>

					</div></li> --%>
					
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">PortfolioManagement</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.PORTFOLIOMANAGEMENT_CTL%>"><i
							class="fas fa-calculator"></i>Add PortfolioManagement</a> <a
							class="dropdown-item" href="<%=ORSView.PORTFOLIOMANAGEMENT_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>PortfolioManagement List

						</a>

					</div></li> --%>
					
					
					
					<%-- <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Loans</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.LOANS_CTL%>"><i
							class="fas fa-calculator"></i>Add Loans</a> <a
							class="dropdown-item" href="<%=ORSView.LOANS_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Loans List

						</a>

					</div></li> --%>
				<%-- 	
					<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Engeering</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.ENGEERING_CTL%>"><i
							class="fas fa-calculator"></i>Add Engeering</a> <a
							class="dropdown-item" href="<%=ORSView.ENGEERING_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Engeering List

						</a>

					</div></li>
					 --%>
					
					
					
					<%-- <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">StockPurchase</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.STOCKPURCHASE_CTL%>"><i
							class="fas fa-calculator"></i>Add StockPurchase</a> <a
							class="dropdown-item" href="<%=ORSView.STOCKPURCHASE_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>StockPurchase List

						</a>

					</div></li>
					 --%>
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Transactions</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.TRANSACTIONS_CTL%>"><i
							class="fas fa-calculator"></i>Add Transactions</a> <a
							class="dropdown-item" href="<%=ORSView.TRANSACTIONS_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Transactions List

						</a>

					</div></li> --%>
					 
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">StockAnalysis</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.STOCKANALYSIS_CTL%>"><i
							class="fas fa-calculator"></i>Add StockAnalysis</a> <a
							class="dropdown-item" href="<%=ORSView.STOCKANALYSIS_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>StockAnalysis List

						</a>

					</div></li>  --%>
					
					<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Trade</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.TRADE_CTL%>"><i
							class="fas fa-calculator"></i>Add Trade</a> <a
							class="dropdown-item" href="<%=ORSView.TRADE_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Trade List

						</a>

					</div></li> 
					
					
					
					<%-- <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Prescription</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.PRESCRIPTION_CTL%>"><i
							class="fas fa-calculator"></i>Add Prescription</a> <a
							class="dropdown-item" href="<%=ORSView.PRESCRIPTION_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Prescription List

						</a>

					</div></li> --%>
					
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Client</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.CLIENT_CTL%>"><i
							class="fas fa-calculator"></i>Add Client</a> <a
							class="dropdown-item" href="<%=ORSView.CLIENT_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Client List

						</a>

					</div></li> --%>
					
					<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Vechicle</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.VECHICLE_CTL%>"><i
							class="fas fa-calculator"></i>Add Vechicle</a> <a
							class="dropdown-item" href="<%=ORSView.VECHICLE_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Vechicle List

						</a>

					</div></li> --%>

    
				<%--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Patient</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.PATIENT_CTL%>"><i
							class="fas fa-calculator"></i>Add Patient</a> <a
							class="dropdown-item" href="<%=ORSView.PATIENT_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Patient List

						</a>

					</div></li> --%>
					
					<%-- <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Inventory</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.INVENTORY_CTL%>"><i
							class="fas fa-calculator"></i>Add Inventory</a> <a
							class="dropdown-item" href="<%=ORSView.INVENTORY_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Inventory List

						</a>

					</div></li> --%>
					
					<!--  <li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Docter</font> -->
<%-- 
				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.DOCTER_CTL%>"><i
							class="fas fa-calculator"></i>Add Docter</a> <a
							class="dropdown-item" href="<%=ORSView.DOCTER_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Docter List

						</a>

					</div></li>
 --%>				<%-- 	<li class="nav-item dropdown" style="padding-left: 5px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <font style="color: white;">Route</font>

				</a>

					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<a class="dropdown-item" href="<%=ORSView.ROUTE_CTL%>"><i
							class="fas fa-calculator"></i>Add Route</a> <a
							class="dropdown-item" href="<%=ORSView.ROUTE_LIST_CTL%>"> <i
							class="fas fa-sort-amount-down"></i>Route List

						</a>

					</div></li> --%>
					
					
     


				<%
					}
					}
				%>
				<li class="nav-item dropdown"
					style="padding-left: 5px; padding-right: 67px"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><font style="color: white;"><%=welcomeMsg%>
					</font></a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<%
							if (userLoggedIn) {
						%>
						<a class="dropdown-item"
							href="<%=ORSView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOG_OUT%>"><i
							class="fas fa-sign-out-alt"></i>Logout </a> <a class="dropdown-item"
							href="<%=ORSView.MY_PROFILE_CTL%>"><i class="fas fa-user-tie"></i>My
							Profile</a> <a class="dropdown-item"
							href="<%=ORSView.CHANGE_PASSWORD_CTL%>"> <i
							class="fas fa-edit"></i>Change Password
						</a> <a class="dropdown-item" target="blank"
							href="<%=ORSView.JAVA_DOC_VIEW%>"><i class="fas fa-clone"></i>Java
							Doc </a>
						<%
							} else {
						%>
						<a class="dropdown-item" href="<%=ORSView.LOGIN_CTL%>"><i
							class="fas fa-sign-in-alt"><b> Login</b></i> <a
							class="dropdown-item" href="<%=ORSView.USER_REGISTRATION_CTL%>"><i
								class="fas fa-registered"><b> User Registration</b></i></a>
					</div></li>
				<%
					}
				%>
			</ul>
		</div>
		</nav>
	</div>
</body>
</html>