<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: SETTING</title>
<%@include file="allComponent/allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #e1e7ed">
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container">
		<h4 class="text-center mt-4">Hello, ${userobj.name }</h4>
		<div class="row p-5">
			<div class="col-md-4 mb-4">
				<a href="sellBook.jsp">
					<div class="card h-100">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h4 class="mt-3">Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mb-4">
				<a href="myPost.jsp">
					<div class="card h-100">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-box-open fa-3x"></i>
							</div>
							<h4 class="mt-3">My Post</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mb-4">
				<a href="editProfile.jsp">
					<div class="card h-100">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-user-pen fa-3x"></i>
							</div>
							<h4 class="mt-3">Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6 mb-4">
				<a href="order.jsp">
					<div class="card h-100">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fa-solid fa-truck fa-3x"></i>
							</div>
							<h4 class="mt-3">Your Orders</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-6 mb-4">
				<a href="helpline.jsp">
					<div class="card h-100">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-circle-question fa-3x"></i>
							</div>
							<h4 class="mt-3">Help Center</h4>
							<p>24 X 7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</body>
</html>
