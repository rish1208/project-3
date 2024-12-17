

<%@page import="in.co.rays.project_3.controller.StockAnalysisCtl"%>

<%@page import="in.co.rays.project_3.controller.PortfolioManagementCtl"%>
<%@page import="java.util.Map"%>

<%@page import="java.util.List"%>

<%@page import="java.util.HashMap"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@page import="in.co.rays.project_3.controller.ORSView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=ORSView.APP_CONTEXT%>/js/validateInput.js"></script>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>StockAnalysis view</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%=ORSView.APP_CONTEXT%>/js/utility.js"></script>

<script type="text/javascript">
	function validateMobileNo(event) {
		const input = event.target;
		input.value = input.value.replace(/[^0-9.]/g, '')
		if (input.value.length > 0 && input.value[0] <= '5') {
			input.value = '';
		}
	}
</script>

<script type="text/javascript">
	function numberLength(input) {
		if (input.value.length > 10) {
			input.value = input.value.slice(0, 10);
		}
	}
</script>

<script type="text/javascript">
function validateMinLength(inputElement, errorElementId) {
    const minLength = 2; // Minimum length allowed
    const value = inputElement.value.trim(); // Trim spaces from input
    const errorElement = document.getElementById(errorElementId);

    if (value.length < minLength) {
        errorElement.textContent = "StockSymbol must be at least 2 characters long.";
        inputElement.classList.add("is-invalid"); // Optionally add a class for styling
    } else {
        errorElement.textContent = ""; // Clear error message
        inputElement.classList.remove("is-invalid");
    }
}

</script>

<script type="text/javascript">
function validateMaxLength(inputElement, errorElementId, maxLength) {
    const value = inputElement.value.trim(); // Trim spaces from input
    const errorElement = document.getElementById(errorElementId);

    if (value.length > maxLength) {
        errorElement.textContent = `StockSymbol must not exceed ${maxLength} characters.`;
        inputElement.classList.add("is-invalid"); // Optionally add a class for styling
        inputElement.value = value.slice(0, maxLength); // Trim the input to maxLength
    } else {
        errorElement.textContent = ""; // Clear error message if within limit
        inputElement.classList.remove("is-invalid");
    }
}

</script>

<style type="text/css">
i.css {
	border: 2px solid #8080803b;
	padding-left: 10px;
	padding-bottom: 11px;
	background-color: #ebebe0;
}

.input-group-addon {
	box-shadow: 9px 8px 7px #001a33;
	background-image: linear-gradient(to bottom right, purple, white);
	background-repeat: no repeat;
	background-size: 100%;
	padding-bottom: 11px;
}

.hm {
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/download (3).jpeg');
	background-size: cover;
	padding-top: 6%;
}
</style>

