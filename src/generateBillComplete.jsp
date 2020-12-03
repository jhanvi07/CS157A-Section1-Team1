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
            String pw = "cs157acs157a";


            // Alter table to be auto increment.

            try {
                java.sql.Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?serverTimezone=EST5EDT",user, pw);
                Statement stmt = con.createStatement();
                ResultSet rsSet = stmt.executeQuery("SELECT * FROM whms.login WHERE email='" + username+"' and password='"+password+"';");
                rsSet.next();
                int user_id=rsSet.getInt("user_id");

                rsSet = stmt.executeQuery("SELECT * FROM whms.product WHERE product_name='" + product + "';");
                rsSet.next();
                int price = rsSet.getInt("unit_price");

                int quantityInt = Integer.parseInt(quantity);
                price = price * quantityInt;

                int rs = stmt.executeUpdate("INSERT INTO whms.billing_info (user_id, total) VALUES ("+ user_id + ", " + price + ")");

                %><h1>Generating bill complete</h1><%

                stmt.close();
                con.close();
            } catch(SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
                %><h1>Generating bill failed</h1><%
            }
        %>

    </body>
</html>