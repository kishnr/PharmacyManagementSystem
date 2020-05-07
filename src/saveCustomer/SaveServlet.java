/**
 * @author Hbs_adithya(IT18258486)
 *UI/UX Designer
 * SLIIT
 */
package saveCustomer;

import java.io.IOException; 
import java.sql.*;
import java.io.PrintWriter; 
import java.sql.Connection; 
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.annotation.WebServlet; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

// Import Database Connection Class file 
import saveCustomer.DatabaseConnection; 



@WebServlet("/SaveServlet") 
public class SaveServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L; 

	protected void doPost(HttpServletRequest request, 
HttpServletResponse response) 
		throws ServletException, IOException 
	{ 
		
			
		
		try { 

			 
			Connection con = DatabaseConnection.initializeDatabase(); 

			
			PreparedStatement st = con.prepareStatement("insert into customerdetails(cname,ctype,mobileno,email) values(?,?,?,?)"); 

			  
			st.setString(1, String.valueOf(request.getParameter("cname"))); 
			st.setString(2, String.valueOf(request.getParameter("ctype"))); 
			st.setInt(3, Integer.valueOf(request.getParameter("mobileno"))); 
			st.setString(4, request.getParameter("email")); 

		
			int i = st.executeUpdate(); 
			
			st.close(); 
			con.close(); 
			
			PrintWriter out = response.getWriter();
			
				
				out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
				out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
				out.println("<script>");
				out.println("$(document).ready(function(){");
				out.println("swal ( 'Update Successfully' ,  '' ,  'success' );");
				out.println("});");
				out.println("</script>"); 
			RequestDispatcher rd = request.getRequestDispatcher("add.jsp");
			rd.include(request, response);
			
		} 
		catch (Exception e) { 
			e.printStackTrace(); 
		} 
	} 
} 
