<%@ page import="java.sql.*"%>

<html>
  <head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<html>
  <head>
    <title>All Products</title>
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
			<%String sort= request.getParameter("sort");%>
			
  
    <h1>Search Results</h1>
    
    <table border="1">
      <tr>
        <th>Product ID</th>
		<th>Category Name</th>
		<th>Product Name</th>
		<th>Description</th>
		<th>Unit Price</th>
   </tr>
    <% 
		String db = "whms";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "Bobby";
		

        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cs157a?serverTimezone=EST5EDT",user, password);

            out.println("Search results for "+type+" containing: "+search+"<br/>");
            Statement stmt = con.createStatement();
            String q;
			if(sort.isEmpty())
			{
				q="SELECT * FROM whms.product, whms.category WHERE product.category_id=category.category_id AND "+type+" LIKE '%" + search +"%'";
			}
			else
			{
				
				q="SELECT * FROM whms.product, whms.category WHERE product.category_id=category.category_id AND "+type+" LIKE '%" + search +"%' ORDER BY "+sort+";";
				out.println("sort by: "+sort+"<br/>");
			}
			ResultSet rs = stmt.executeQuery(q);
            while (rs.next()) {%>
              <tr>  <td><%=rs.getInt("product_id")%></td>
                <td><%=rs.getString("category_name")%></td>
                <td><%=rs.getString("product_name")%></td>
				<td><%=rs.getString("description")%></td>
				<td><%=rs.getString("unit_price")%></td>
				<%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  </body>
</html>
