package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.LoginBean;
import com.util.DBConnection;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	String fname = request.getParameter("fname");
    	String email = request.getParameter("email");
        String uname = request.getParameter("uname");
        String opass = request.getParameter("opass");
        String npass = request.getParameter("npass");
        Connection con = null;        
        try
        {
            con = DBConnection.createConnection();
            System.out.println("Estsblished connection");
           String query="UPDATE users SET SlNo=NULL, \n fullName=\""+fname+"\" ,\n Email=\""+email+"\", \n userName=\""+uname+"\",\n password=\""+npass+"\" where email=\""+email+"\";";
            Statement stmt=con.createStatement();  
           stmt.executeUpdate(query);
           request.setAttribute("msg", "User details updated successfully!!!");
           request.getRequestDispatcher("/user.jsp").forward(request, response);
    
        }
        catch(SQLException e)
        {
           e.printStackTrace();
        }    
   }

}
