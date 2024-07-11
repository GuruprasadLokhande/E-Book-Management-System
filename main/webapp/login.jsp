<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: LOGIN</title>
<%@include file="allComponent/allCss.jsp"%>



</head>
<body style="background-color: #e1e7ed;">
	<%@include file="allComponent/navbar.jsp"%>
	<div class="continer p-5 round-pill">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-black">Login Page</h4>


						<c:if test="${not empty succMsg}">
							<p class="text-center text-danger">${succMsg}</p>
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


						<form action="login" method="post">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter Email" required name="email">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Password"
									required name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Login</button>
								<br> <br> <a href="register.jsp"
									style="text-decoration: none; margin-top: 10px;">Create
									Account</a>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>