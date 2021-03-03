<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <!-- <title>Slider Menu Bar CSS</title> -->
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style> 
	.button { 
	height: 50px; 
	width: 100px; 
	} 
	</style> 
  </head>
  <body>
  
  	<div align="right">
  	<a href="#"><i class="fas fa-bell"  style="font-size:30px;color:red"></i></a>
  	<i>  </i>
  	<i class="fas fa-sign-out-alt"><button type="button" name="logout" style="height:35px;width=30px" onclick="window.location='Login.jsp';">LOGOUT</button></i>
  	</div>
    <input type="checkbox" id="check">
    <label for="check">
      <i class="fas fa-bars" id="btn"></i>
      <i class="fas fa-times" id="cancel"></i>
      
    </label>
    <div class="sidebar">
    <header>Hi <%= session.getAttribute("username") %>!!!</header>
  <ul>
<li><a href="notebooks.jsp"><i class="fas fa-qrcode"></i>NOTEBOOKS</a></li>
<li><a href="notes.jsp"><i class="fas fa-stream"></i>NOTES</a></li>
<li><a href="user.jsp"><i class="fas fa-edit"></i>EDIT USER</a></li>
<li></li>
</ul>
</div>
<section></section>
  </body>
</html>
