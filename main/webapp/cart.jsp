<%@ page import="java.util.List"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page import="com.DBMS.DBMSConnect"%>
<%@ page import="com.entity.User"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: CART PAGE</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
.popup {
	position: fixed;
	bottom: 20px;
	left: 50%;
	transform: translateX(-50%);
	padding: 10px 20px;
	background-color: #dbab95;
	color: black;
	border-radius: 5px;
	z-index: 1000;
	display: none;
}
</style>


</head>
<body style="background-color: #e1e7ed;">
	<%@include file="allComponent/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%
	User user = (User) session.getAttribute("userobj");
	%>

	<c:if test="${not empty succMsg}">
		<p class="popup text-center" id="popupMsg">${succMsg}</p>
		<%
		session.removeAttribute("succMsg");
		%>
	</c:if>

	<script>
		// Function to display the popup message
		function showPopupMessage(duration) {
			var popup = document.getElementById("popupMsg");
			popup.style.display = "block";
			setTimeout(function() {
				popup.style.display = "none";
			}, duration);
		}

		// Example usage: Display the popup message for 3 seconds
		showPopupMessage(2000); // 3000 milliseconds = 3 seconds
	</script>

	<div class="continer">
		<div class="row">
			<div class="col-md-5 p-5">
				<div class="card ">
					<div class="card-body">
						<h3 class="text-center">Your Selected Book</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author Name</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								CartDAOImpl dao = new CartDAOImpl(DBMSConnect.getConn());
								List<Cart> cart = dao.getBookByUser(user.getId());
								double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>




								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="removeBook?bid=<%=c.getBid()%>&uid=<%=c.getUid()%>&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-7 p-5">
				<div class="card ">
					<div class="card-body">
						<h3 class="text-center">View Details For Order</h3>


						<c:if test="${not empty failMsg}">
							<p class="text-center text-danger">${failMsg}</p>
							<%
							session.removeAttribute("failMsg");
							%>
						</c:if>



						<form action="order" method="post">

							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-row">
								<div class="form-group col-md-12">
									<div class="row">
										<div class="col-md-6">
											<label for="inputEmail4">Name: </label> <input type="text"
												name="username" class="form-control" id="inputEmail4"
												placeholder="Enter Your Name" style="width: 100%" required
												readonly value="<%=user.getName()%>">
										</div>
										<div class="col-md-6">
											<label for="inputPassword4">Email</label> <input type="email"
												name="useremail" class="form-control" id="inputPassword4"
												placeholder="Enter Your Email" style="width: 100%" required
												readonly value="<%=user.getEmail()%>">
										</div>

									</div>
								</div>
								<div class="form-group col-md-12 mt-3">
									<div class="row">
										<div class="col-md-6">
											<label for="inputEmail4">Mobile</label> <input type="tel"
												class="form-control" id="inputEmail4" name="userphone"
												placeholder="Enter Mobile Number" style="width: 100%"
												required value="<%=user.getPhone()%>">
										</div>
										<div class="col-md-6">
											<label for="inputPassword4">Address</label> <input
												type="text" class="form-control" id="inputPassword4"
												name="useraddress" placeholder="Enter Address"
												style="width: 100%" required>
										</div>
									</div>
								</div>
								<div class="form-group col-md-12 mt-3">
									<div class="row">
										<div class="col-md-6">
											<label for="inputEmail4">Landmark</label> <input type="text"
												class="form-control" id="inputEmail4" name="userlandmark"
												placeholder="Enter LandMark" style="width: 100%" required>
										</div>
										<div class="col-md-6">
											<label for="inputPassword4">City</label> <input type="text"
												class="form-control" id="inputPassword4" name="usercity"
												placeholder="Enter City" style="width: 100%" required>
										</div>
									</div>
								</div>
								<div class="form-group col-md-12 mt-3">
									<div class="row">
										<div class="col-md-6">
											<label for="inputEmail4">State</label> <input type="tel"
												class="form-control" id="inputEmail4" name="userstate"
												placeholder="Enter State" style="width: 100%" required>
										</div>
										<div class="col-md-6">
											<label for="inputPassword4">Pin-Code</label> <input
												type="num" class="form-control" id="inputPassword4"
												name="pincode" placeholder="Enter Pincode"
												style="width: 100%" required>
										</div>
									</div>
								</div>
								<div class="form-group col-md-12 mt-3">
									<label for="inputState">Payment Mood</label> <select
										name="payment" class="form-control" id="inputState">
										<option selected value="notselect">--Select--</option>
										<option value="COD">Cash On Delivery</option>
									</select>
								</div>
							</div>
							<div class="text-center mt-3">
								<button class="btn btn-warning">Place Order</button>
								<button href="index.jsp" class="btn btn-primary">Continue
									Shopping</button>
							</div>
						</form>
					</div>
				</div>
			</div> 
		</div>
	</div>
</body>
</html>
