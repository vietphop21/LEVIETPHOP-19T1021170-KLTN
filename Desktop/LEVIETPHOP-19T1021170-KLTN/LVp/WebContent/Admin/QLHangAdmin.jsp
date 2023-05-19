<%@page import="java.text.DecimalFormat"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link rel="stylesheet" href="./css/admincss.css">
<style>
.pagination {
	display: inline-block;
	margin-left: 33%;
	margin-top: 20px;
}

.pagination a {
	color: black;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border-radius: 5px;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
	border-radius: 5px;
}

body {
	padding-top: 50px;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 6px 20px;
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
	<h2 style="    padding-top:80px">Nhấn để thêm hàng điện tử</h2>
	<button onclick="document.getElementById('id01').style.display='block'"
		style="width: auto;">Thêm hàng</button>

	<div id="id01" class="modal"> 

		<form class="modal-content animate" action="QLHangADMINController"
			method="post" enctype='multipart/form-data'>
			<div class="container">
				<label>Mã hàng:</label> <input style="
   
    margin-left: 40px;
"  name="txtmahang" id="mh" required />
			</div>
			<div class="container">
				<label>Tên hàng:</label> <input style="
   
    margin-left: 35px;
"  name="txttenhang" id="th" required />
			</div>
			<div class="container">
				<label>Giá:</label> <input style="
   
    margin-left: 77px;
"  name="txtgia" id="gia" required
					type="number" />
			</div>
			<div class="container">
				<label>Số lượng:</label> <input style="
   
    margin-left: 34px;
"  name="txtsl" id="sl" required
					type="number" />
			</div>

			<div class="container">
				<label>Mã loại:</label> <select style="
   
    margin-left: 43px;
"  name="txtmaloai" id="ml" required>
					<%
					ArrayList<loaiBean> loais = (ArrayList<loaiBean>) request.getAttribute("dsloai");
					DecimalFormat df = new DecimalFormat("###,###,###");
					for (loaiBean l : loais) {
					%>
					<option value="<%=l.getMaLoai()%>"><%=l.getTenLoai()%></option>
					<%
					}
					%>
				</select>
			</div>
			<div class="container">
				<label>Bảo hành:</label> <input style="
   
    margin-left: 30px;
"  name="txtbaohanh" id="bh" required />
			</div>
			<div class="container">
				<label>Ảnh:</label> <input style="
   
    margin-left: 72px;
"  type="file" name="txtfile">
			</div>
			<div class="container">
				<label>Hãng sản xuất:</label> <input style="
   
    margin-left: 0px;
"  name="txthangsx" id="hangsx"
					required />
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
		<div>
			<form action="QLHangADMINController" method="get">
				<input name="txttk" type="text" class="form-control" style="width: 293px;">
				<button type="submit" class="btn btn-primary" style="width: 100px">
					<i class="fa fa-search"></i>
				</button>
			</form>
		</div>
	
		<div class="container my-3">
			<form style="margin-top: 100px; padding-bottom: 12px;"
				action="QLHangADMINController" method="post">
				<div style="
		padding-top: 52px;
    color: green;
    font-size: 30px;
    text-align: center;
    font-weight: 700;
		" > Danh sách sản phẩm </div>
				<table border="1" width="800" valign="top"
					class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Thứ tự</th>
							
							<th style="
    width: 195px;
							 scope="col">Tên hàng điện tử</th>
							<th scope="col"> Ảnh </th>
							<th scope="col">Số lượng</th>
							<th scope="col">Giá</th>
							<th scope="col">Hãng sản xuất</th>
							<th scope="col">Xóa</th>
							<th scope="col">  Update </th>
						</tr>
					</thead>
					<tbody>
						<%
						ArrayList<hangBean> dssach = (ArrayList<hangBean>) request.getAttribute("dssach");
						int n = dssach.size();
						int Numpage = (int) request.getAttribute("Numpage");

						for (int i = 0; i < n; i++) {
							hangBean s = dssach.get(i);
						%>
						<tr >

							<td><%=(i + 1)%></td>
							<td><%=s.getTenHang()%>  </td>
							<td><img
								style="width: 150px; height: 150px" src="<%=s.getImage()%>"></td>
							<td><%=s.getSoLuong()%></td>
							<td><%=df.format(s.getGia())%>đ</td>
							<td><%=s.getHangSX()%></td>
							<td><a style="color: #111010"
								class="btn btn-danger"
								href="QLHangADMINController?xoa=<%=s.getMaHang()%>&anh=<%=s.getImage()%>"><i
									class="fa fa-trash-o" aria-hidden="true"></i></a>
							</td>
							<td><a href="UpdateItemController?mh=<%=s.getMaHang()%>">Sửa</a>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<hr>
		</div>
	</div>
	<div  style="display:flex" class="pagination">
		<%
		for (int t = 0; t < Numpage; t++) {
		%><a class="card" href="QLHangADMINController?page=<%=t%>"><%=t + 1%></a>
		<%
		}
		%>
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