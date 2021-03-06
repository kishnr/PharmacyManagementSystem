<!--* @author Hbs_adithya(IT18258486)
 *UI/UX Designer
 * SLIIT-->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "customer";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Responsive vertical menu navigation</title>
		<!--  <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:700, 600,500,400,300' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
		<link rel="stylesheet" href="./style/main.css">

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-2.2.0.min.js"></script>
		<script src="https://kit.fontawesome.com/b7e89b71b3.js"></script>
		<script src="https://code.highcharts.com/highcharts.js"></script>
		<script src="https://code.highcharts.com/modules/data.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
		<script src="main.js"></script>

		<style>
			.ad {
				position: absolute;
				width: 300px;
				height: 250px;
				border: 1px solid #ddd;
				left: 50%;
				transform: translateX(-50%);
				top: 250px;
				z-index: 10;
			}
			.ad .close {
				position: absolute;
				font-family: 'ionicons';
				width: 20px;
				height: 20px;
				color: #fff;
				background-color: #999;
				font-size: 20px;
				left: -20px;
				top: -1px;
				display: table-cell;
				vertical-align: middle;
				cursor: pointer;
				text-align: center;
			}
		</style>
		

	</head>
	<body>
		<div class="header">
			<div class="logo">
				
				<span>Brand</span>
			</div>
			<a href="#" class="nav-trigger"><span></span></a>
		</div>
		<div class="side-nav">
			<div class="logo">
				
				<span>LuckyLand Pharmacy</span>
			</div>
				<ul>
					<li>
						<a href="dashboard.jsp">
							<span></span>
							<span>Dashboard </span>
						</a>
					</li>
					<li class="active">
						<a href="add.jsp">
							<span></span>
							<span>Customer </span>
						</a>
					</li>
					<li>
						<a href="addStocks.jsp">

							
							<span>Stock </span>
						</a>
					</li>
					<li >
						<a href="addItem.jsp">
							
							<span>Item </span>
						</a>
					</li>
					<li>
						<a href="addSup.jsp">
							
							<span>Supplier </span>
						</a>
					</li>
					<li>
						<a href="addSupplierOrders.jsp">
							
							<span>Supplier Order </span>
						</a>
					</li>
					<li>
						<a href="#">
							
							<span>Customer Order</span>
						</a>
					</li>
					<li>
						<a href="#">
							
							<span>Employee </span>
						</a>
					</li>
					<li>
						<a href="addUtility.jsp">
							
							<span>Finance </span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
		<div class="main-content">
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
				
						
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
						  <span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
						  <ul class="navbar-nav">
							<li class="nav-item ">
							  <a class="nav-link" href="add.jsp">Add Customer <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item">
							  <a class="nav-link" href="view.jsp">View Customer</a>
							</li>
							<li class="nav-item active">
							  <a class="nav-link" href="manageCustomer.jsp">Manage Customer</a>
							</li>
							<li class="nav-item">
							  <a class="nav-link disabled" href="ReportCustomers.jsp">Reports</a>
							</li>
							
						  </ul>
						  
						</div>
					  </nav>

					  <br>
					  
					  <div class="ex1">
			  				<div class="searchCustomer" style="margin-left:12px;">
							<form class="form-inline" action="SearchResultManage.jsp">
							  <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search Number" aria-label="Search">
							  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
							</form>
							</div>
							<table id="mytable" class="table table-bordred table-striped">
								 
								 <thead>
								 
								 
								 <th>ID</th>
								  <th>Name</th>
								   <th>Type</th>
								   <th>Mobile No</th>
								   <th>Email</th>
									<th>Edit</th>
									
									 <th>Delete</th>
								 </thead>
								 <%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from customerdetails";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
				  <tbody>
				  
				  <tr>
				  
				  <td><%=resultSet.getInt("id") %></td>
				  <td><%=resultSet.getString("cname") %></td>
				  <td><%=resultSet.getString("ctype") %></td>
				  <td><%=resultSet.getInt("mobileno") %></td>
				  <td><%=resultSet.getString("email") %></td>
				  <td><a href="UpdateCustomer.jsp?id=<%=resultSet.getString("id")%>"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-pencil-alt"></span></button></p></td>
				 
				  <td><a href="DeleteCustomer.jsp?id=<%=resultSet.getString("id") %>"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" onclick="return confirm('are you sure to continue?')" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				  
				  </tr>
				  
				  <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
			   				 				 		
				  
				  </tbody>
					  
			  </table>
			
			
		</div>
		<script>
			function confirmComplete(){
				alert("confirmComplete");
				var answer = confirm("Are you sure you want to continue");
				if(answer==true){
					return true;
				}else{
					return false;
				}
			}
		</script>
	</body>
</html>