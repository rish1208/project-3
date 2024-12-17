
<%@page import="in.co.rays.project_3.controller.LoansListCtl"%>
<%@page import="in.co.rays.project_3.dto.LoansDTO"%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.rays.project_3.model.ModelFactory"%>
<%@page import="in.co.rays.project_3.model.RoleModelInt"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>

<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="<%=ORSView.APP_CONTEXT%>/js/validateInput.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="<%=ORSView.APP_CONTEXT%>/js/utility.js"></script>

<title>Loans List</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js">
	<script type="text/javascript">
	function validateMobileNo(event) {
		const input = event.target;
		input.value = input.value.replace(/[^0-9.]/g, '')
		if (input.value.length > 0 && input.value[0] <= '5') {
			input.value = '';
		}
	}
</script>
<script>
function validateIntegerInput(event) {
  var char = event.which || event.keyCode;
  var input = event.target;
  
  // Allow only digits 0-9
  if (!(char >= 48 && char <= 57) && // 0-9
      char !== 8 && // backspace
      char !== 37 && // left arrow
      char !== 39 && // right arrow
      char !== 46) { // delete
    event.preventDefault();
    return false;
  }
  
  // Ensure the input length does not exceed 8 characters
  if (input.value.length >= 8 && !(char === 8 || char === 37 || char === 39 || char === 46)) {
    event.preventDefault();
    return false;
  }
}
</script>

<script>
	function validateNumberKey(event, validationMessageId) {
		// Allow only digits, minus sign, and dot for latitude and longitude input
		if (!/[0-9\.\-]/.test(event.key)) {
			// Show validation message
			var validationMsg = document.getElementById(validationMessageId);
			validationMsg.style.display = 'inline';
			event.preventDefault(); // Prevent typing the invalid character
		} else {
			// Hide validation message if input is valid
			var validationMsg = document.getElementById(validationMessageId);
			validationMsg.style.display = 'none';
		}
	}
</script>

