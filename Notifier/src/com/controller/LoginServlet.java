package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.LoginBean;
import com.bean.RegisterBean;
import com.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "LoginServlet1", urlPatterns = { "/LoginServlet1" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	         String email = (String)request.getParameter("email");
	         String password = request.getParameter("password");
	         LoginBean loginBean = new LoginBean();
	          loginBean.setEmail(email);
	          loginBean.setPassword(password); 
	          HttpSession session = request.getSession();
	          session.setAttribute("emailId", email);
	          System.out.println(session.getAttribute("emailId"));
	         Connection con = null;
	         PreparedStatement preparedStatement = null;         
	         try
	         {
	             con = DBConnection.createConnection();
	             System.out.println("Estsblished connection");
	             String query = "select * from users where Email =\""+email+"\"and password=\""+password+"\"";
	            String query1="select userName from users where Email=\""+email+"\"";
	             Statement stmt=con.createStatement();  
	             ResultSet rs=stmt.executeQuery(query);
	             if(rs.next())
	             {
	            	 rs=stmt.executeQuery(query1);
	            	 if(rs.next()) {
	            	 String username=rs.getString("userName");
	            	 session.setAttribute("username", username);
	   	               System.out.println(session.getAttribute("username"));
	            	 }
	            	 request.getRequestDispatcher("/notebooks.jsp").forward(request, response);
	             }
	             
	             else
	             { 
	            	 request.setAttribute("errMessage", "Invalid username or password"); 
	                 request.getRequestDispatcher("/Login.jsp").forward(request, response);
	             }  
	             
	            
	         }
	         catch(SQLException e)
	         {
	            e.printStackTrace();
	         }    
        }

}
