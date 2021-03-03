<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>    
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>  
<!DOCTYPE html>
<html>
  <head>
  <title>USER DETAILS</title>
    <meta charset="utf-8">
    
    <!-- <title>Slider Menu Bar CSS</title> -->
    <link rel="stylesheet" href="css/style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet"  href="css/elements.css" />
	<script src="js/my_js.js"></script>
    <style>
header {
  text-align: center;
}
.center {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-left: auto;
  margin-right: auto;
  border: 3;
  
}
 #th{
  background-color:  #D2B48C;;
  width:100px;
  height:100px;
   padding: 25px;
 }
 #tr{
  padding: 25px;
 }
 #td{
 background-color: #FFEBCD;
  width:100px;
  height:100px;
}
	</style> 
  </head>
  <body>
  	<div align="right" >
  	<a href="#"><i class="fas fa-bell"  style="font-size:30px;color:red"></i></a>
  	<i>  </i>
  	
  	  <button type="button" class="btn btn-primary" onclick="window.location='Login.jsp';">LOGOUT</button>
  
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
    <%
    try
    {
       
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/userdb","root","Reethi@27");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT fullName,Email,userName,password FROM users where Email=\""+ session.getAttribute("emailId") +"\";");
     
    %>
    <div >
    <center><h2><b style="font-size:20px;color:green"><%=(request.getAttribute("msg") == null) ? ""
         : request.getAttribute("msg")%></b></h2></center>
    <form class="center" action="UpdateServlet" method="post" id="form" >
    
    <table class="center" style="text-align:center">
     
        <%if(rs.next())
        {
            %>
            <tr><td colspan=2><H1 ><b>USER DETAILS</b></H1></td></tr>
                
                <tr><td ><h4>FULLNAME:</h4> </td><td><input type="text" name="fname" value=<%=rs.getString(1) %>></td></tr>
                <tr ><td ><h4>EMAIL ID:</h4> </td><td><input type="text" name="email" value=<%=rs.getString(2) %> readonly></td></tr>
            	 <tr><td ><h4>USERNAME:</h4> </td><td><input type="text" name="uname" value=<%=rs.getString(3) %>></td></tr>
            	  <tr ><td ><h4> OLD PASSWORD:</h4> </td><td><input type="password" name="opass"></td></tr>
            	  <tr ><td ><h4> NEW PASSWORD:</h4> </td><td><input type="password" name="npass"></td></tr>
            	 <tr><td><br></td><td><br></td></tr>
            	  <tr><td colspan=2><button class="btn btn-success">SUBMIT</button></td></tr>
            <%}%>
          
        </table>  
        <br><br>
         
        
        </form><br>
         </div>
    <%}
   
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    %>
</body>
</html>

