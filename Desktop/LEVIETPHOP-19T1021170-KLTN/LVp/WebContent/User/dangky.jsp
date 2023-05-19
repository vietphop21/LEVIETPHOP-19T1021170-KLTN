<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng ký</title>
<link rel="apple-touch-icon" sizes="180x180"
	href="favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon_io/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="stylesheet" href="./css/DangKyAdmin.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div
					class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
					<div class="card-img-left d-none d-md-flex"></div>
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-light fs-5">Register</h5>
						<form action="DangKyController" method="post">

							<div class="form-floating mb-3">
								<input type="text" class="form-control"
									id="floatingInputUsername" placeholder="myusername"
									name="hoten" required autofocus> <label
									for="floatingInputUsername">Họ tên</label>
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control"
									id="floatingInputAddress" name="diachi" placeholder="myaddress" required
									autofocus> <label for="floatingInputAddress">Địa
									chỉ:</label>
							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control"
									id="floatingInputPhonenumber" name="sodt" placeholder="mynumberphone"
									required autofocus> <label
									for="floatingInputPhonenumber">Số điện thoại</label>
							</div>
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInputEmail"
									placeholder="name@example.com" name="email"> <label
									for="floatingInputEmail">Email</label>
							</div>
							<hr>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="tendn"
									id="floatingInputUsername" placeholder="myusername" required
									autofocus> <label for="floatingInputUsername">Username</label>
							</div>
							<div class="form-floating mb-3">
								<input name="pass" type="password" class="form-control"
									id="floatingPasswordConfirm" placeholder="Enter Password">
								<label for="floatingPasswordConfirm">Password</label>
							</div>

							<div class="d-grid mb-2">
								<button
									class="btn btn-lg btn-primary btn-login fw-bold text-uppercase"
									type="submit">Đăng ký</button>
							</div>

							<a class="d-block text-center mt-2 small" href="ktdnController">Have
								an account? Sign In</a>

							<hr class="my-4">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>