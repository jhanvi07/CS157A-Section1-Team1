<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<html>
  <head>
    <title>Tracked Order</title>
    </head>
  <body>
    <div class="container" style="margin-top: 5vh;">
    <a href="orders.jsp" class="btn btn-primary" style="margin-bottom: 20px;">Return to track orders</a>
    <%String order_id= request.getParameter("order_id");%>
    <h1>Order Info</h1>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Product ID</th>
                <th>Category ID</th>
                <th>Units</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
    <%
		String db = "whms";
        String user; // assumes database name is the same as username
          user = "root";
        String password = "cs157acs157a";
        try {
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?serverTimezone=EST5EDT",user, password);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM whms.Order_info WHERE order_id='" + order_id +"'");
            while (rs.next()) {%>
              <tr>  <td><%=rs.getInt("order_id")%></td>
                <td><%=rs.getInt("user_id")%></td>
                <td><%=rs.getInt("product_id")%></td>
				<td><%=rs.getInt("category_id")%></td>
				<td><%=rs.getInt("units")%></td>
                <td><%=rs.getDate("date")%></td>
				<%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
    </tbody>
    </table>

    <h1>Tracking Info</h1>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Time</th>
                <th>Address ID</th>
                <th>Address</th>
            </tr>
        </thead>
        <tbody>
    <%
        try {
            java.sql.Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?serverTimezone=EST5EDT",user, password);
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM whms.tracking_info WHERE order_id='" + order_id +"'");
            while (rs.next()) {%>
              <tr>  <td><%=rs.getInt("order_id")%></td>
                <td><%=rs.getDate("date")%></td>
                <td><%=rs.getTime("time")%></td>
				<td><%=rs.getInt("address_id")%></td>
				<td><%=rs.getString("address")%></td>
				<%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        }
    %>
    </tbody>
    </table>
    </div>
  </body>
</html>
