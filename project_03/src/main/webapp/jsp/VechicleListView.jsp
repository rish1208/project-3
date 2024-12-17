<%@page import="in.co.rays.project_3.controller.VechicleListCtl"%>
<%@page import="in.co.rays.project_3.dto.VechicleDTO"%>
<%@page import="in.co.rays.project_3.dto.BaseDTO"%>
<%@page import="in.co.rays.project_3.util.HTMLUtility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.rays.project_3.model.RoleModelInt"%>
<%@page import="in.co.rays.project_3.model.ModelFactory"%>
<%@page import="in.co.rays.project_3.util.DataUtility"%>
<%@page import="in.co.rays.project_3.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script >
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
</script >

<script >


<script>
        function validateMobileNo(event) {
            const input = event.target;
            input.value = input.value.replace(/[^0-9.]/g, '');
            if (input.value.length > 0 && input.value[0] <= '5') {
               
                input.value = '';
            }
        }
        
         // on version veiw field write  onInput="validateVersion(event)"
        function validateVersion(event) {
            const input = event.target;
            input.value = input.value.replace(/[^0-9.]/g, '');
        }
    </script>

<script src="<%=ORSView.APP_CONTEXT%>/js/ValidateToInput.js"></script>

</script >
  
<title>Insert title here</title>
<script src="<%=ORSView.APP_CONTEXT%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=ORSView.APP_CONTEXT%>/js/CheckBox11.js"></script>
	<script src="<%=ORSView.APP_CONTEXT%>/js/utility.js"></script>
	
<style>
.hm {
	background-image: url('<%=ORSView.APP_CONTEXT%>/img/rain.jpg');
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
		<form class="pb-5" action="<%=ORSView.VECHICLE_LIST_CTL%>"
			method="post">
			<jsp:useBean id="dto" class="in.co.rays.project_3.dto.VechicleDTO"
				scope="request"></jsp:useBean>
			<%
				List list1 = (List) request.getAttribute("mt");
			%>


			<%
				int pageNo = ServletUtility.getPageNo(request);
				int pageSize = ServletUtility.getPageSize(request);
				int index = ((pageNo - 1) * pageSize) + 1;
				int nextPageSize = DataUtility.getInt(request.getAttribute("nextListSize").toString());
				RoleDTO rbean1 = new RoleDTO();
				RoleModelInt rmodel = ModelFactory.getInstance().getRoleModel();

				List list = ServletUtility.getList(request);

				Iterator<VechicleDTO> it = list.iterator();
				if (list.size() != 0) {
			%>
			<center>
				<h1 class="text-primary font-weight-bold pt-3">
					<u>Vechile List</u>
				</h1>
			</center>
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


				<div class="col-sm-2"></div>
				<div class="col-sm-2">
					<input type="text" name="number" placeholder="Enter Number"
						class="form-control" onkeypress="ValidateKey(event)"
						maxlength="10"
						oninput="handleIntegerInput(this, 'numberError', 4)"
						onblur="validateIntegerInput(this, 'numberError', 4)"
						value="<%=ServletUtility.getParameter("number", request)%>">

					<font color="red" class="pl-sm-5" id="numberError"></font>
				</div>
				
				<div class="col-sm-2">
					<input type="text" name="insuranceAmount" placeholder="Enter insuranceAmount"
						class="form-control" onkeypress="ValidateKey(event)"
						maxlength="10" oninput="handleIntegerInput(this, 'insuranceAmountError', 6)"
						onblur="validateIntegerInput(this, 'insuranceAmountError', 6)"
						value="<%=ServletUtility.getParameter("insuranceAmount", request)%>">
						
					<font color="red" class="pl-sm-5" id="insuranceAmountError"></font>
</div>
				&emsp;
				<div class="col-sm-2"><%=HTMLUtility.getList("colour", String.valueOf(dto.getColour()), list1)%></div>
				&emsp; &emsp;
				<div class="col-sm-2">
					<input type="text" id="datepicker" name="purchaseDate"
						class="form-control" placeholder="  Enter purchaseDate"
						readonly="readonly"
						value="<%=ServletUtility.getParameter("purchaseDate", request)%>">

				</div>

				<%-- <div class="col-sm-2">
					<input type="text" name="deceade" placeholder="Enter deceade"
						class="form-control"
						value="<%=ServletUtility.getParameter("deceade", request)%>">
				</div>
 --%>				<%-- 
					&emsp;
				<div class="col-sm-2"><%=HTMLUtility.getList("nname", String.valueOf(dto.getName()), list1)%></div>
				&emsp; --%>

				<%-- 		&emsp;
				<div class="col-sm-2"><%=HTMLUtility.getList("ddob", String.valueOf(dto.getDob()), list1)%></div>
				&emsp;
 --%>

				<div class="col-sm-2">
					<input type="submit" class="btn btn-primary btn-md"
						style="font-size: 15px" name="operation"
						value="<%=VechicleListCtl.OP_SEARCH%>"> &emsp; <input
						type="submit" class="btn btn-dark btn-md" style="font-size: 15px"
						name="operation" value="<%=VechicleListCtl.OP_RESET%>">
				</div>


				<div class="col-sm-2"></div>
			</div>

			</br>
			<div style="margin-bottom: 20px;" class="table-responsive">
				<table class="table table-bordered table-dark table-hover">
					<thead>
						<tr style="background-color: blue;">

							<th width="10%"><input type="checkbox" id="select_all"
								name="Select" class="text"> Select All</th>
							<th width="5%" class="text">S.NO</th>
							<th width="15%" class="text">Number</th>
							<th width="15%" class="text">PurchasedDate</th>
							<th width="15%" class="text">InsuranceAmount</th>
							<th width="20%" class="text">Colour</th>
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
							<td class="text"><%=dto.getNumber()%></td>
							<td class="text"><%=DataUtility.getDateString(dto.getPurchaseDate())%></td>
							<td class="text"><%=dto.getInsuranceAmount()%></td>
							<td class="text"><%=dto.getColour()%></td>

							<%-- <td class="text"><%=rbean.getName()%></td> --%>
							<td class="text"><a href="VechicleCtl?id=<%=dto.getId()%>">Edit</a></td>
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
						value="<%=VechicleListCtl.OP_PREVIOUS%>"
						<%=pageNo > 1 ? "" : "disabled"%>></td>

					<td><input type="submit" name="operation"
						class="btn btn-primary btn-md" style="font-size: 17px"
						value="<%=VechicleListCtl.OP_NEW%>"></td>

					<td><input type="submit" name="operation"
						class="btn btn-danger btn-md" style="font-size: 17px"
						value="<%=VechicleListCtl.OP_DELETE%>"></td>

					<td align="right"><input type="submit" name="operation"
						class="btn btn-warning btn-md" style="font-size: 17px"
						style="padding: 5px;" value="<%=VechicleListCtl.OP_NEXT%>"
						<%=(nextPageSize != 0) ? "" : "disabled"%>></td>
				</tr>
				<tr></tr>
			</table>

			<%
				}
				if (list.size() == 0) {
			%>
			<center>
				<h1 style="font-size: 40px; color: #162390;">Producgt List</h1>
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
						value="<%=VechicleListCtl.OP_BACK%>">
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
<%@include file="FooterView.jsp"%></html>