<script>
	// Include the JavaScript function here or link to an external file
	function handleDoubleInput(inputElement, errorElementId, maxLength) {
		const errorMessage = document.getElementById(errorElementId);
		let currentValue = inputElement.value;

		// Clear existing error messages
		errorMessage.textContent = '';

		// Remove all invalid characters except digits and one decimal point
		currentValue = currentValue.replace(/[^0-9.]/g, '');

		// Check if there's more than one decimal point
		const decimalCount = (currentValue.match(/\./g) || []).length;
		if (decimalCount > 1) {
			errorMessage.textContent = 'Only one decimal point is allowed.';
			// Remove all extra decimal points
			const parts = currentValue.split('.');
			currentValue = parts[0] + '.'
					+ parts.slice(1).join('').replace(/\./g, '');
		}

		// Split the value into integer and decimal parts
		const parts = currentValue.split('.');
		let integerPart = parts[0] || '';
		let decimalPart = parts[1] || '';

		// Handle leading zeros in the integer part
		if (integerPart.length > 0 && integerPart[0] === '0'
				&& integerPart.length > 1) {
			integerPart = integerPart.replace(/^0+/, '');
		}

		// Ensure the integer part does not exceed the maxLength
		if (integerPart.length > maxLength) {
			errorMessage.textContent = `Input exceeds the maximum length of ${maxLength} digits.`;
			integerPart = integerPart.slice(0, maxLength);
			decimalPart = '';
		} else {
			// Ensure the total length of integer and decimal parts does not exceed maxLength
			const availableLengthForDecimal = maxLength - integerPart.length;
			if (decimalPart.length > availableLengthForDecimal) {
				errorMessage.textContent = `Input exceeds the maximum length of ${maxLength} digits.`;
				decimalPart = decimalPart.slice(0, availableLengthForDecimal);
			}
		}

		// Limit decimal places to two
		if (decimalPart.length > 2) {
			errorMessage.textContent = 'Only two decimal places are allowed.';
			decimalPart = decimalPart.slice(0, 2);
		}

		// Construct the final value
		inputElement.value = `${integerPart}${decimalPart ? '.' + decimalPart : ''}`;

		// Add a trailing decimal point if the input ends with one
		if (currentValue.endsWith('.')) {
			inputElement.value += '.';
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

<style>
.hm {
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/1234.jpeg');
	background-size: cover;
	background-repeat: no-repeate;
	padding-top: 6%;
}

.p1 {
	padding: 4px;
	width: 200px;
	font-size: bold;
}

.text {
	text-align: center;
}
</style>
</head>

<body class="hm">
	<%@include file="Header.jsp"%>
	<%@include file="calendar.jsp"%>
	<div></div>
	<div>
		<form class="pb-5" action="<%=ORSView.LOANS_LIST_CTL%>" method="post">
			<jsp:useBean id="dto" class="in.co.rays.project_3.dto.LoansDTO"
				scope="request"></jsp:useBean>


			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());

				List list = ServletUtility.getList(request);

				Iterator<LoansDTO> it = list.iterator();
				if (list.size() != 0) {
			%>
			<center>
				<h1 class="text-secondary font-weight-bold pt-3">
					<u>Loans List</u>
				</h1>
			</center>



			<%
				Map map = (Map) request.getAttribute("customer_idee");
			%>

			<div class="row">
				<div class="col-md-4"></div>
				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>

				<div class="col-md-4 alert alert-success alert-dismissible"
					style="background-color: #80ff80">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="#008000"><%=ServletUtility.getSuccessMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"> <%=ServletUtility.getErrorMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div class="col-md-4"></div>
			</div>
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="col-sm-2">
					<input type="text" class="form-control" name=loan_amount
						placeholder=" Enter loan_amount"
						oninput="handleIntegerInput(this, 'loan_amountError', 10)"
						onblur="validateIntegerInput(this, 'loan_amountError', 10)"
						value="<%=ServletUtility.getParameter("loan_amount", request)%>">
					<font color="red" class="pl-sm-5" id="loan_amountError"></font>

				</div>



				<div class="col-sm-2"><%=HTMLUtility.getList1("customer_id", String.valueOf(dto.getCustomer_id()), map)%></div>



				<div class="col-sm-2">
					<input type="text" name="interest_rate" placeholder="Enter Intrest_Rate"
						class="form-control" onkeypress="ValidateKey(event)"
						
						oninput="handleDoubleInput(this, 'interest_rateError', 4)"
						onblur="validateDoubleInput(this, 'interest_rateError', 4)"
							oninput="numberLength(this)" step="any"
						value="<%=ServletUtility.getParameter("intrestRate", request)%>">
						
						

					<font color="red" class="pl-sm-5" id="interest_rateError"></font>
				

					<span id="interest_rate-validation-message"
						style="display: none; color: red;">Only number are allowed
					</span>
					<font color="red" class="pl-sm-5" id="interest_rateError"> <%=ServletUtility.getErrorMessage("interest_rate", request)%></font></br>
				</div>




				&emsp;
				<div class="col-sm-2">
					<input type="text" id="datepicker" name="loan_start_date"
						class="form-control" placeholder=" Enter loan_start_date"
						readonly="readonly"
						value="<%=ServletUtility.getParameter("loan_start_date", request)%>">

				</div>










				<center>
					<div class="col-sm-2">
						<input type="submit" class="btn btn-primary btn-md"
							style="font-size: 15px" name="operation"
							value="<%=LoansListCtl.OP_SEARCH%>"> &emsp; <input
							type="submit" class="btn btn-dark btn-md" style="font-size: 15px"
							name="operation" value="<%=LoansListCtl.OP_RESET%>">
					</div>
				</center>

				<div class="col-sm-2"></div>
			</div>

			</br>
			<div style="margin-bottom: 20px;" class="table-responsive">
				<table class="table table-bordered table-dark table-hover">
					<thead>
						<tr style="background-color: purple;">

							<th width="10%"><input type="checkbox" id="select_all"
								name="Select" class="text"> Select All</th>
							<th width="5%" class="text">S.NO</th>
							<th width="15%" class="text">Loan_amount</th>
							<th width="20%" class="text">Customer_id</th>
							<th width="15%" class="text">Interest_rate</th>
							<th width="15%" class="text">Loan_start_date</th>
							<th width="5%" class="text">Edit</th>
						</tr>
					</thead>
					<%
						while (it.hasNext()) {
								dto = it.next();

								/* 	RoleDTO rbean = rmodel.findByPK(dto.getRoleId()); */
					%>
					<tbody>
						<tr>
							<td align="center"><input type="checkbox" class="checkbox"
								name="ids" value="<%=dto.getId()%>"></td>
							<td class="text"><%=index++%></td>
							<td class="text"><%=dto.getLoan_amount()%></td>
							<td class="text"><%=map.get(Integer.parseInt(dto.getCustomer_id()))%></td>
							<td class="text"><%=dto.getInterest_rate()%></td>
							<td class="text"><%=DataUtility.getDateString(dto.getLoan_start_date())%></td>




							<%-- <td class="text"><%= dto.getProduct()%></td> --%>




							<td class="text"><a href="LoansCtl?id=<%=dto.getId()%>">Edit</a></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
			</div>
			<table width="100%">
				<tr>
					<td><input type="submit" name="operation"
						class="btn btn-warning btn-md" style="font-size: 17px"
						value="<%=LoansListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></td>

					<td><input type="submit" name="operation"
						class="btn btn-primary btn-md" style="font-size: 17px"
						value="<%=LoansListCtl.OP_NEW%>"></td>

					<td><input type="submit" name="operation"
						class="btn btn-danger btn-md" style="font-size: 17px"
						value="<%=LoansListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-warning btn-md" style="font-size: 17px"
						style="padding: 5px;" value="<%=LoansListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				</tr>
				<tr></tr>
			</table>

			<%
				}
				if (list.size() == 0) {
			%>
			<center>
				<h1 style="font-size: 40px; color: #162390;">Trade List</h1>
			</center>
			</br>
			<div class="row">
				<div class="col-md-4"></div>

				<%
					if (!ServletUtility.getErrorMessage(request).equals("")) {
				%>
				<div class=" col-md-4 alert alert-danger alert-dismissible">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="red"> <%=ServletUtility.getErrorMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>




				<%
					if (!ServletUtility.getSuccessMessage(request).equals("")) {
				%>

				<div class="col-md-4 alert alert-success alert-dismissible"
					style="background-color: #80ff80">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<h4>
						<font color="#008000"><%=ServletUtility.getSuccessMessage(request)%></font>
					</h4>
				</div>
				<%
					}
				%>
				<div style="padding-left: 48%;">
					<input type="submit" name="operation"
						class="btn btn-primary btn-md" style="font-size: 17px"
						value="<%=LoansListCtl.OP_BACK%>">
				</div>

				<div class="col-md-4"></div>
			</div>

			<%
				}
			%>

			<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
		</form>


	</div>


</body>
<%@include file="FooterView.jsp"%>
</html>
