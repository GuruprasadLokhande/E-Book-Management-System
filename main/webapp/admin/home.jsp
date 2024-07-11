<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: ADMIN HOME</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>

</head>
<body style="background-color: #e1e7ed;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>


	<div class="continer">
		<div class="row p-5 mt-5">
			<div class="col-md-3">
				<a href="addBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-plus-square fa-3x text-primary"></i><br>
							<h4>Add Book's</h4>
							---------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="allBooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
							<h4>All Book's</h4>
							---------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
							<h4>Order's</h4>
							---------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">

				<a data-bs-toggle="modal" data-bs-target="#staticBackdrop">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
							<h4>Logout</h4>
							---------------
						</div>
					</div>
				</a>

			</div>
		</div>
		<!-- Start Logout Modal -->
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel"></h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<h4>You Are Sure To Logout</h4>


							<button type="button" class="btn btn-secondary mt-3"
								data-bs-dismiss="modal">Close</button>
							<a href="../logout" type="button"
								class="btn btn-primary text-white mt-3">Logout</a>



						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- End Logout Modal -->

	</div>
	<div style="margin-top: 340px"><%@include file="footer.jsp"%></div>
</body>
</html>