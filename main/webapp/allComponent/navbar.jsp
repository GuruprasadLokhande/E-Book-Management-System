<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<style>
.bg-custom {
	background-color: #628bbd;
}

.navbar .nav-item:hover .nav-link {
	background-color: white;
	color: #628bbd;
	border-radius: 15px;
}
</style>
<div class="continer-fluid"
	style="height: 10px; background-color: #628bbd"></div>

<div class="container-fluid p-3" style="background-color: #e1e7ed">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> EBooks
			</h3>
		</div>
		<div class="col-md-6">
			<form class="d-flex" action="search.jsp" method="post">
				<input class="form-control me-2" style="width: 40%" type="search"
					name="ch" placeholder="Search" aria-label="Search">
				<button class="btn btn-primary" type="submit">Search</button>
			</form>
		</div>

		<c:if test="${not empty userobj }">
			<div class="col-md-3">
				<a href="cart.jsp" class="btn btn-primary text-white"><i
					class="fa-solid fa-cart-plus"></i> </a> <a class="btn btn-success">
					Welcome, ${userobj.name }</a> <a href="logout"
					class="btn btn-primary text-white"><i
					class="fa-solid fa-right-to-bracket"></i> Logout</a>
			</div>
		</c:if>

		<c:if test="${empty userobj }">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-user-plus"></i> Login</a> <a href="register.jsp"
					class="btn btn-primary text-white"><i
					class="fa-solid fa-right-to-bracket"></i> Register</a>
			</div>
		</c:if>


	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom"
	style="background-color: #628bbd;">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><script
				src="https://cdn.lordicon.com/lordicon.js"></script> <script
				src="https://cdn.lordicon.com/lordicon.js"></script></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="index.jsp"><i
						class="fa-solid fa-house-user"></i> Home</a></li>
				<li class="nav-item "><a class="nav-link active"
					href="allRecentBook.jsp"><i class="fa-solid fa-book-open"></i>
						Recent Book</a></li>
				<li class="nav-item "><a class="nav-link active"
					href="allNewBook.jsp"><i class="fa-solid fa-book-open"></i> New
						Book</a></li>

				<li class="nav-item "><a class="nav-link active"
					href="allOldBook.jsp"><i class="fa-solid fa-book-open"></i> Old
						Book</a></li>
			</ul>
			<form class="d-flex">
				<a href="setting.jsp" class="btn btn-light" type="submit"> <i
					class="fa-solid fa-gear"></i> Setting
				</a> <a href="helpline.jsp" class="btn btn-light" type="submit"
					style="margin-left: 1rem;"> <!-- Added inline style --> <i
					class="fa-solid fa-phone"></i> Contact

				</a>
			</form>


		</div>
	</div>
</nav>