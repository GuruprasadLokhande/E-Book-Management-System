<%@page import="java.awt.ActiveEvent"%>
<%@page import="com.entity.bookDetails"%>
<%@page import="com.DBMS.DBMSConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: ADMIN ADD BOOKS</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #e1e7ed">
	<%@include file="navbar.jsp"%>

	<div class="continer">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-body">

						<h4 class="text-center">Edit Book</h4>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBMSConnect.getConn());
						bookDetails b = dao.getBookById(id);
						%>

						<form action="../editBooks" method="post">
							<input type="hidden" name="id" value="<%=b.getBookId()%>">

							<div class="form-group mt-3">
								<label for="exampleInputEmail">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail" aria-discriabeby="emailHelp"
									value="<%=b.getBookName()%>">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail" aria-discriabeby="emailHelp"
									value="<%=b.getAuthor()%>">
							</div>

							<div class="form-group mt-3">
								<label for="exampleInputEmail">Price*</label> <input
									name="price" type="tel" class="form-control"
									id="exampleInputEmail" value="<%=b.getPrice()%>">
							</div>



							<div class="form-group mt-3">
								<label for="inputState">Book Status</label> <select
									name="status" class="form-control" id="inputState">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}
									%>
								</select>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-3">Update</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<div style="margin-top: 340px"><%@include file="footer.jsp"%></div>

</html>