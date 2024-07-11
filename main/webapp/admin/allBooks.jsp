<%@page import="com.entity.bookDetails"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.DBMS.DBMSConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: ADMIN ALL BOOKS</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #e1e7ed;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h4 class="text-center mt-3">Hello Admin</h4>

	<c:if test="${not empty succMsg}">
		<h5 class="text-center text-success">${succMsg}</h5>
		<%
		session.removeAttribute("succMsg");
		%>
	</c:if>

	<c:if test="${not empty failMsg}">
		<h5 class="text-center text-danger">${failMsg}</h5>
		<%
		session.removeAttribute("failMsg");
		%>
	</c:if>


	<table class="table table-striped">
		<table class="table">
			<thead style="background-color: #737578; color: white;">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>
				<%
				BookDAOImpl dao = new BookDAOImpl(DBMSConnect.getConn());
				List<bookDetails> list = dao.getAllBook();
				for (bookDetails b : list) {
				%>
				<tr>

					<td><%=b.getBookId()%></td>
					<td><img src="../books/<%=b.getPhotoName()%>"
						style="width: 40px;"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>

					<td><a href="editBooks.jsp?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-primary"><i
							class="fa-regular fa-pen-to-square"></i> Edit</a> <a
						href="../delete?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger"><i class="fa-solid fa-trash-can"></i>
							Delete</a></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</table>
</body>
<div style="margin-top: 340px"><%@include file="footer.jsp"%></div>
</html>