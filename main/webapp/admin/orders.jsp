<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DBMS.DBMSConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@ page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: ADMIN ALL ORDERS</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #e1e7ed;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>
	<h4 class="text-center mt-3">Hello Admin</h4>
	<div class="container">
		<table class="table table-striped">
			<table class="table">
				<thead style="background-color: #737578; color: white;">
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">User Name</th>
						<th scope="col">Email</th>
						<th scope="col">Address</th>
						<th scope="col">Phone No</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Payment Type</th>

					</tr>
				</thead>
				<tbody>
					<%
					User user = (User) session.getAttribute("userobj");
					OrderDAOImpl dao = new OrderDAOImpl(DBMSConnect.getConn());
					List<BookOrder> blist = dao.getAllBook();
					for (BookOrder b : blist) {
					%>
					<tr>
						<th scope="row"><%=b.getOrderId()%></th>
						<td><%=b.getUsername()%></td>
						<td><%=b.getEmail()%></td>
						<td><%=b.getFullAddress()%></td>
						<td><%=b.getPhoneno()%></td>
						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getPaymentType()%></td>

					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			</div>
</body>
<div style="margin-top: 340px"><%@include file="footer.jsp"%></div>
</html>