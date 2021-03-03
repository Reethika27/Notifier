<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>
    
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>  
<!DOCTYPE html>
<html>
  <head>
  <title>NOTEBOOKS</title>
    <meta charset="utf-8">
    
    <!-- <title>Slider Menu Bar CSS</title> -->
   
    <link rel="stylesheet" href="css/style.css">
     <script src="https://kit.fontawesome.com/a076d05399.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   
    <link rel="stylesheet"  href="css/elements.css" />
    <style> 
	.button { 
	height: 50px; 
	width: 100px; 
	} 
	header {
  text-align: center;
}
.center {
  margin-left: auto;
  margin-right: auto;
  border: 3;
}
 th{
  background-color:  #D2B48C;;
  width:150px;
  height:100px;
   padding: 25px;
 }
 tr{
  padding: 25px;
 }
 td{
 background-color: #FFEBCD;
  width:150px;
  height:100px;
}
	</style> 
  </head>
  <body>
  
  	<div align="right">
  	<a href="#"><i class="fas fa-bell"  style="font-size:30px;color:red"></i></a>
  	<i>  </i>
  <button type="button" class="btn btn-primary" onclick="window.location='Login.jsp';">LOGOUT</button>  	</div>
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
<body align="center">
 	<header><H1><b>AVAILABLE NOTEBOOKS</b></H1></header>
    <%
    try
    {
       
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/userdb","root","Reethi@27");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT COUNT(SlNo), Title FROM notes where Email=\""+ session.getAttribute("emailId") +"\" GROUP BY Title;");
     
    %>
    <br><br><br><br><br>
    <table  class="center" style="text-align:center" b>
         <div>
             <tr >
            
             <th>TITLE</th>
             <th>NO.OF TASKS</th>
             <th></th>
          </tr>
          
         
        <%while(rs.next())
        {
            %>
            <div>
            <tr>
               
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(1) %></td>
                <td><a href="notes.jsp" >View</a></td>
                
            </tr>
              </div>
            <%}%>
          
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    %>
</body>
</html>

