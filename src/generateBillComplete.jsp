<%@ page import="java.sql.*"%>

<html>
    <head>
        <title>Generate Bill Complete</title>
    </head>
    <body>
        <%String username= request.getParameter("username");%>
        <%String password= request.getParameter("pw");%>
        <%String user_id = requiest.getParameter("user_id") %>
        <% session.setAttribute("username", username);%>
        <% session.setAttribute("password", password);%>
        <%session.setAttribute("user_id", user_id);%>
        <a href="generateBill.jsp" class="btn btn-primary">Return to homepage</a>
        <%
            String db = "whms";
            String user; // assumes database name is the same as username
            user = "root";
            String password = "cs157acs157a";


            // Alter table to be auto increment.

            try {
                java.sql.Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs157a?serverTimezone=EST5EDT",user, password);
                Statement stmt = con.createStatement();
                int rs = stmt.executeUpdate("INSERT INTO whms.billing_info (user_id, total) VALUES ("+ user_id + ", 500)");

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