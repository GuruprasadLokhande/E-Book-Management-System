<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.entity.bookDetails"%>
<%@page import="com.DBMS.DBMSConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page import="java.util.List"%>
<%@page import="com.entity.User"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: SEARCH</title>
<%@include file="allComponent/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover {
	background-color: #e1e7ed;
}

.sticky-top {
	position: sticky;
	top: 0;
	z-index: 1000;
	width: 100%;
	background-color: #ffffff;
	/* Change the background color as per your design */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	/* Add shadow for better visibility */
}
/* Style the button */
.scroll-top-btn {
	display: none; /* Hidden by default */
	position: fixed; /* Fixed/sticky position */
	bottom: 20px;
	/* Place the button at the bottom-right corner of the page */
	right: 20px;
	z-index: 1000; /* Make sure it stays above other content */
	width: 40px; /* Adjust the width and height of the button */
	height: 40px;
	background-image: url('path/to/arrow-image.png');
	/* Replace 'path/to/arrow-image.png' with the path to your arrow image */
	background-size: contain;
	/* Make sure the image fits inside the button */
	background-repeat: no-repeat; /* Prevent the image from repeating */
	border: none; /* Remove border */
	outline: none; /* Remove outline */
	cursor: pointer; /* Cursor on hover */
	transition: opacity 0.3s; /* Smooth transition on hover */
	background-color: rgb(13, 110, 253);
	color: white;
	display: block;
	border-radius: 20px;
}

/* Style the button on hover */
.scroll-top-btn:hover {
	opacity: 0.8; /* Reduce opacity on hover */
}
</style>
</head>
<body style="background-color: #e1e7ed">
	<%
	User user = (User) session.getAttribute("userobj");
	%>
	<nav class="sticky-top">
		<%@include file="allComponent/navbar.jsp"%>
	</nav>
	<div class="container">
		<h3 class="text-center text-black mt-3">Searched Book</h3>
		<div class="row">

			<%
			String ch = request.getParameter("ch");
			BookDAOImpl dao1 = new BookDAOImpl(DBMSConnect.getConn());
			List<bookDetails> list1 = dao1.getBookBySearch(ch);
			for (bookDetails b : list1) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center"
						style="box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumbnail">
						<p>
							Book Name:
							<%=b.getBookName()%></p>
						<p>
							Author Name:
							<%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">
							<div class="col">
								<%
								if (b.getBookCategory().equals("Old")) {
									if (user == null) {
								%>
								<a href="login.jsp" class="btn btn-success btn-sm">View
									Details</a> <span class="btn btn-danger btn-sm"><%=b.getPrice()%>
									<i class="fa-solid fa-indian-rupee-sign"></i></span>
								<%
								} else {
								%>
								<a href="viewDetails.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm">View Details</a> <span
									class="btn btn-danger btn-sm"><%=b.getPrice()%> <i
									class="fa-solid fa-indian-rupee-sign"></i></span>
								<%
								}
								} else {
								if (user == null) {
								%>
								<div class="row">
									<div class="col">
										<a href="login.jsp" class="btn btn-danger btn-sm"><i
											class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a
											href="login.jsp" class="btn btn-success btn-sm ">View
											Details</a> <a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%>
											<i class="fa-solid fa-indian-rupee-sign"></i></a>
									</div>
								</div>
								<%
								} else {
								%>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>"
									class="btn btn-danger btn-sm"><i
									class="fa-solid fa-cart-shopping"></i> Add Cart</a> <a
									href="viewDetails.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm">View Details</a> <a href="#"
									class="btn btn-danger btn-sm"><%=b.getPrice()%> <i
									class="fa-solid fa-indian-rupee-sign"></i></a>
								<%
								}
								}
								%>

							</div>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
	<button id="scrollTopBtn" class="scroll-top-btn" title="Go to top">&uarr;</button>
	<%@include file="allComponent/footer.jsp"%>

	<script>
		// Get the button
		var scrollTopBtn = document.getElementById("scrollTopBtn");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {
			scrollFunction();
		};

		function scrollFunction() {
			if (document.body.scrollTop > 20
					|| document.documentElement.scrollTop > 20) {
				scrollTopBtn.style.display = "block";
			} else {
				scrollTopBtn.style.display = "none";
			}
		}

		// When the user clicks on the button, scroll to the top of the document
		scrollTopBtn.addEventListener("click", function() {
			topFunction();
		});

		function topFunction() {
			document.body.scrollTop = 0; // For Safari
			document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
		}
	</script>
</body>
</html>
