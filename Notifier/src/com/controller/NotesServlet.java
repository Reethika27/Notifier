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

import com.util.DBConnection;

@WebServlet("/NotesServlet")
public class NotesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
        String email = request.getParameter("email");
        String sdate = request.getParameter("sdate");
        String edate = request.getParameter("edate");
        String progress = request.getParameter("progress");
        String ndate = request.getParameter("ndate");
        String desc = request.getParameter("desc");
        Connection con = null;
        PreparedStatement preparedStatement = null;         
        try
        {
            con = DBConnection.createConnection();
            System.out.println("Estsblished connection");
           String query="insert into notes (SlNo,Title,Email,StartDate,EndDate,NotifyDate,Description,Progress) values (NULL,?,?,?,?,?,?,?)";  
            preparedStatement = con.prepareStatement(query); 
            preparedStatement.setString(1, title);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, sdate);
            preparedStatement.setString(4, edate);
            preparedStatement.setString(5, ndate);
            preparedStatement.setString(6, desc);
            preparedStatement.setString(7, progress);
            int i= preparedStatement.executeUpdate();
            if (i!=0)  //Just to ensure data has been inserted into the database
            { System.out.println( "SUCCESSFULLY REGISTERED!");
            request.getRequestDispatcher("/notes.jsp").forward(request, response);
            }
            
            }
            catch(SQLException e)
            {
               e.printStackTrace();
            }           
   }


}