</head>
<body class="hm">
	<div class="header">
		<%@include file="Header.jsp"%>
		<%@include file="calendar.jsp"%>
	</div>
	<div>

		<main>
		<form action="<%=ORSView.STOCKANALYSIS_CTL%>" method="post">
			<jsp:useBean id="dto" class="in.co.rays.project_3.dto.StockAnalysisDTO"
				scope="request"></jsp:useBean>
			<div class="row pt-3">
				<!-- Grid column -->
				<div class="col-md-4 mb-4"></div>
				<div class="col-md-4 mb-4">
					<div class="card input-group-addon">
						<div class="card-body">

							<%
								long id = DataUtility.getLong(request.getParameter("id"));

								if (dto.getId() != null && id > 0) {
							%>
							<h3 class="text-center default-text text-primary">Update
								Stock</h3>
							<%
								} else {
							%>
							<h3 class="text-center default-text text-primary">Add Stock</h3>
							<%
								}
							%>
							<!--Body-->
							<div>

								<%
								Map map = (Map) request.getAttribute("analysisTypeee");
								%>



								<H4 align="center">
									<%
										if (!ServletUtility.getSuccessMessage(request).equals("")) {
									%>
									<div class="alert alert-success alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<%=ServletUtility.getSuccessMessage(request)%>
									</div>
									<%
										}
									%>
								</H4>

								<H4 align="center">
									<%
										if (!ServletUtility.getErrorMessage(request).equals("")) {
									%>
									<div class="alert alert-danger alert-dismissible">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<%=ServletUtility.getErrorMessage(request)%>
									</div>
									<%
										}
									%>

								</H4>

								<input type="hidden" name="id" value="<%=dto.getId()%>">

							</div>

							<div class="md-form">

								<span class="pl-sm-5"><b> StockSymbol</b> <span
									style="color: red;">*</span></span> </br>
								<div class="col-sm-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-user-alt grey-text" style="font-size: 1rem;"></i>
											</div>
										</div>
										<input type="text" name="stockSymbol"   placeholder="Enter StockSymbol"
											class="form-control"
											
											 oninput="validateMinLength(this, 'stockSymbolError'); validateMaxLength(this, 'stockSymbolError', 5)"
                                                        onblur="validateMinLength(this, 'stockSymbolError')"
											
									oninput="handleAlphaNumInput(this, 'stockSymbolError', 25)"
											onblur="handleAlphaNumInput(this, 'stockSymbolError', 25)"
											
												value="<%=DataUtility.getStringData(dto.getStockSymbol())%>">


									</div>
								</div>

								<font color="red" class="pl-sm-5" id="stockSymbolError"> <%=ServletUtility.getErrorMessage("stockSymbol", request)%></font></br>
                             
                             
                             <span class="pl-sm-5"><b>StartDate</b> <span
									style="color: red;">*</span></span></br>
								<div class="col-sm-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-calendar grey-text" style="font-size: 1rem;"></i>
											</div>
										</div>
										<input type="text" id="datepicker" name="startDate"
										class="form-control" placeholder="Enter StartDate"
										readonly="readonly"
										value="<%=DataUtility.getDateString(dto.getStartDate())%>">


									</div>

								</div>
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("startDate", request)%></font></br>

                         <span class="pl-sm-5"><b>EndDate</b> <span
									style="color: red;">*</span></span></br>
								<div class="col-sm-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-calendar grey-text" style="font-size: 1rem;"></i>
											</div>
										</div>
										<input type="text" id="datepicker1" name="endDate"
										class="form-control" placeholder="Enter EndDate"
										readonly="readonly"
										value="<%=DataUtility.getDateString(dto.getEndDate())%>">


									</div>

								</div>
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("endDate", request)%></font></br>

                        
										
										
										
										 
											<span class="pl-sm-5"><b>AnalysisType</b> <span
									style="color: red;">*</span></span></br>
								<div class="col-sm-12">
									<div class="input-group">
										<div class="input-group-prepend">
											<div class="input-group-text">
												<i class="fa fa-user-circle grey-text"
													style="font-size: 1rem;"></i>
											</div>
										</div>


										<%=HTMLUtility.getList1("analysisType", String.valueOf(dto.getAnalysisType()), map)%>

									</div>
								</div>
								<font color="red" class="pl-sm-5"> <%=ServletUtility.getErrorMessage("analysisType", request)%></font></br>

											
										

								


								<%-- 
								<%
								if (dto.getId()==null||id<=0) {
								%> --%>





								<%
									if (dto.getId() != null && id > 0) {
								%>

								<div class="text-center">

									<input type="submit" name="operation"
										class="btn btn-success btn-md" style="font-size: 17px"
										value="<%=StockAnalysisCtl.OP_UPDATE%>"> <input type="submit"
										name="operation" class="btn btn-warning btn-md"
										style="font-size: 17px" value="<%=StockAnalysisCtl.OP_CANCEL%>">

								</div>
								<%
									} else {
								%>
								<div class="text-center">

									<input type="submit" name="operation"
										class="btn btn-success btn-md" style="font-size: 17px"
										value="<%=StockAnalysisCtl.OP_SAVE%>"> <input type="submit"
										name="operation" class="btn btn-warning btn-md"
										style="font-size: 17px" value="<%=StockAnalysisCtl.OP_RESET%>">
								</div>

							</div>
							<%
								}
							%>
						</div>
					</div>
		</form>
		</main>
		<div class="col-md-4 mb-4"></div>

	</div>

</body>
<%@include file="FooterView.jsp"%>

</body>
</html>
