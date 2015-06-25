<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- Core tag library - Start-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Core tag library - End-->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Client</title>


<!-- Bootstrap and Jquery CSS Library - Start-->
<link
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- BootstrapValidator CSS Library -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrapvalidator.min.css" />
<!-- Optional theme -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap-theme.min.css" />
<!-- Jquery data table CSS Library -->
<link rel="stylesheet"
	href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css" />


<!-- Bootstrap and Jquery CSS Library - End-->


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) - Start-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- Bootstrap.min.js -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- BootstrapValidator JS Library -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
<!-- Jquery data table JS Library -->
<script type="text/javascript"
	src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) - End-->

<!-- Manual Script -->
<%-- <%=request.getContextPath()%> --%>
<script type="text/javascript" src="/resources/js/manualScript.js"></script>

<!-- ClientList Script -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/pagesJS/ClientList.js"></script>

<style>
body {
	padding-top: 40px;
}

.navbar-brand {
	padding-top: 0.2px;
	padding-left: 0px;
}
</style>
</head>

<body>

	<header>
		<div class="navbar navbar-default navbar-fixed-top navbar-inverse">
			<div class="container">
				<div class="navbar-header">
					<a href="home" class="navbar-brand"><img class="img-circle"
						alt="Shiva Blast"
						src="<%=request.getContextPath()%>/resources/images/logo.png"></a>
				</div>

				<div class="collpase navbar-collpase" id="collpase">
					<!-- Create client Modal Button to Trigger Modal - Start -->
					<button type="button"
						class="btn btn-warning navbar-btn navbar-right"
						data-toggle="modal" data-target="#createClient">Create
						Client</button>
					<!-- Create client Modal Button to Trigger Modal - End -->

					<p class="text-center text-primary">Welcome: ${username}</p>

				</div>
			</div>
		</div>
	</header>


	<!-- Jumbotron - Start-->
	<div class="jumbotron">
		<div class="container">
			<h3>Please fill required details for client.</h3>
			<p class="text-center text-danger">${redirectAttribute}</p>

			<!-- Pop up submission parameter -->
			<p class="text-center text-warning">${popUpMessage}</p>


		</div>
	</div>
	<!-- Jumbotron - End-->

	<br>
	<br>
	<!--Client Table - Start -->
	<div class="container">
		<form action="createClientTableForm" method="post">
			<div class="table-responsive">
				<table id="createClientTable" class="display table" width="100%">
					<thead>
						<tr class="seeTableDetails">
							<th>Client ID</th>
							<th>Name</th>
							<th>E-Mail</th>
							<th>Mobile</th>
							<!-- 	<th>Address</th>
							<th>Pincode</th> -->
							<th>Balance</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty clientList}">
							<c:forEach items="${clientList}" var="client">
								<tr>
									<td>${client.clientId}</td>
									<td>${client.clientName}</td>
									<td>${client.email}</td>
									<td>${client.mobile}</td>
									<!-- <td>${client.address}</td>
									<td>${client.pincode}</td> -->
									<td>${client.balance}</td>
									<td>
										<!-- Create transaction Action button -->
										<button type="submit" class="btn btn-primary"
											id="createTransaction" name="createTransactionName"
											value="${client.clientId} createTransaction"
											data-toggle="tooltip" data-placement="bottom"
											title="Create Transaction">
											<span class="glyphicon glyphicon-usd"></span>
										</button> <!-- See Client Action button -->
										<button type="submit" class="btn btn-primary" id="seeDetails"
											name="seeDetailsName" value="${client.clientId} seeButton"
											data-toggle="tooltip" data-placement="bottom" title="See">
											<span class="glyphicon glyphicon-eye-open"></span>
										</button> <!-- Remove Client Action button -->
										<button type="submit" class="btn btn-primary"
											id="removeClient" name="removeClientName"
											value="${client.clientId} removeButton" data-toggle="tooltip"
											data-placement="bottom" title="Remove">
											<span class="glyphicon glyphicon-remove"></span>
										</button> <!-- Update Client Action button -->
										<button type="submit" class="btn btn-primary"
											id="updateClient" name="updateClientName"
											value="${client.clientId} updateButton" data-toggle="tooltip"
											data-placement="bottom" title="Update" data-toggle="modal"
											data-target="#myCreateModal">
											<span class="glyphicon glyphicon-edit"></span>
										</button>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</form>
	</div>
	<!--Client Table - End -->
	<br>
	<br>


	<!--  Modal (Create Client Pop Up View and Form) - Start-->

	<div class="container">

		<!-- Modal HTML -->
		<div id="createClient" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title text-danger">Create Client</h4>
					</div>

					<form action="createClientPopUpAction" id="createClientPopUpForm"
						method="post">
						<div class="modal-body">

							<div class="form-group">
								<label for="clientName" class="control-label">Name:</label> <input
									type="text" class="form-control" id="clientName"
									name="clientName" placeholder="Client Name">
							</div>
							<div class="form-group">
								<label for="email" class="control-label">E-Mail:</label> <input
									type="text" class="form-control" id="email" name="email"
									placeholder="E-Mail">
							</div>

							<div class="form-group">
								<label for="balance" class="control-label">Balance:</label>
								<div class="input-group">
									<span class="input-group-addon">&#x20B9;</span> <input
										type="text" class="form-control" id="balance" name="balance"
										placeholder="Balance">
								</div>
							</div>

							<div class="form-group">
								<label for="mobile" class="control-label">Mobile:</label>
								<div class="input-group">
									<span class="input-group-addon">+91</span> <input type="text"
										class="form-control" id="mobile" name="mobile"
										placeholder="Mobile Number">
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="control-label">Address:</label>
								<textarea class="form-control" rows="5" id="address"
									name="address" placeholder="Address"></textarea>
							</div>
							<div class="form-group">
								<label for="pincode" class="control-label">Pincode:</label> <input
									type="text" class="form-control" id="pincode" name="pincode"
									placeholder="Pincode">
							</div>
							<!-- <div class="form-group">
								<label for="country" class="control-label">Country:</label>
								<p>
									<b>India</b>(Service only available in India)
								</p>
							</div> -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary">Send</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!--  Modal (Create Client Pop Up View and Form) - End-->





	<footer>

		<div class="container text-center">
			<ul class="list-inline">
				<li><a href="http://www.twitter.com/shivablast">Twitter</a></li>
				<li><a href="http://www.facebook.com/shivablast">Facebook</a></li>
				<li><a href="http://www.youtube.com/shivablast">YouTube</a></li>
			</ul>

			<p>&copy; Copyright @ Shiva Blast - 2015</p>

		</div>
	</footer>

</body>
</html>