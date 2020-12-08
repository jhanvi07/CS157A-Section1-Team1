<%@ page import="java.sql.*"%>

<html>
    <head>
        <title>Generate Bill Complete</title>
    </head>
    <body>
        <% String username = (String)session.getAttribute("username");%>
        <% String password = (String)session.getAttribute("password");%>

        <% session.setAttribute("username", username);%>
        <% session.setAttribute("password", password);%>

        <%String product = request.getParameter("product_select");%>
        <%String quantity = request.getParameter("quantity");%>

        <a href="generateBill.jsp" class="btn btn-primary">Return to homepage</a>
        <%
            String db = "whms";
            String user; // assumes database name is the same as username
            user = "root";
            String pw = "Bobby";


            // Alter table to be auto increment.

            try {
                java.sql.Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?serverTimezone=EST5EDT",user, pw);
                Statement stmt = con.createStatement();
                ResultSet rsSet = stmt.executeQuery("SELECT * FROM whms.login WHERE email='" + username+"' and password='"+password+"';");
                int user_id = 0;
                if (rsSet.next()) { user_id=rsSet.getInt("user_id"); }
                else { out.println("no userid found"); }

                rsSet = stmt.executeQuery("SELECT * FROM whms.product WHERE product_name='" + product + "';");
              
                double price = 0;
                int product_id = 0;
                int category_id = 0;
                if (rsSet.next()) { price = rsSet.getDouble("unit_price"); product_id = rsSet.getInt("product_id"); category_id = rsSet.getInt("category_id"); }
                else { out.println("no product with product name");}

                double quantityInt = Double.parseDouble(quantity);
                price = price * quantityInt;

                int rs = stmt.executeUpdate("INSERT INTO whms.billing_info (user_id, total) VALUES ("+ user_id + ", " + price + ")");

                rsSet = stmt.executeQuery("SELECT * FROM whms.billing_info ORDER BY order_id desc LIMIT 1");
                int order_id = 0;
                if (rsSet.next()) { order_id = rsSet.getInt("order_id"); }
                else { out.println("Couldn't find most recent order. Table is potentially empty?"); }


                int rs2 = stmt.executeUpdate("INSERT INTO whms.Order_info (order_id, user_id, product_id, category_id, units, date) VALUES (" + order_id + "," + user_id + "," + product_id + "," +  category_id + ","  + Integer.parseInt(quantity) + "," + "now()" + ")");


                rsSet = stmt.executeQuery("SELECT * FROM whms.address WHERE address_id= (SELECT address_id FROM whms.user WHERE user_id='"+user_id+"')");
                String addressString = "";
                if (rsSet.next()) { addressString = rsSet.getString("address") + ""; }
                else {  out.println("Couldn't find matching address"); }
                int rs3 =  stmt.executeUpdate("INSERT INTO whms.Tracking_info (order_id, date, time, address_id, address) VALUES(" + order_id + ", now(), now()," + user_id + ",'" + addressString + "')");

                %><h1>Generating bill complete: Your order ID is: </h1><%
                %><h1><%out.print(order_id);%></h1><%
                stmt.close();
                con.close();
            } catch(SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
                %><h1>Generating bill failed</h1><%
            }
        %>

    </body>
</html>
