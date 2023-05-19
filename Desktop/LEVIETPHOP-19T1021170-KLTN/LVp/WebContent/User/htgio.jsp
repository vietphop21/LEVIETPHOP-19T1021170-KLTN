<%@page import="java.text.DecimalFormat"%>
<%@page import="bean.khachhangBean"%>
<%@page import="bean.giohangBean"%>
<%@page import="bo.giohangBo"%>
<%@page import="bean.hangBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaiBean"%>
<%@page import="bo.hangBo"%>
<%@page import="bo.loaiBo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Giỏ hàng</title>
<link rel="apple-touch-icon" sizes="180x180"
	href="favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon_io/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="./css/htgio.css">
</head>
<body>
	<%@include file="navbarUser.jsp"%>
	<%
	DecimalFormat df = new DecimalFormat("###,###,###");
	%>
	<div class="cart-edit">
		<table width="850" align="center" class="table table-bordered">
			<tr>
				<td width="850" valign="top">
					<table class="table table-hover">
						<tr>
							<th style="padding: 6px">Check</th>
							<th>Mã hàng</th>
							<th>Tên Hàng</th>
							<th>Giá</th>
							<th>Số lượng</th>
							<th>Thành tiền</th>
							<th style="min-width: 70px;">Tuỳ chọn
							<th>
						</tr>
						<%
						giohangBo ghbo = (giohangBo) session.getAttribute("gio");
						long sum = 0;
						if (ghbo != null) {
							for (giohangBean s : ghbo.ds) {
						%>
						<tr height="70px" class="card">
							<td style="text-align: center"><input type="checkbox"
								name="check" value="<%=s.getMahang()%>" form="formcheck"></td>
							<td><%=s.getMahang()%></td>
							<td style="min-width: 350px; text-align: center; padding: 3px"><%=s.getTenhang()%><br>
								<img style="width: 100px; height: 50px" src="<%=s.getImage()%>">
							</td>
							<td style="min-width: 120px; text-align: center"><%=df.format(s.getGia())%>đ</td>
							<td style="min-width: 120px; text-align: center">
								<form style="display: flex; justify-content: space-evenly"
									action="suaxoaController?mh=<%=s.getMahang()%>" method="post">
									<input type="hidden" name="mh" value="<%=s.getMahang()%>"
										class="form-input"> <input style="width: 30px"
										type="number" name="<%=s.getMahang()%>" class="form-sl"
										value="<%=s.getSoluong()%>" min="0" max="99">
									<button
										style="cursor: pointer; border: solid 1px white; background-color: #2c5053; font-size: 10px; font-weight: 600; color: white"
										type="submit" name="butsua" class="btn btn-primary"
										value="<%=s.getMahang()%>">UPDATE</button>
								</form>
								<td><%=df.format(s.getThanhtien())%>đ</td>
								<td> <a style="padding-left:20px;color: #ec4743"
							href="suaxoaController?butxoa=<%=s.getMahang()%>">
								<i class="fa fa-trash-o" aria-hidden="true"></i>
							</a> </td>
							</td>
							
							

						</tr>

 

						<%
						}
						}
						%>


					

					</table>
					<div
						style="display: flex; justify-content: flex-end; align-items: center">
						<a class="btn btn-warning" href="suaxoaController?xoahet="><i
							class="fa fa-trash-o" aria-hidden="true"></i>Xóa tất cả</a>
						<!-- //vì form không để bên trong được nên sài form="" focus ra bên ngoài -->

						<form style="margin-left: 12px" action="suaxoaController"
							method="post" id="formcheck">
							<input
								style="border: none; font-size: 16px; padding: 3px 6px !important"
								class="btn btn-warning" type="submit" name="butcheck"
								class="mx-3 btn btn-primary" value="Xoá chọn">
						</form>
					</div>
					<div class="bordertt">
						<%
						if (session.getAttribute("gio") == null) {
						%>
						<h3>
							Tổng Cộng:
							<%=0%>VND
						</h3>
						<%
						} else {
						%>
						<h3>
							Tổng Cộng:
							<%=df.format(ghbo.Tongtien())%>
							VND
						</h3>
						<%
						}
						%>
						<button
							style="background-color: #68b69f; border: 2px solid white; border-radius: 3px; color: white;"
							class="btnCast">
							<i class="fa fa-shopping-cart" aria-hidden="true"></i> <a
								class="btn btn-danger" href="thanhtoan1Controller">Xác nhận
								đặt mua</a> <br>


						</button>
						<br>


					</div>
					</div>
</body>
</html>
