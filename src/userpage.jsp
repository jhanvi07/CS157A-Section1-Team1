<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"><img src="https://pbs.twimg.com/profile_images/1061714658321588224/wxfzDrCe.jpg" alt="" width="24" height="24"</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="index.html">Index</a></li>
        <li><a href="generateBill.jsp">Orders</a></li>
        <li><a href="products.html">Products</a></li>
        <li><a href="userpage.jsp">User Page</a></li>
		<li><a href="search.html">Product Search</a></li>
		<li><a href="update.jsp">Update Product</a></li>
		<li><a href="addProduct.jsp">Add Product</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> Log out</a></li>
      </ul>
    </div>
  </div>
</nav>

<% String username = (String)session.getAttribute("username");%>
<% String password = (String)session.getAttribute("password");%>



<h2>User Profile</h2>
Email: <%out.println(username);%></br>

<%
try{
String db = "whms";
        String user; // assumes database name is the same as username
          user = "root";
        String pw = "Bobby"; 
		
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cs157a?serverTimezone=EST5EDT",user, pw);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM whms.login WHERE email='" + username+"' and password='"+password+"';");
			rs.next();
			int user_id=rs.getInt("user_id");
			rs = stmt.executeQuery("SELECT * FROM whms.user WHERE user_id='" + user_id+"';");
			rs.next();
			String name = rs.getString("user_name");
			out.println("Name: "+ name);
			
			String phone = rs.getString("phone_no");
			out.println("<br/> Phone number: "+phone);
			
			if(rs.getString("website")!=null)
			{
				String website=rs.getString("website");
				out.println("<br/> Website: "+ website);
			}
			
			String user_type = rs.getString("user_type");
			out.println("<br/> User type: "+user_type);
			
			int address_id = rs.getInt("address_id");
			
			rs = stmt.executeQuery("SELECT * FROM whms.address WHERE address_id='" + address_id+"';");
			rs.next();
			
			String address = rs.getString("address");
			out.println("<br/> Address: "+address);
			
			session.setAttribute("user_id", user_id);
			%>
			<li><a href="editprofile.html"> Edit Profile</a></li>
			
			<h2>Recent orders </h2>
					<table border="1">
			  <tr>
				<th>Order #</th>
				<th>Product ID</th>
				<th>Category ID</th>
				<th>Units</th>
				<th>Date</th>
		   </tr>
		   <%
			
            rs = stmt.executeQuery("SELECT * FROM whms.order_info WHERE user_id="+user_id);
            while (rs.next()) {%>
              <tr>  
				<td><%=rs.getInt("order_id")%></td>
                <td><%=rs.getInt("product_id")%></td>

				<td><%=rs.getString("category_id")%></td>
				<td><%=rs.getInt("units")%></td>
				<td><%=rs.getDate("date")%></td></tr>
				<%
            }
			
			
			
}			
catch(SQLException e) {
	if(username==null)
	{
		out.println("Please log in.");
	}
        }			
%>


</body> 
</html>
