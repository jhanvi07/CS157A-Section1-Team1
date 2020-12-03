<%@ page import="java.sql.*"%>
<html>
  <head>
    <title>Generate Bill</title>
    <link rel="stylesheet" href="bootstrap-4.5.3-dist/css/bootstrap.min.css">
</head>
  <body>
    <%-- <%String category= request.getParameter("billing_info");%> --%>


    <a href="index.html" class="btn btn-primary">Return to home</a>

    <div class="container">
        <div class="row mt-3">
            <form class="offset-sm-4 col-sm-4" action="/generateBillComplete.jsp" method="POST">
                <select class="form-control" name="product_select" id="product_select">
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
                        ResultSet rs = stmt.executeQuery("SELECT * FROM whms.product");
                        while (rs.next()) {%>
                            <option><%=rs.getString("product_name")%></option>
                            <%
                        }
                        rs.close();
                        stmt.close();
                        con.close();
                    } catch(SQLException e) {
                        out.println("SQLException caught: " + e.getMessage());
                    }
                %>
                </select>
                <input type="number" class="form-control" placeholder="Quantity" min="1" name="quantity" id="quantity">
                <button class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>



  </body>
</html>
