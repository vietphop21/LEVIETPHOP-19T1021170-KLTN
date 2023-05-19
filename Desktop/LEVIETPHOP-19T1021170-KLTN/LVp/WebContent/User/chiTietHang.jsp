<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết sản phẩm</title>
<link rel="apple-touch-icon" sizes="180x180"
	href="favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="favicon_io/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<style>
* {
  box-sizing: border-box;
}

html,
body {
  height: 100%;
}

body {
  display: grid;
  grid-template-rows: 1fr;
  font-family: "Raleway", sans-serif;
 background-color: #c2d8cf;
}
}

h3 {
  font-size: 0.7em;
  letter-spacing: 1.2px;
  color: $color-secondary;
}

img {
      max-width: 100%;
      filter: drop-shadow(1px 1px 3px $color-secondary);
    }

/* ----- Product Section ----- */
.product {
  display: grid;
  grid-template-columns: 0.9fr 1fr;
  margin: auto;
  padding: 2.5em 0;
  min-width: 600px;
  background-color: white;
  border-radius: 5px;
}

/* ----- Photo Section ----- */
.product__photo {
  position: relative;
}

.photo-container {
  position: absolute;
  left: -2.5em;
  display: grid;
  grid-template-rows: 1fr;
  width: 100%;

  border-radius: 6px;
  box-shadow: 4px 4px 25px -2px rgba(0, 0, 0, 0.3);
}

.photo-main {
  border-radius: 6px 6px 0 0;
  background-color: #9be010;
  background: radial-gradient(#e5f89e, #96e001);

  .controls {
    display: flex;
    justify-content: space-between;
    padding: 0.8em;
    color: #fff;

    i {
      cursor: pointer;
    }
  }

  img {
    position: absolute;
    left: -3.5em;
    top: 2em;
    max-width: 110%;
    filter: saturate(150%) contrast(120%) hue-rotate(10deg)
      drop-shadow(1px 20px 10px rgba(0, 0, 0, 0.3));
  }
}

.photo-album {
  padding: 0.7em 1em;
  border-radius: 0 0 6px 6px;
  background-color: #fff;

  ul {
    display: flex;
    justify-content: space-around;
  }

  li {
    float: left;
    width: 55px;
    height: 55px;
    padding: 7px;
    border: 1px solid $color-secondary;
    border-radius: 3px;
  }
}

/* ----- Informations Section ----- */
.product__info {
  padding: 0.8em 0;
}

.title {
  h1 {
    margin-bottom: 0.1em;
    color: $color-primary;
    font-size: 1.5em;
    font-weight: 900;
  }

  span {
    font-size: 0.7em;
    color: $color-secondary;
  }
}

.price {
  margin: 1.5em 0;
  color: $color-highlight;
  font-size: 1.2em;

  span {
    padding-left: 0.15em;
    font-size: 2.9em;
  }
}

.variant {
  overflow: auto;

  h3 {
    margin-bottom: 1.1em;
  }

  li {
    float: left;
    width: 35px;
    height: 35px;
    padding: 3px;
    border: 1px solid transparent;
    border-radius: 3px;
    cursor: pointer;

    &:first-child,
    &:hover {
      border: 1px solid $color-secondary;
    }
  }

  li:not(:first-child) {
    margin-left: 0.1em;
  }
}

.description {
  clear: left;
  margin: 2em 0;

  h3 {
    margin-bottom: 1em;
  }

  ul {
    font-size: 0.8em;
    list-style: disc;
    margin-left: 1em;
  }

  li {
    text-indent: -0.6em;
    margin-bottom: 0.5em;
  }
}

.buy--btn {
  padding: 1.5em 3.1em;
  border: none;
  border-radius: 7px;
  font-size: 0.8em;
  font-weight: 700;
  letter-spacing: 1.3px;
  color: #fff;
  background-color: $color-highlight;
  box-shadow: 2px 2px 25px -7px $color-primary;
  cursor: pointer;

  &:active {
    transform: scale(0.97);
  }
}

/* ----- Footer Section ----- */
footer {
  padding: 1em;
  text-align: center;
  color: #fff;

  a {
    color: $color-primary;

    &:hover {
      color: $color-highlight;
    }
  }
}</style>
</head>
<body>
	<%@include file="navbarUserHome.jsp"%>
	

<% 
	String mh = request.getParameter("mh");
	String th = request.getParameter("th");
	String image = request.getParameter("image");
	String gia = request.getParameter("gia");
	String hang = request.getParameter("hang");
	String baohanh = request.getParameter("baohanh");

	String maloai = request.getParameter("maloai");

	
%>


<section class="product">
  <div class="product__photo">
    <div class="photo-container">
     
        
        
        <img  alt="green apple slice" style="width: 209px; height: 245px" src="<%=image %>" />
        
      </div>
      <div class="photo-album">
        
      </div>
    </div>
  </div>
  <div class="product__info">
    <div class="title" style="font-weight:900;color:green">
    Tên sản phẩm:  <p style="color:black;font-weight:bold"><%=th %></p>
     
    </div>
    <div style="font-weight:900;color:green" class="title">
    Giá :   <p style="color:black;font-weight:bold"><%=gia %> VNĐ </p>
     
    </div><div style="font-weight:900;color:green" class="title">
    Hãng sản xuất:   <p style="color:black;font-weight:bold"><%=hang%></p>
     
    </div>
    <div style="font-weight:900;color:green" class="title">
    Bảo hành :   <p style="color:black;font-weight:bold"><%=baohanh%></p>
     
    </div>
    <div style="font-weight:900;color:green" class="title">
    Loại sản phẩm:   <p style="color:black;font-weight:bold"><%=maloai%></p>
     
    </div>
    <div class="btn">
    <button   style="font-weight:900;margin:8px" type="button" class="btn btn-primary">
				<a href="giohangController?mh=<%=mh%>&th=<%=th%>&image=<%=image%>&gia=<%=gia%>" style="
    color: black;
">
						THÊM VÀO GIỎ HÀNG </a>
						
</button>
     
   </div>
    
  
    
   
  
    <%-- <a
					href="giohangController?mh=<%=mh%>&th=<%=th%>&image=<%=image%>&gia=<%=gia%>">
						
						
				</a> --%>
    
  </div>
</section>



					
</body>
</html>