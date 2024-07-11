<%@page import="com.entity.bookDetails"%>
<%@page import="com.DBMS.DBMSConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.User"%>
<%@ page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: VIEW DETAILS</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #e1e7ed">
	<%@include file="allComponent/navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("userobj");
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBMSConnect.getConn());
	bookDetails bd = dao.getBookById(bid);
	%>
	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=bd.getPhotoName()%>"
					style="width: 150px; height: 200px;"><br>
				<h5 class="mt-3" style="color: #363945;">
					Book Name:
					<%=bd.getBookName()%>
				</h5>
				<h5 style="color: #363945;">
					Author Name:
					<%=bd.getAuthor()%>
				</h5>
				<h5 style="color: #363945;">
					Category:
					<%=bd.getBookCategory()%>
				</h5>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h3 class="text-danger"><%=bd.getBookName()%></h3>
				<%
				if ("Old".equals(bd.getBookCategory())) {
				%>

				<h5 class="mt-3">
					<h4>--Contact To Seller--</h4>
					<i class="fa-regular fa-envelope"></i> E-Mail:
					<%=bd.getEmail()%><br> 
				</h5>
				<%
				} else {
				%>
				<h5 class="mt-3">
					<i class="fa-regular fa-envelope"></i> E-Mail: admin@gmail.com
				</h5>
				<%
				}
				%>
				<div class="row mt-5">
					<div class="col-md-4 text-danger text-center p-3">
						<i class="fa-solid fa-money-bill-1-wave fa-2x "></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-3">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-3">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Delivery</p>
					</div>
				</div>
				<div class="mt-5 text-center">
					<%
					if ("Old".equals(bd.getBookCategory())) {
					%>
					<a href="index.jsp" class="btn btn-primary"><i
						class="fa-solid fa-cart-shopping"></i> Continues Shopping</a> <a
						href="" class="btn btn-primary"><%=bd.getPrice()%> <i
						class="fa-solid fa-indian-rupee-sign"></i></a>
					<%
					} else {
					%>
					<a href="cart?bid=<%=bd.getBookId()%>&&uid=<%=user.getId()%>"
						class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>
						Add Cart</a> <a href="" class="btn btn-primary"><%=bd.getPrice()%>
						<i class="fa-solid fa-indian-rupee-sign"></i></a>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
