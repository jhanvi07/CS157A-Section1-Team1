<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>All Products</title>
    </head>
  <body>
  
  
    <h1>All Products</h1>
    
    <table border="1">
      <tr>
        <th>Product ID</th>
		<th>Category ID</th>
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
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?serverTimezone=EST5EDT",user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            out.println("Availible Products <br/><br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM whms.product");
            while (rs.next()) {%>
              <tr>  <td><%=rs.getInt("product_id")%></td>
                <td><%=rs.getInt("category_id")%></td>
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
