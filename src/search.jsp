<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
  <head>
    <title>All Products</title>
    </head>
  <body>
    		<%String type= request.getParameter("type");%>
			<%String search= request.getParameter("search");%>
  
    <h1>All Products</h1>
    
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
            out.println(db + " database successfully opened.<br/><br/>");
            out.println("Availible Products <br/><br/>");
            out.println("Search results for: "+search+"<br/><br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM whms.product, whms.category WHERE product.category_id=category.category_id AND product_name LIKE '%" + search +"%'");
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
