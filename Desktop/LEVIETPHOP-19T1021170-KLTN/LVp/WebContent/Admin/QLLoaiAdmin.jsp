<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@page import="java.awt.List"%>
<%@page import="bean.hangBean"%>
<%@page import="bean.loaiBean"%>
<%@page import="java.util.ArrayList"%>
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
<link rel="stylesheet" href="./css/admincss.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>
body {
	padding-top: 50px;
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
	<%@include file="navbaradminnosearch.jsp"%>
	<h2  style="    padding-top: 90px" >Nhấn để thêm loại hàng</h2>

	<button onclick="document.getElementById('id01').style.display='block'"
		style="width: auto;">Thêm loại</button>

	<div id="id01" class="modal">

		<form class="modal-content animate" action="QLLoaiAdminController"
			method="post">
			<div class="container">
				<label>Mã loại:</label> <input name="txtmaloai" id="ml" required />
			</div>
			<div class="container">
				<label>Tên loại:</label> <input name="txttenloai" id="tl" required />
			</div>
			<div class="container">
				<input type="submit" name="btnadd" value="Thêm" />
			</div>
			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn">Cancel</button>
			</div>
		</form>
	</div>
	
	<div class="">
		<div class="container my-3">
			<form style="margin-top: 100px; padding-bottom: 12px;"
				action="QLLoaiAdminController" method="post">
				<div style="
		padding-top: 52px;
    color: green;
    font-size: 30px;
    text-align: center;
    font-weight: 700;
		" > Danh sách loại hàng </div>
				<table border="1" width="800" valign="top"
					class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Thứ tự</th>
							<th scope="col">Mã loại</th>
							<th scope="col">Tên loại</th>
							<th scope="col">Xóa</th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<loaiBean> dsloai = (ArrayList<loaiBean>) request.getAttribute("dsloai");
						int n = dsloai.size();
						for (int i = 0; i < n; i++) {
							loaiBean l = dsloai.get(i);
						%>
						<tr >

							<td><%=(i + 1)%></td>
							<td><%=l.getMaLoai()%></td>
							<td><%=l.getTenLoai()%></td>
							<td ><a style="color: #111010"
								class="btn btn-danger"
								href="QLLoaiAdminController?xoa=<%=l.getMaLoai()%>"><i
									class="fa fa-trash-o" aria-hidden="true"></i></a>
							</td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<hr>
		</div>
	</div>
	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>