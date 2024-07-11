<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DBMS.DBMSConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@ page import="com.entity.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: USER ORDER</title>
<%@include file="allComponent/allCss.jsp"%>
<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>
</head>
<body style="background-color: #e1e7ed;">
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container mt-4">
		<h4 class="text-center">Your Orders</h4>
		<table class="table table-striped">
			<table class="table">
				<thead style="background-color: #737578; color: white;">
					<tr>
						<th scope="col">Order Id</th>
						<th scope="col">Name</th>
						<th scope="col">Book Name</th>
						<th scope="col">Author</th>
						<th scope="col">Price</th>
						<th scope="col">Payment</th>


					</tr>
				</thead>
				<tbody>

					<%
					User user = (User) session.getAttribute("userobj");
					OrderDAOImpl dao = new OrderDAOImpl(DBMSConnect.getConn());
					List<BookOrder> blist = dao.getBook(user.getEmail());
					for (BookOrder b : blist) {
					%>
					<tr>
						<th scope="row"><%=b.getOrderId()%></th>
						<td><%=b.getUsername()%></td>
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
</html>