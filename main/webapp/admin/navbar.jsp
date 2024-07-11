<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<style>
.bg-custom {
	background-color:  #628bbd;
}

.navbar .nav-item:hover .nav-link {
	background-color: white;
	color:  #628bbd;
	border-radius: 15px;
}
</style>
<div class="continer-fluid"
	style="height: 10px; background-color: #628bbd"></div>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3 text-success">
			<h3>
				<i class="fa-solid fa-book"></i> EBooks
			</h3>
		</div>

		<div class="col-md-3">
			<c:if test="${not empty userobj }">
				

			</c:if>
			<c:if test="${empty userobj }">
				<a href="../login.jsp" class="btn btn-success"><i
					class="fas fa-sign-in-alt"></i> Login</a>
				<a href="../register.jsp" class="btn btn-primary text-white"><i
					class="fas fa-user-plus"></i> Register</a>
			</c:if>

		</div>
	</div>
</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
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
					aria-current="page" href="home.jsp"><i
						class="fa-solid fa-arrow-left"></i> Back</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="../index.jsp"><i
						class="fa-solid fa-house"></i> </lord-icon> Home</a></li>
			</ul>



		</div>

	</div>
</nav>