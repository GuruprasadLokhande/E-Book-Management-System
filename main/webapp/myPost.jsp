<%@page import="com.entity.bookDetails"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.DBMS.DBMSConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.util.List"%>
<%@page import="com.entity.User"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: USER MY POST</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #e1e7ed">
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container">
		<h4 class="text-center mt-3">User Post</h4>
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
		<table class="table table-striped ">
			<table class="table">
				<thead style="background-color: #737578; color: white;">
					<tr>
						<th scope="col">Id</th>

						<th scope="col">Book Name</th>
						<th scope="col">Author Name</th>
						<th scope="col">Category</th>
						<th scope="col">Price</th>
						<th scope="col">Action</th>

					</tr>
				</thead>
				<tbody>

					<%
					User user = (User) session.getAttribute("userobj");
					String email = user.getEmail();
					BookDAOImpl dao = new BookDAOImpl(DBMSConnect.getConn());
					List<bookDetails> list = dao.getAllOldBook(email);
					for (bookDetails b : list) {
					%>
					<tr>

						<td><%=b.getBookId()%></td>

						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getBookCategory()%></td>
						<td><%=b.getPrice()%></td>


						<td><a href="deleteoldbook?email=<%=email%>&&id=<%=b.getBookId() %>"
							class="btn btn-sm btn-danger"><i
								class="fa-solid fa-trash-can"></i> Delete</a></td>
					</tr>
					<%
					}
					%>

				</tbody>
			</table>
		</table>
	</div>
</body>
</html>