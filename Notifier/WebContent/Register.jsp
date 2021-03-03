<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/my_js.js"></script>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 50%;
  margin-bottom: 15px;
  align:center;
  justify-content: center;
  align-items: center;
  margin-left: auto;
  margin-right: auto;
  border: 3;
  
}

.icon {
  padding: 10px;
  background: dodgerblue;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 50%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color: green;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 25%;
  opacity: 0.9;
}
.btn1 {
  background-color: red;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 25%;
  opacity: 0.9;
}
.btn:hover {
  opacity: 1;
}
body {
  background-image: url('css/background.jpg');

  background-position: center;
  background-size: cover;
  height: 100vh;
  transition: all .5s;
  font-family: 'Roboto', sans-serif;
}
b,h2{
color:#0000CD;

}
h3,a
{
color:#ffffff;
}
</style>
</head>
<body>
<center><h2><b >REGISTRATION FORM </b></h2></center>
<center><b style="font-size:20px;color:red"><%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%></b></center>
<center>
  <form name="form" action="RegisterServlet" method="post" onsubmit="return validate()" >
  <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text"  placeholder="FullName" name="fullname" required>
  </div>

  <div class="input-container">
    <i class="fa fa-envelope icon"></i>
    <input class="input-field" type="text" placeholder="Email" name="email" required>
  </div>
  
  <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="UserName" name="userName" required>
  </div>
    <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Password" name="password" required>
  </div>
  
    <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Confirm Password" name="conpassword" required>
  </div>
  

  <button type="submit" class="btn">REGISTER</button>
  <br><br>
  <button  type="Reset" class="btn1">RESET</button>
  <br><br>
  <h3>Already a member </h3> <a href ="Login.jsp">Login</a>
</form>
</center>
</body>
</html>