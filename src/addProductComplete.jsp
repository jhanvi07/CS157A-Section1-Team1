<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        <li><a href="orders.jsp">Orders</a></li>
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





			<%String name= request.getParameter("name");%>
			<%String description= request.getParameter("description");%>
			<%String price= request.getParameter("price");%>
			<%String category= request.getParameter("category");%>
			<%int intCategory=Integer.parseInt(category);%>
      <%double decPrice = Double.parseDouble(price); %>
<%
String db = "whms";
String user; // assumes database name is the same as username
  user = "root";
String pw = "cs157acs157a";

try {
  java.sql.Connection con;
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/cs157a?serverTimezone=EST5EDT",user, pw);
	Statement stmt = con.createStatement();

		PreparedStatement ps = null;
		int rs = stmt.executeUpdate("INSERT INTO whms.product (category_id, product_name, description, unit_price) VALUES ('" + intCategory + "','" + name + "','" + description +  "','" + decPrice + "');");
    %><h1>Adding product complete</h1><%
} catch (SQLException e) {
  %><h1>Adding product failed</h1><%
  out.println("SQLException caught: " + e.getMessage());
}




%>
<%-- <li><a href="editprofile.html"> Edit Profile</a></li> --%>

</body>
</html>
