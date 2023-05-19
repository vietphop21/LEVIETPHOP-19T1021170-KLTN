<%@page import="bean.hangBean"%>
<%@page import="bean.LoginAdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GEAR Việt Nam</title>
<link rel="apple-touch-icon" sizes="180x180"
	href="favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon_io/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/cssNavbar.css">
<style>
body {
	padding-top: 50px;
}

.page-set {
	margin: 0 350px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #04AA6D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
		float: none;
	}
	.cancelbtn {
		width: 100%;
	}
}
</style>
</head>
<body>
	<%@include file="navbaradmin.jsp"%>
	<div class="row m-5 container" style="margin-left: 100px;">
		<div class="col">
			<img  style="margin-top: 51px;
    position: absolute;
    width: 500px;
    margin-left: 350px;
    height: 500px;
}"  alt="" src="${hang.getImage()}">
		</div>
		<form class="col" action="UpdateItemController" method="post"
			enctype="multipart/form-data">
			<div class="row">
				<h2 class="col">Mã hàng điện tử</h2>
				<input class="col" value="${hang.getMaHang()}" disabled="disabled">
				<input class="col" name="mh" value="${hang.getMaHang()}" hidden="">
			</div>
			<div class="row">
				<h2 class="col">Tên Hàng điện tử</h2>
				<input class="col" name="th" value="${hang.getTenHang()}">
			</div>
			<div class="row">
				<h2 class="col">Số Lượng</h2>
				<input class="col" name="sl" value="${hang.getSoLuong()}">
			</div>
			<div class="row">
				<h2 class="col">Giá</h2>
				<input class="col" name="gia" value="${hang.getGia()}">
			</div>
			<div class="row">
				<h2 class="col">Mã Loại Hàng</h2>
				<input class="col" value="${hang.getMaLoai()}" disabled="disabled">
				<input class="col" name="ml" value="${sach.getMaLoai()}" hidden="">
			</div>
			<div class="row">
				<h2 class="col">Bảo hành</h2>
				<input class="col" name="baohanh" value="${hang.getBaoHanh()}">
			</div>
			<div class="row">
				<h2 class="col">Hãng sản xuất</h2>
				<input class="col" name="hangsx" value="${hang.getHangSX()}">
			</div>

			<div class="row">
				<h2 class="col">Ảnh</h2>
				<input type="file" class="col" name="file"
					value="${hang.getImage()}"> <input class="col" name="anhcu"
					hidden="" value="${hang.getImage()}">
			</div>
			<button type="submit">Update</button>
		</form>
	</div>
</body>
</html>