<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Warehouse Recent Orders</title>
    </head>
  <body>
  
  		<%String query= request.getParameter("user_id");%>
  
    <h1>Recent orders</h1>
    
    <table border="1">
      <tr>
        <th>Order #</th>
		<th>User ID</th>
		<th>Product ID</th>
		<th>Category ID</th>
		<th>Units</th>
		<th>Date</th>
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
            out.println("Orders for user ID: "+query+"<br/><br/>");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM whms.order_info WHERE user_id="+query);
            while (rs.next()) {%>
              <tr>  <td><%=rs.getInt("order_id")%></td>
                <td><%=rs.getInt("user_id")%></td>
                <td><%=rs.getInt("product_id")%></td>
				<td><%=rs.getString("category_id")%></td>
				<td><%=rs.getInt("units")%></td>
				<td><%=rs.getDate("date")%></td></tr>
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
