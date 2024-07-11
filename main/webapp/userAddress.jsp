<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-BOOK: USER ADDRESS</title>
<%@include file="allComponent/allCss.jsp"%>
</head>
<body style="background-color: #e1e7ed;">
	<%@include file="allComponent/navbar.jsp"%>

	<div class="continer mt-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-body">
						<h4 class="text-center text-black">Add Address</h4>

						<div class="form-group col-md-12 mt-3">
							<div class="row">
								<div class="col-md-6">
									<label for="inputEmail4">Address</label> <input type="text"
										class="form-control" id="inputEmail4"
										placeholder="Enter Address" style="width: 100%" required>
								</div>
								<div class="col-md-6">
									<label for="inputPassword4">Landmark</label> <input type="text"
										class="form-control" id="inputPassword4"
										placeholder="Enter Landmark" style="width: 100%" required>
								</div>
							</div>
						</div>
						<div class="form-group col-md-12 mt-3">
							<div class="row">
								<div class="col-md-6">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Enter City"
										style="width: 100%" required>
								</div>
								<div class="col-md-6">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" id="inputPassword4"
										placeholder="Enter State" style="width: 100%" required>
								</div>
							</div>
						</div>
						<div class="form-group col-md-12 mt-3">
							<div class="row">
								<div class="col-md-6">
									<label for="inputEmail4">Pin-Code</label> <input type="number"
										class="form-control" id="inputEmail4"
										placeholder="Enter Pincode" style="width: 100%" required>
								</div>
							</div>
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-warning">Add
								Address</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>