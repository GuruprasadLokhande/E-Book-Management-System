<%@ page import="com.entity.User"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: EDIT USER PROFILE</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #e1e7ed">
	<%@include file="allComponent/navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("userobj");
	%>

	<div class="continer">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-body">
						<h4 class="text-center text-black">Edit Your Profile</h4>

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

						<form action="updateprofile" method="post">
							<input type="hidden" value="${userobj.id}" name="id">
							<div class="mb-3 mt-4">
								<label for="exampleInputEmail1" class="form-label">Name</label>
								<input type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required name="fname"
									value="${userobj.name }">
								<div id="emailHelp" class="form-text"></div>
							</div>

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" required
									readonly name="email" value="${userobj.email }">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Mobile
									No</label> <input type="tel" class="form-control" pattern="[0-9]{10}"
									id="exampleInputPassword1" placeholder="Enter Mobile No"
									required name="phone" value="${userobj.phone }">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Enter Password"
									required name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>