<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>    
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>  
<!DOCTYPE html>
<html>
  <head>
  <title>NOTES</title>
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
 	<div id="abc">
<div id="popupContact"> 
		<div  id="form1" >
			<img src="3.png" id="close" onclick ="div_hide()" />
			<button class="btn btn-primary" onclick="form_show()">ADD NEW NOTE</button>			
		</div>
		
		<form action="NotesServlet" method="get" id="form" >
			<img src="3.png" id="close" onclick ="div_hide()" />
			<h2>NEW NOTE</h2><hr/>
			<table>
			<tr>
			    <td><b>Title</b></td><td><input type="text" name="title" id="title" placeholder="Title"/></td>	
			</tr>
			<tr>
			<td><b>EmailID</b></td><td><input type="text" name="email" id="email" value=<%= session.getAttribute("emailId") %> readonly></td>
			</tr>
			<tr>
			<td><b>Start Date</b></td><td><input type="text" name="sdate" id="sdate" placeholder="StartDate"/></td>
			</tr>
			<tr>
			<td><b>End Date</b></td><td><input type="text" name="edate" id="edate"placeholder="End Date"/></td>
			</tr>
			<tr></tr>
			<tr/>
			<tr>
 			<td><b>Progress</b></td><td>
 			<input type="radio" id="male" name="progress" value="Started">
			<label for="started">Not Started</label><br>
			<input type="radio" id="ended" name="progress" value="Ended">
			<label for="ended">Ended</label><br>
			<input type="radio" id="inprogress" name="progress" value="Inprogress">
			<label for="inprogress">In Progress</label>
			</td>
			</tr>
			<tr>
			<td><b>NotifyDate</b></td><td>
			<input type="text" name="ndate" id="ndate" placeholder="NotifyDate"/></td>
			</tr>
			<tr>
			<td colspan=2><textarea name="desc" placeholder="Description" id="desc"></textarea></td>
			</tr>
		</table>
			 <button class="btn btn-success">SUBMIT</button>
		</form>
 </div> 
 <!-- Popup div ends here -->
 </div>
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
    <div class="center" >
     <button class="btn btn-success" onclick="div_show()">ADD NEW NOTE</button>
     <br><br><br>
     </div>
    <%
    try
    {
       
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/userdb","root","Reethi@27");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT Title, NotifyDate,Progress,Description FROM notes where Email=\""+ session.getAttribute("emailId") +"\"order by title;");
     
    %>
    <div >
    <table class="center" style="text-align:center">

          <tr id="tr">
             <th id="th">TITLE</th>
             <th id="th">NOTIFY DATE</th>
             <th id="th">PROGRESS</th>
             <th id="th">DESCRIPTION</th>
             <th id="th"></th>
          </tr>
        <%while(rs.next())
        {
            %>
            <tr id="tr">
                
                <td id="td"><%=rs.getString(1) %></td>
                <td id="td"><%=rs.getString(2) %></td>
                <td id="td"><%=rs.getString(3) %></td>
                <td id="td"><%=rs.getString(4) %></td>
                <td id="td"><a href="#">View</a><br><a href="#">Delete</a></td>
            </tr>
            <%}%>
        </table><br>
         </div>
    <%}
   
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }
    %>
</body>
</html>

