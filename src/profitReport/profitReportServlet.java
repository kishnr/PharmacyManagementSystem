/**
 * @author Hbs_adithya(IT18258486)
 *UI/UX Designer
 * SLIIT
 */
package profitReport;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commonUtil.DatabaseConnection;


/**
 * Servlet implementation class profitReportServlet
 */
@WebServlet("/profitReportServlet")
public class profitReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profitReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
		double proftot=0,intot=0,exptot=0;
			
		java.util.Date profdate1 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("profdate1"));
		java.util.Date profdate2 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("profdate2"));
		
		java.sql.Date sqlProfDate1 = new java.sql.Date(profdate1.getTime());
		java.sql.Date sqlProfDate2 = new java.sql.Date(profdate2.getTime());
				
		
		
		Connection conn = DatabaseConnection.initializeDatabase();
		
		
		Statement statement = conn.createStatement();
		String sql1 = "SELECT SUM(monthlytot) FROM monthlyincome where stdate between '"+sqlProfDate1+"' and '"+sqlProfDate2+"' and endate between '"+sqlProfDate1+"' and '"+sqlProfDate2+"'";
		String sql2 = "SELECT SUM(monthlytot) FROM monthlyexpenses where stdate between '"+sqlProfDate1+"' and '"+sqlProfDate2+"' and endate between '"+sqlProfDate1+"' and '"+sqlProfDate2+"'";


		ResultSet resultset1 = statement.executeQuery(sql1);
		if(resultset1.next()) {
			intot = resultset1.getDouble(1);
		}
		
		ResultSet resultset2 = statement.executeQuery(sql2);
		if(resultset2.next()) {
			exptot = resultset2.getDouble(1);
		}
		
		
		proftot = intot - exptot;
		
		
		PreparedStatement st = conn.prepareStatement("insert into monthlyprofit(stdate,endate,monthlyproftot) values(?,?,?)"); 


		st.setDate(1,sqlProfDate1); 
		st.setDate(2,sqlProfDate2);
		st.setDouble(3,proftot);
		

		st.executeUpdate(); 


		st.close(); 
		conn.close(); 
	} 
	catch(Exception e) { 
		e.printStackTrace(); 
	}
		PrintWriter out = response.getWriter(); 

		
		
		RequestDispatcher rd = request.getRequestDispatcher("profitReport.jsp");
		rd.include(request, response);
		
		
		
	}

}
