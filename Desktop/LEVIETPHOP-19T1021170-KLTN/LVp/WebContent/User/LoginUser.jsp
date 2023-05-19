<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập</title>
<link rel="apple-touch-icon" sizes="180x180"
	href="favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon_io/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="stylesheet" href="./css/LoginUser.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js">
<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div
					class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
					<div class="card-img-left d-none d-md-flex">
						<!-- Background image for card set in CSS! -->
					</div>
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-center mb-5 fw-light fs-5">Đăng
							nhập</h5>
						<form action="ktdnController" method="post">
							<div class="form-floating mb-3">
								<input type="text" class="form-control"
									id="floatingInputUsername" placeholder="myusername"
									name="txtun" required autofocus> <label
									for="floatingInputUsername">Username</label>
							</div>
							<hr>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" name="txtpass"
									id="floatingPassword" placeholder="Password"> <label
									for="floatingPassword">Password</label>
							</div>
							<div class="g-recaptcha" style="margin-left: 30px"
								data-sitekey="6LeCFpYjAAAAAGpM6NGWPtjR1l3833fYg4ulH1uf"
								data-callback="verifyRecaptchaCallback"
								data-expired-callback="expiredRecaptchaCallback"></div>

							<div class="d-grid mb-2">
								<button
									class="btn btn-lg btn-primary btn-login fw-bold text-uppercase"
									type="submit">Đăng nhập</button>
							</div>
							<a class="d-block text-center mt-2 small" href="DangKyController">Không
								có tài khoản? Đăng ký ngay</a>
							<hr class="my-4">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://www.google.com/recaptcha/enterprise.js?render=6LeCFpYjAAAAAGpM6NGWPtjR1l3833fYg4ulH1uf"></script>
	<script>
grecaptcha.enterprise.ready(function() {
    grecaptcha.enterprise.execute('6LeCFpYjAAAAAGpM6NGWPtjR1l3833fYg4ulH1uf', {action: 'login'}).then(function(token) {
       ...
    });
    
});
</script>
</body>
</html>