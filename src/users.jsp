<%@ page import="java.sql.*"%>

<html>
  <head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<html>
  <head>
    <title>Users</title>
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
		<li><a href="addProduct.jsp">Update Product</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> Log out</a></li>
      </ul>
    </div>
  </div>
</nav>
    </head>
  <body>
    		<%String type= request.getParameter("type");%>
			<%String search= request.getParameter("search");%>
			
  
    <h1>Users</h1>
    
    <table border="1">
      <tr>
        <th>User ID</th>
		<th>User Type</th>
		<th>Email</th>
		<th>Phone Number</th>
		<th>Website</th>
		<th>Address</th>
   </tr>
    <% 
		String db = "whms";
        String user; // assumes database name is the same as username
          user = "root";
        String pw = "Bobby";
		

        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cs157a?serverTimezone=EST5EDT",user, pw);

            
            Statement stmt = con.createStatement();
            String q;
			if(search.isEmpty())
			{
				q="SELECT * FROM whms.user,whms.address WHERE user.address_id=address.address_id AND user_type LIKE '"+type+"';";
			}
			else
			{
				out.println("Search results for "+type+" containing: "+search+"<br/>");
				q="SELECT * FROM whms.user,whms.address WHERE user.address_id=address.address_id AND user_type LIKE '"+type+"' AND user_name LIKE '%"+search+"%';";
			}
			ResultSet rs = stmt.executeQuery(q);
            while (rs.next()) {%>
              <tr>  <td><%=rs.getInt("user_id")%></td>
                <td><%=rs.getString("user_type")%></td>
                <td><%=rs.getString("email")%></td>
				<td><%=rs.getString("phone_no")%></td>
				<td><%=rs.getString("website")%></td>
				<td><%=rs.getString("address")%></td>
			<%
			}
			
			
            rs.close();
            stmt.close();
            con.close();
         }catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
	
  </body>
  <li><a href="users.html">return</a></li>
</html>
