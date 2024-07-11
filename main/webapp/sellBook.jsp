<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: USER SELL BOOK</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #e1e7ed">
	<%@include file="allComponent/navbar.jsp"%>
	<div class="continer">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-body">

						<h4 class="text-center">Sell Old Book</h4>

						<c:if test="${not empty succMsg}">
							<p class="text-center text-success">${succMsg}</p>
							<%
							session.removeAttribute("succMsg");
							%>
						</c:if>

						<c:if test="${not empty failMsg}">
							<p class="text-center text-danger">${failMsg}</p>
							<%
							session.removeAttribute("failMsg");
							%>
						</c:if>

						<form action="addoldbook" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="${userobj.email }" name="user">

							<div class="form-group mt-3">
								<label for="exampleInputEmail">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail" aria-discriabeby="emailHelp">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail" aria-discriabeby="emailHelp">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail">Price*</label> <input
									name="price" type="tel" class="form-control"
									id="exampleInputEmail">
							</div>

							<div class="form-group mt-3">
								<label for="exampleFormColtrolFile1">Upload Photo </label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormColtrolFile1">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-3">Sell
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>