<%@ page import="java.sql.*"%>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<html>
  <head>
    <title>Login Success</title>
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
        <li><a href="#">Orders</a></li>
        <li><a href="products.html">Products</a></li>
        <li><a href="userpage.jsp">User Page</a></li>
		    <li><a href="search.html">Product Search</a></li>
        <li><a href="generateBill.jsp">Generate Bill</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>


    		<%String username= request.getParameter("username");%>
			<%String password= request.getParameter("pw");%>
			<% session.setAttribute("username", username);%>
			<% session.setAttribute("password", password);%>



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
            ResultSet rs = stmt.executeQuery("SELECT * FROM whms.login WHERE email='" + username+"';");
            /* while (rs.next()) {%>
              <tr>  <td><%=rs.getInt("check")%></td>
				<%
            } */
			rs.next();
			if(rs.getString("email")==null)
			{
			out.println("Invalid password or username.");
			}
			else if(rs.getString("password").equals(password)&&rs.getString("email").equals(username))
			{
			out.println("Welcome " +username);
			}
			else{
			out.println("Invalid password or username.");
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
